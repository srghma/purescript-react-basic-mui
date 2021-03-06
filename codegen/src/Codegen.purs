module Codegen where

import Prelude

import Codegen.AST (Ident(..))
import Codegen.AST (Module(..), ModuleName(..)) as AST
import Codegen.AST.Printers (printModule)
import Codegen.AST.Sugar (declForeignValue)
import Codegen.AST.Sugar.Type (constructor) as Type
import Codegen.Model (Component, Icon, ModulePath(..), iconFullPath, psImportPath)
import Codegen.Model (componentFullPath, componentName, iconFullPath, iconName) as Model
import Codegen.TS (M) as TS
import Codegen.TS.MUI (componentAST) as TS.MUI
import Data.List (singleton) as List
import Data.String (toLower) as String
import Data.String.Extra (camelCase)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Effect.Class.Console (log)
import Node.Encoding (Encoding(..))
import Node.FS.Aff (exists, writeTextFile) as FS
import Node.FS.Extra (ensureDir)
import Node.Path (FilePath)

data Codegen = Codegen File String

data File
  = File String
  | Directory String File

type M a = TS.M a

psModuleFile :: ModulePath -> File
psModuleFile (Path str next) = Directory str $ psModuleFile next
psModuleFile (Name name) = File $ name <> ".purs"

jsModuleFile :: ModulePath -> File
jsModuleFile (Path str next) = Directory str $ jsModuleFile next
jsModuleFile (Name name) = File $ name <> ".js"

componentPSFile :: Component -> File
componentPSFile = psModuleFile <<< Model.componentFullPath

componentJSFile :: Component -> File
componentJSFile = jsModuleFile <<< Model.componentFullPath

iconPSFile :: Icon -> File
iconPSFile = psModuleFile <<< Model.iconFullPath

iconJSFile :: Icon -> File
iconJSFile = jsModuleFile <<< Model.iconFullPath

genComponentPS :: Component -> M String
genComponentPS c =
  TS.MUI.componentAST c <#> printModule

-- | TODO: FFI generation should be done in the same place as PS codegen
genComponentJS :: Component -> String
genComponentJS c@{ modulePath }
  = "exports._" <> Model.componentName c
  <> " = require(\"@material-ui/core/" <> (jsPath modulePath) <> "\").default;"
  where
    jsPath (Path str next) = (String.toLower str) <> "/" <> (jsPath next)
    jsPath (Name n) = n

write :: FilePath -> Codegen -> Aff Unit
write basePath (Codegen file code) = go basePath file
  where
    go path (Directory name next) = go (path <> "/" <> name) next
    go path (File name) = do
      mkDir path
      let filePath = path <> "/" <> name
      liftEffect $ log ("Writing: " <> filePath)
      FS.writeTextFile UTF8 filePath code
    mkDir path = do
      exists <- FS.exists path
      if exists
        then pure unit
        else ensureDir path

component :: Component -> TS.M { ps :: String, js :: String }
component c =
  { ps: _, js: genComponentJS c} <$> (genComponentPS c)

foreign import icons :: Array Icon

icon :: Icon -> { ps :: String, js :: String }
icon i = { ps, js }
  where
    iconName = Model.iconName i
    iconName' = camelCase iconName

    iconType = Type.constructor "MUI.Icons.Types.Icon"
    iconComponent = declForeignValue (Ident iconName') iconType

    -- | For example:
    -- | foreign import menu :: MUI.Icons.Types.Icon
    js = "exports." <> iconName' <> " = " <> "require('@material-ui/icons/" <> iconName <> "').default;"

    ps = printModule $ AST.Module
      { declarations: List.singleton iconComponent.declaration
      , moduleName: AST.ModuleName $ psImportPath (iconFullPath i)
      }
