module Codegen.TS.MUI where

import Prelude
import Codegen.AST (Declaration, Ident(..), ModuleName(..), TypeF(..), TypeName(..))
import Codegen.AST (Module(..), RowF(..), Type, TypeName(..), Union(..), Expr) as AST
import Codegen.AST.Sugar (declForeignData, declForeignValue, declType, declValue)
import Codegen.AST.Sugar.Expr (app, ident) as Expr
import Codegen.AST.Sugar.Type (app, arr, constructor, row, string, typeRow, var) as Type
import Codegen.AST.Sugar.Type (arr) as T
import Codegen.AST.Sugar.Type (constrained, forAll, forAll', forAllWith, recordApply)
import Codegen.Model (Component, ComponentName, ModulePath, componentFullPath, jsImportPath, psImportPath, reactComponentApply)
import Codegen.Model (componentName, jsx) as Model
import Codegen.TS.Module (PossibleType(..), astAlgebra, buildAndInstantiateDeclarations, exprUnsafeCoerce, unionDeclarations) as TS.Module
import Codegen.TS.Module (exprUnsafeCoerce)
import Codegen.TS.Types (InstanceProps, InstantiationStrategy(..), M)
import Control.Monad.Error.Class (throwError)
import Control.Monad.Except (except, runExceptT)
import Control.Monad.State (runState)
import Control.Monad.Writer (execWriter)
import Control.Monad.Writer.Class (tell)
import Data.Array (cons, elem, filter, fromFoldable, null, singleton, tail, toUnfoldable) as Array
import Data.Either (Either(..))
import Data.Foldable (foldr)
import Data.Functor.Mu (Mu(..)) as Mu
import Data.Functor.Mu (roll)
import Data.List (List(..), fromFoldable, singleton) as List
import Data.List (List)
import Data.Map (filterKeys, fromFoldable, keys, lookup, singleton, Map) as Map
import Data.Map.Internal (keys) as Map.Internal
import Data.Maybe (Maybe(..), fromMaybe, isJust, maybe)
import Data.Newtype (unwrap)
import Data.Set (member) as Set
import Data.String (joinWith)
import Data.String.Extra (camelCase)
import Data.Traversable (for)
import Data.Tuple (Tuple(..))
import Matryoshka (cata, cataM)
import ReadDTS.Instantiation (Property, Type, TypeF(..)) as ReadDTS.Instantiation
import ReadDTS.Instantiation.Pretty (pprintTypeName)
import Unsafe.Coerce as Unsafe.Coerce
import Codegen.TS.Debug as Codegen.TS.Debug
import Data.Identity as Data.Identity
import Debug.Trace as Debug.Trace
import Matryoshka (AlgebraM)
import Codegen.TS.Module
import ReadDTS.Instantiation.Pretty as ReadDTS.Instantiation.Pretty

type TsImportPath
  = String

tsImportPath :: ModulePath -> TsImportPath
tsImportPath modulePath = "@material-ui/core/" <> (jsImportPath modulePath)

propsTypeName :: ComponentName -> String
propsTypeName componentName = componentName <> "Props"

foreignReactComponentDecl :: ComponentName -> { declaration :: Declaration, ident :: Ident, var :: AST.Expr }
foreignReactComponentDecl componentName = { declaration, ident, var }
  where
  ident = Ident ("_" <> componentName)

  { declaration, var } = declForeignValue (ident) (forAll' "a" reactComponentApply)

componentProps ::
  Component ->
  M InstanceProps
componentProps component@{ modulePath } = do
  tsDeclarations <-
    TS.Module.buildAndInstantiateDeclarations
      { path: instanceModulePath
      , source: Just source
      }
  case Map.lookup instanceTypeName tsDeclarations, component.propsType.instantiation of
    Nothing, _ ->
      throwError $ Array.singleton
        $ line
            [ "Unable to find generated props instance type:", show instanceTypeName ]
    Just ds, Just { extractProps } -> except $ extractProps ds.defaultInstance
    Just { defaultInstance: Mu.In (ReadDTS.Instantiation.Object n props), typeConstructor }, _ -> do
      pure { fqn: n, props }
    Just { defaultInstance }, _ ->
      throwError $ Array.singleton
        $ lines
            [ line
                [ "Props instance type"
                , show instanceTypeName
                , "is not an object. Derived type is: "
                , show $ cata pprintTypeName defaultInstance
                ]
            , "Generated ts source code was:"
            , source
            ]
  where
  componentName = Model.componentName component

  propsName = propsTypeName componentName

  instanceTypeName = propsName <> "Instance"

  instanceModulePath = instanceTypeName <> ".d.ts"

  -- | This approach is described in `Codegen.Typescript.Module`
  instantiationStrategy = maybe InterfaceInheritance _.strategy component.propsType.instantiation

  source =
    lines
      $ [ line [ "import", "{", propsName, "}", "from", show $ tsImportPath modulePath ]
        -- | Interface extending forces ts type checker to resolve all type fields.
        -- | It won't work with just type aliasing :-(
        , line
            $ case instantiationStrategy of
                InterfaceInheritance -> [ "export interface ", instanceTypeName, "extends", propsName <> " {};" ]
                TypeAlias -> [ "export type ", instanceTypeName, "=", propsName <> ";" ]
        ]

componentAST :: Component -> M AST.Module
componentAST component@{ extraDeclarations, inherits, modulePath, propsType: propsType@{ base: { row: base, vars }, generate } } = do
  { fqn, props } <- componentProps component
  let
    missingFromGenerate :: Array String
    missingFromGenerate = Array.filter (not <<< flip Set.member (Map.keys props)) generate
  when (not <<< Array.null $ missingFromGenerate) do
    throwError $ [ "Properties listed for generation but not found in component props:" <> show missingFromGenerate ]
  let
    propsNamesFromBase :: Array String
    propsNamesFromBase = Array.fromFoldable <<< Map.keys <<< _.labels <<< unwrap $ base

    missingFromBase :: Array String
    missingFromBase = Array.filter (not <<< flip Set.member (Map.keys props)) propsNamesFromBase
  when (not <<< Array.null $ missingFromBase) do
    throwError $ [ "Properties listed in base row but not found in component props:" <> show missingFromBase ]
  let
    -- | Take only a subset of props using given label set.
    props' :: Map.Map String { optional :: Boolean, type :: ReadDTS.Instantiation.Type }
    props' = Map.filterKeys ((&&) <$> (not <<< eq "classes") <*> (_ `Array.elem` generate)) props

    -- | Create an new "Object" type from them
    -- | for AST generation.
    obj :: ReadDTS.Instantiation.Type
    obj = roll $ ReadDTS.Instantiation.Object fqn props'

    astAlgebra' ::
      AlgebraM
        ComponentAlgebraM
        ReadDTS.Instantiation.TypeF
        PossibleType
    astAlgebra' arg =
      let _ = Debug.Trace.traceM (ReadDTS.Instantiation.Pretty.pprintTypeName (map (const "hole") arg)) :: Data.Identity.Identity Unit
          _ = Debug.Trace.traceM (show arg) :: Data.Identity.Identity Unit
          _ = Debug.Trace.traceM (arg) :: Data.Identity.Identity Unit
       in TS.Module.astAlgebra arg

    objInstance :: Tuple (Either String TS.Module.PossibleType) (List AST.Union)
    objInstance = flip runState mempty <<< runExceptT <<< cataM astAlgebra' $ h (obj)
      where
            h a = let
                      _ = Unsafe.Coerce.unsafeCoerce ((Debug.Trace.traceM (show a)) :: Data.Identity.Identity Unit)
                      _ = Unsafe.Coerce.unsafeCoerce ((Debug.Trace.traceM a) :: Data.Identity.Identity Unit)
                   in a
  case objInstance of
    Tuple (Right (TS.Module.ProperType (Mu.In (TypeRecord (AST.Row { labels, tail: Nothing }))))) unions -> do
      classes <-
        if "classes" `Array.elem` generate then
          Just <$> classesPropAST componentName (Map.lookup "classes" props)
        else
          pure Nothing
      let
        AST.Row base' = base

        classesProp = maybe mempty (Map.singleton "classes" <<< _.prop) classes

        c' = Type.typeRow $ Type.row (classesProp <> labels <> base'.labels) base'.tail

        propsOptionsTypeDecl = declType (AST.TypeName $ propsName <> "Options") vars c'

        propsTypeDecl = declForeignData (AST.TypeName $ propsName)

        extraVars = case Array.tail propsType.base.vars of
          Just arr -> arr
          Nothing -> []

        -- For example:
        --
        -- foreign import data ModalPropsPartial :: Type
        -- modalPropsPartial :: ∀ options options_
        --   . Union options options_ (ModalProps Props_div)
        --   => Record options
        --   -> ModalPropsPartial
        -- modalPropsPartial = unsafeCoerce
        propsPartial = declForeignData (AST.TypeName $ propsName <> "Partial")

        propsPartialConstructor =
          let
            signature =
              forAllWith extraVars { o: "options", o_: "options_" }
                $ \{ o, o_ } ->
                    let
                      inherits' = fromMaybe (Type.constructor "React.Basic.DOM.Props_div") inherits

                      u = Type.app propsOptionsTypeDecl.constructor ([ inherits' ] <> (map Type.var extraVars))

                      fun = Type.arr (recordApply o) propsPartial.constructor
                    in
                      constrained "Prim.Row.Union" [ o, o_, u ] fun
          in
            declValue
              (Ident $ camelCase $ propsName <> "Partial")
              []
              TS.Module.exprUnsafeCoerce
              (Just signature)

        propsDeclarations =
          List.Cons (propsOptionsTypeDecl.declaration)
            $ List.Cons (propsTypeDecl.declaration)
            $ List.Cons (propsPartial.declaration)
            $ List.Cons (propsPartialConstructor.declaration)
            $ List.Nil
      unions' <-
        for unions
          $ case _ of
              AST.Union { moduleName: Just _, name } _ ->
                throwError
                  $ [ "External union generation not implmented yet..." ]
              AST.Union { moduleName: Nothing, name } members -> pure $ TS.Module.unionDeclarations name members
      let
        step { "type": union, constructors, instances } res = List.Cons union (List.Cons constructors res) <> instances

        -- | Our final component module consists of:
        -- | * unions declrations
        -- | * classes realted declarations
        -- | * component constructor + foreign component import
        declarations =
          foldr step List.Nil unions'
            <> List.fromFoldable extraDeclarations
            <> propsDeclarations
            <> maybe mempty _.declarations classes
            <> componentConstructorsAST
                { componentName
                , extraVars
                , hasStyles: isJust classes
                , inherits
                , propsConstructor: propsOptionsTypeDecl.constructor
                }
      pure $ AST.Module
        $ { declarations
          , moduleName: ModuleName $ psImportPath (componentFullPath component)
          }
    (Tuple (Right result) _) ->
      throwError $ Array.singleton $ line
        $ [ "Expecting object type as a result of props instantiation: ", show result ]
    (Tuple (Left err) _) -> throwError [ err ]
  where
  componentName = Model.componentName component

  propsName = propsTypeName componentName

-- | TODO: This is codegen doesn't use typescript AST at all
-- | so we should move it up.
componentConstructorsAST ::
  { componentName :: ComponentName
  , extraVars :: Array Ident
  , hasStyles :: Boolean
  , inherits :: Maybe AST.Type
  , propsConstructor :: AST.Type
  } ->
  List Declaration
componentConstructorsAST { componentName, extraVars, hasStyles, inherits, propsConstructor } = constructors
  where
  -- | Maybe this `Writer` here is a bit overkill ;-)
  constructors =
    execWriter do
      let
        componentName' = camelCase componentName

        inherits' = fromMaybe (Type.constructor "React.Basic.DOM.Props_div") inherits

        componentValue = foreignReactComponentDecl componentName

        -- | For example:
        -- | appBar :: ∀  given required
        -- |   .  Union given required (AppBarPropsOptions (PaperProps Props_div) )
        -- |   => Record given
        -- |   -> JSX
        -- | appBar = element _AppBar
        componentConstructor =
          let
            signature =
              forAllWith extraVars { g: "given", r: "required" }
                $ \{ g, r } ->
                    let
                      fun = Type.arr (recordApply g) Model.jsx

                      extraVars' = map Type.var extraVars

                      u = Type.app propsConstructor (Array.cons inherits' extraVars')
                    in
                      constrained "Prim.Row.Union" [ g, r, u ] fun
          in
            declValue
              (Ident componentName')
              []
              (Expr.app (Expr.ident "React.Basic.element") componentValue.var)
              (Just signature)

        -- | For example:
        -- | appBar :: ∀  componentProps given required
        -- |   .  Union given required (AppBarPropsOptions componentProps)
        -- |   => Record given
        -- |   -> JSX
        -- | appBar = element _AppBar
        componentConstructor' =
          let
            signature =
              forAllWith extraVars { c: "componentProps", g: "given", r: "required" }
                $ \{ c, g, r } ->
                    let
                      fun = Type.arr (recordApply g) Model.jsx

                      extraVars' = map Type.var extraVars

                      u = Type.app propsConstructor (Array.cons c extraVars')
                    in
                      constrained "Prim.Row.Union" [ g, r, u ] fun
          in
            declValue
              (Ident $ componentName' <> "_component")
              []
              (Expr.app (Expr.ident "React.Basic.element") componentValue.var)
              (Just signature)
      tell $ List.singleton componentValue.declaration
      tell $ List.singleton componentConstructor.declaration
      tell $ List.singleton componentConstructor'.declaration
      when hasStyles
        $ do
            let
              -- | For example:
              -- | appBarWithStyles :: ∀ jss jss_ required given
              -- |   . Union given required (AppBarPropsOptions (PaperProps Props_div))
              -- |   => Union jss jss_ AppBarPropsOptionsJSS
              -- |   => (Theme -> Record jss)
              -- |   -> Record given
              -- |   -> JSX
              -- | appBarWithStyles style = element (unsafeCoerce withStyles style _AppBar)
              componentConstructorWithStyles =
                let
                  signature =
                    forAllWith extraVars { g: "given", jss: "jss", jss_: "jss_", r: "required" }
                      $ \{ g, jss, jss_, r } ->
                          let
                            style = Type.arr (Type.constructor "MUI.Core.Styles.Types.Theme") (recordApply jss)

                            fun = Type.arr style (Type.arr (recordApply g) Model.jsx)

                            extraVars' = map Type.var extraVars

                            u = Type.app propsConstructor (Array.cons inherits' extraVars')
                          in
                            constrained "Prim.Row.Union" [ g, r, u ]
                              $ constrained "Prim.Row.Union" [ jss, jss_, Type.constructor $ componentName <> "ClassKeyOptionsJSS" ]
                              $ fun
                in
                  declValue
                    (Ident $ componentName' <> "WithStyles")
                    [ Ident "style" ]
                    ( Expr.app
                        (Expr.ident "React.Basic.element")
                        ( Expr.app
                            ( Expr.app
                                ( Expr.app
                                    exprUnsafeCoerce
                                    (Expr.ident "MUI.Core.Styles.WithStyles.withStyles")
                                )
                                (Expr.ident "style")
                            )
                            componentValue.var
                        )
                    )
                    (Just signature)
            tell $ pure componentConstructorWithStyles.declaration

-- | Generates all declarations related to classes.
-- |
-- | We are extracting classes directly from AST of a Props object.
-- | We could do the same on the generated instance but then we would
-- | be forced to remove `classes` from props
-- | before running `astAlgebra` on it. Classes record
-- | does not translate directly to any expected PS
-- | construct because it contains `any` types.
-- |
classesPropAST :: ComponentName -> Maybe (ReadDTS.Instantiation.Property ReadDTS.Instantiation.Type) -> M { declarations :: List Declaration, prop :: AST.Type }
classesPropAST componentName = case _ of
  Just { "type": Mu.In (ReadDTS.Instantiation.Object _ classesProps) } -> do
    let
      componentName' = camelCase componentName

      classesNames = Map.Internal.keys classesProps

      binder = Ident "a"

      var = roll $ TypeVar binder

      -- Construct row type which looks like this:
      -- `type ClassKeyOptions a = ( root :: a, colorPrimary :: a)`
      classesGenericOptionsRow =
        roll
          <<< TypeRow
          <<< flip Type.row Nothing
          <<< Map.fromFoldable
          <<< map (flip Tuple var)
          $ classesNames

      classKeyGenericOptionsType =
        declType
          (TypeName $ componentName <> "ClassKeyGenericOptions")
          [ binder ]
          classesGenericOptionsRow

      classKeyJSSOptionsType =
        declType
          (TypeName $ componentName <> "ClassKeyOptionsJSS")
          []
          (Type.app classKeyGenericOptionsType.constructor [ Type.constructor "MUI.Core.JSS" ])

      classKeyOptionsType =
        declType
          (TypeName $ componentName <> "ClassKeyOptions")
          []
          (Type.app classKeyGenericOptionsType.constructor [ Type.string ])

      -- | Construct a type and related constructor function which which looks like this:
      -- | ```
      -- | foreign import data BadgeClassKey
      -- |
      -- | classKey :: ∀  given required
      -- |  .  Union given required (BadgeClassKeyOptions )
      -- |  => Record given
      -- |  -> BadgeClassKey
      -- | classKey = unsafeCoerce
      -- | ```
      classKeyType = declForeignData (TypeName $ componentName <> "ClassKey")

      classKeyValue =
        let
          ident = Ident $ componentName' <> "ClassKey"

          signature =
            forAll { g: "given", r: "required" }
              $ \{ g, r } ->
                  let
                    fun = T.arr (recordApply g) classKeyType.constructor
                  in
                    constrained "Prim.Row.Union" [ g, r, classKeyOptionsType.constructor ] fun
        in
          declValue ident [] TS.Module.exprUnsafeCoerce (Just signature)

      classKeyJSSType = declForeignData (TypeName $ componentName <> "ClassKeyJSS")

      classKeyJSSValue =
        let
          ident = Ident $ componentName' <> "ClassKeyJSS"

          signature =
            forAll { g: "given", r: "required" }
              $ \{ g, r } ->
                  let
                    fun = T.arr (recordApply g) classKeyJSSType.constructor
                  in
                    constrained "Prim.Row.Union" [ g, r, classKeyJSSOptionsType.constructor ] fun
        in
          declValue ident [] TS.Module.exprUnsafeCoerce (Just signature)
    let
      declarations :: List _
      declarations =
        Array.toUnfoldable
          [ classKeyGenericOptionsType.declaration
          , classKeyOptionsType.declaration
          , classKeyType.declaration
          , classKeyValue.declaration
          , classKeyJSSOptionsType.declaration
          , classKeyJSSType.declaration
          , classKeyJSSValue.declaration
          ]
    pure { declarations, prop: classKeyType.constructor }
  c ->
    throwError $ Array.singleton
      $ line
          [ show "classses", "prop is missing or has wrong type:", "_", "in instance object" ]

line :: Array String -> String
line = joinWith " "

lines :: Array String -> String
lines = joinWith "\n"
