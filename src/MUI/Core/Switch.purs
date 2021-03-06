module MUI.Core.Switch where

import Foreign (Foreign) as Foreign
import MUI.Core (JSS) as MUI.Core
import MUI.Core.IconButton (IconButtonPropsOptions) as MUI.Core.IconButton
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import React.Basic.Events (EventHandler) as React.Basic.Events
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce
import Unsafe.Reference (unsafeRefEq) as Unsafe.Reference

foreign import data Type_ :: Type

type_ :: { button :: Type_, reset :: Type_, submit :: Type_ }
type_ = { button: Unsafe.Coerce.unsafeCoerce "button", reset: Unsafe.Coerce.unsafeCoerce "reset", submit: Unsafe.Coerce.unsafeCoerce "submit" }

foreign import data Size :: Type

size :: { medium :: Size, small :: Size }
size = { medium: Unsafe.Coerce.unsafeCoerce "medium", small: Unsafe.Coerce.unsafeCoerce "small" }

foreign import data Edge :: Type

edge :: { end :: Edge, "false" :: Edge, start :: Edge }
edge = { end: Unsafe.Coerce.unsafeCoerce "end", "false": Unsafe.Coerce.unsafeCoerce false, start: Unsafe.Coerce.unsafeCoerce "start" }

foreign import data Color :: Type

color :: { default :: Color, primary :: Color, secondary :: Color }
color = { default: Unsafe.Coerce.unsafeCoerce "default", primary: Unsafe.Coerce.unsafeCoerce "primary", secondary: Unsafe.Coerce.unsafeCoerce "secondary" }

instance eqColor :: Eq Color where
  eq = Unsafe.Reference.unsafeRefEq

instance eqEdge :: Eq Edge where
  eq = Unsafe.Reference.unsafeRefEq

instance eqSize :: Eq Size where
  eq = Unsafe.Reference.unsafeRefEq

instance eqType :: Eq Type_ where
  eq = Unsafe.Reference.unsafeRefEq

type SwitchPropsOptions componentProps = ( checked :: Boolean, checkedIcon :: React.Basic.JSX, children :: Array React.Basic.JSX, classes :: SwitchClassKey, color :: Color, disableRipple :: Boolean, disabled :: Boolean, edge :: Edge, icon :: React.Basic.JSX, id :: String, inputProps :: Foreign.Foreign, inputRef :: Foreign.Foreign, onChange :: React.Basic.Events.EventHandler, required :: Boolean, size :: Size, "type" :: Type_, value :: Foreign.Foreign | componentProps )

foreign import data SwitchProps :: Type

foreign import data SwitchPropsPartial :: Type

switchPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (SwitchPropsOptions (MUI.Core.IconButton.IconButtonPropsOptions React.Basic.DOM.Props_div)) => Record options -> SwitchPropsPartial
switchPropsPartial = Unsafe.Coerce.unsafeCoerce

type SwitchClassKeyGenericOptions a = ( checked :: a, colorPrimary :: a, colorSecondary :: a, disabled :: a, input :: a, root :: a, sizeSmall :: a, switchBase :: a, thumb :: a, track :: a )

type SwitchClassKeyOptions  = SwitchClassKeyGenericOptions String

foreign import data SwitchClassKey :: Type

switchClassKey :: ∀ required given. Prim.Row.Union given required SwitchClassKeyOptions => Record given -> SwitchClassKey
switchClassKey = Unsafe.Coerce.unsafeCoerce

type SwitchClassKeyOptionsJSS  = SwitchClassKeyGenericOptions MUI.Core.JSS

foreign import data SwitchClassKeyJSS :: Type

switchClassKeyJSS :: ∀ required given. Prim.Row.Union given required SwitchClassKeyOptionsJSS => Record given -> SwitchClassKeyJSS
switchClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _Switch :: ∀ a. React.Basic.ReactComponent a

switch :: ∀ required given. Prim.Row.Union given required (SwitchPropsOptions (MUI.Core.IconButton.IconButtonPropsOptions React.Basic.DOM.Props_div)) => Record given -> React.Basic.JSX
switch = React.Basic.element _Switch

switch_component :: ∀ required given componentProps. Prim.Row.Union given required (SwitchPropsOptions componentProps) => Record given -> React.Basic.JSX
switch_component = React.Basic.element _Switch

switchWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (SwitchPropsOptions (MUI.Core.IconButton.IconButtonPropsOptions React.Basic.DOM.Props_div)) => Prim.Row.Union jss jss_ SwitchClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
switchWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _Switch)