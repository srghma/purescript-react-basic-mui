module MUI.Core.IconButton where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.ButtonBase (ButtonBasePropsOptions) as MUI.Core.ButtonBase
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce
import Unsafe.Reference (unsafeRefEq) as Unsafe.Reference

foreign import data Size :: Type

size :: { medium :: Size, small :: Size }
size = { medium: Unsafe.Coerce.unsafeCoerce "medium", small: Unsafe.Coerce.unsafeCoerce "small" }

foreign import data Edge :: Type

edge :: { end :: Edge, "false" :: Edge, start :: Edge }
edge = { end: Unsafe.Coerce.unsafeCoerce "end", "false": Unsafe.Coerce.unsafeCoerce false, start: Unsafe.Coerce.unsafeCoerce "start" }

foreign import data Color :: Type

color :: { default :: Color, inherit :: Color, primary :: Color, secondary :: Color }
color = { default: Unsafe.Coerce.unsafeCoerce "default", inherit: Unsafe.Coerce.unsafeCoerce "inherit", primary: Unsafe.Coerce.unsafeCoerce "primary", secondary: Unsafe.Coerce.unsafeCoerce "secondary" }

instance eqColor :: Eq Color where
  eq = Unsafe.Reference.unsafeRefEq

instance eqEdge :: Eq Edge where
  eq = Unsafe.Reference.unsafeRefEq

instance eqSize :: Eq Size where
  eq = Unsafe.Reference.unsafeRefEq

type IconButtonPropsOptions componentProps = ( children :: Array React.Basic.JSX, classes :: IconButtonClassKey, color :: Color, disableFocusRipple :: Boolean, disableRipple :: Boolean, disabled :: Boolean, edge :: Edge, size :: Size | componentProps )

foreign import data IconButtonProps :: Type

foreign import data IconButtonPropsPartial :: Type

iconButtonPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (IconButtonPropsOptions (MUI.Core.ButtonBase.ButtonBasePropsOptions React.Basic.DOM.Props_div)) => Record options -> IconButtonPropsPartial
iconButtonPropsPartial = Unsafe.Coerce.unsafeCoerce

type IconButtonClassKeyGenericOptions a = ( colorInherit :: a, colorPrimary :: a, colorSecondary :: a, disabled :: a, edgeEnd :: a, edgeStart :: a, label :: a, root :: a, sizeSmall :: a )

type IconButtonClassKeyOptions  = IconButtonClassKeyGenericOptions String

foreign import data IconButtonClassKey :: Type

iconButtonClassKey :: ∀ required given. Prim.Row.Union given required IconButtonClassKeyOptions => Record given -> IconButtonClassKey
iconButtonClassKey = Unsafe.Coerce.unsafeCoerce

type IconButtonClassKeyOptionsJSS  = IconButtonClassKeyGenericOptions MUI.Core.JSS

foreign import data IconButtonClassKeyJSS :: Type

iconButtonClassKeyJSS :: ∀ required given. Prim.Row.Union given required IconButtonClassKeyOptionsJSS => Record given -> IconButtonClassKeyJSS
iconButtonClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _IconButton :: ∀ a. React.Basic.ReactComponent a

iconButton :: ∀ required given. Prim.Row.Union given required (IconButtonPropsOptions (MUI.Core.ButtonBase.ButtonBasePropsOptions React.Basic.DOM.Props_div)) => Record given -> React.Basic.JSX
iconButton = React.Basic.element _IconButton

iconButton_component :: ∀ required given componentProps. Prim.Row.Union given required (IconButtonPropsOptions componentProps) => Record given -> React.Basic.JSX
iconButton_component = React.Basic.element _IconButton

iconButtonWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (IconButtonPropsOptions (MUI.Core.ButtonBase.ButtonBasePropsOptions React.Basic.DOM.Props_div)) => Prim.Row.Union jss jss_ IconButtonClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
iconButtonWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _IconButton)