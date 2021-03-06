module MUI.Core.AppBar where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Paper (PaperPropsOptions) as MUI.Core.Paper
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce
import Unsafe.Reference (unsafeRefEq) as Unsafe.Reference

foreign import data Position :: Type

position :: { absolute :: Position, fixed :: Position, relative :: Position, static :: Position, sticky :: Position }
position = { absolute: Unsafe.Coerce.unsafeCoerce "absolute", fixed: Unsafe.Coerce.unsafeCoerce "fixed", relative: Unsafe.Coerce.unsafeCoerce "relative", static: Unsafe.Coerce.unsafeCoerce "static", sticky: Unsafe.Coerce.unsafeCoerce "sticky" }

foreign import data Color :: Type

color :: { default :: Color, inherit :: Color, primary :: Color, secondary :: Color }
color = { default: Unsafe.Coerce.unsafeCoerce "default", inherit: Unsafe.Coerce.unsafeCoerce "inherit", primary: Unsafe.Coerce.unsafeCoerce "primary", secondary: Unsafe.Coerce.unsafeCoerce "secondary" }

instance eqColor :: Eq Color where
  eq = Unsafe.Reference.unsafeRefEq

instance eqPosition :: Eq Position where
  eq = Unsafe.Reference.unsafeRefEq

type AppBarPropsOptions componentProps = ( children :: Array React.Basic.JSX, classes :: AppBarClassKey, color :: Color, position :: Position | componentProps )

foreign import data AppBarProps :: Type

foreign import data AppBarPropsPartial :: Type

appBarPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (AppBarPropsOptions (MUI.Core.Paper.PaperPropsOptions React.Basic.DOM.Props_div)) => Record options -> AppBarPropsPartial
appBarPropsPartial = Unsafe.Coerce.unsafeCoerce

type AppBarClassKeyGenericOptions a = ( colorDefault :: a, colorPrimary :: a, colorSecondary :: a, positionAbsolute :: a, positionFixed :: a, positionRelative :: a, positionStatic :: a, positionSticky :: a, root :: a )

type AppBarClassKeyOptions  = AppBarClassKeyGenericOptions String

foreign import data AppBarClassKey :: Type

appBarClassKey :: ∀ required given. Prim.Row.Union given required AppBarClassKeyOptions => Record given -> AppBarClassKey
appBarClassKey = Unsafe.Coerce.unsafeCoerce

type AppBarClassKeyOptionsJSS  = AppBarClassKeyGenericOptions MUI.Core.JSS

foreign import data AppBarClassKeyJSS :: Type

appBarClassKeyJSS :: ∀ required given. Prim.Row.Union given required AppBarClassKeyOptionsJSS => Record given -> AppBarClassKeyJSS
appBarClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _AppBar :: ∀ a. React.Basic.ReactComponent a

appBar :: ∀ required given. Prim.Row.Union given required (AppBarPropsOptions (MUI.Core.Paper.PaperPropsOptions React.Basic.DOM.Props_div)) => Record given -> React.Basic.JSX
appBar = React.Basic.element _AppBar

appBar_component :: ∀ required given componentProps. Prim.Row.Union given required (AppBarPropsOptions componentProps) => Record given -> React.Basic.JSX
appBar_component = React.Basic.element _AppBar

appBarWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (AppBarPropsOptions (MUI.Core.Paper.PaperPropsOptions React.Basic.DOM.Props_div)) => Prim.Row.Union jss jss_ AppBarClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
appBarWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _AppBar)