module MUI.Core.Radio where

import Foreign (Foreign) as Foreign
import MUI.Core (JSS) as MUI.Core
import MUI.Core.IconButton (IconButtonPropsOptions) as MUI.Core.IconButton
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_button) as React.Basic.DOM
import React.Basic.Events (EventHandler) as React.Basic.Events
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce
import Unsafe.Reference (unsafeRefEq) as Unsafe.Reference

foreign import data Type_ :: Type

type_ :: { button :: Type_, reset :: Type_, submit :: Type_ }
type_ = { button: Unsafe.Coerce.unsafeCoerce "button", reset: Unsafe.Coerce.unsafeCoerce "reset", submit: Unsafe.Coerce.unsafeCoerce "submit" }

foreign import data Color :: Type

color :: { default :: Color, primary :: Color, secondary :: Color }
color = { default: Unsafe.Coerce.unsafeCoerce "default", primary: Unsafe.Coerce.unsafeCoerce "primary", secondary: Unsafe.Coerce.unsafeCoerce "secondary" }

instance eqColor :: Eq Color where
  eq = Unsafe.Reference.unsafeRefEq

instance eqType :: Eq Type_ where
  eq = Unsafe.Reference.unsafeRefEq

type RadioPropsOptions componentProps = ( checked :: Boolean, checkedIcon :: React.Basic.JSX, classes :: RadioClassKey, color :: Color, disableRipple :: Boolean, disabled :: Boolean, icon :: React.Basic.JSX, id :: String, inputProps :: Foreign.Foreign, inputRef :: Foreign.Foreign, name :: String, onChange :: React.Basic.Events.EventHandler, required :: Boolean, "type" :: Type_, value :: Foreign.Foreign | componentProps )

foreign import data RadioProps :: Type

foreign import data RadioPropsPartial :: Type

radioPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (RadioPropsOptions (MUI.Core.IconButton.IconButtonPropsOptions React.Basic.DOM.Props_button)) => Record options -> RadioPropsPartial
radioPropsPartial = Unsafe.Coerce.unsafeCoerce

type RadioClassKeyGenericOptions a = ( checked :: a, colorPrimary :: a, colorSecondary :: a, disabled :: a, input :: a, root :: a )

type RadioClassKeyOptions  = RadioClassKeyGenericOptions String

foreign import data RadioClassKey :: Type

radioClassKey :: ∀ required given. Prim.Row.Union given required RadioClassKeyOptions => Record given -> RadioClassKey
radioClassKey = Unsafe.Coerce.unsafeCoerce

type RadioClassKeyOptionsJSS  = RadioClassKeyGenericOptions MUI.Core.JSS

foreign import data RadioClassKeyJSS :: Type

radioClassKeyJSS :: ∀ required given. Prim.Row.Union given required RadioClassKeyOptionsJSS => Record given -> RadioClassKeyJSS
radioClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _Radio :: ∀ a. React.Basic.ReactComponent a

radio :: ∀ required given. Prim.Row.Union given required (RadioPropsOptions (MUI.Core.IconButton.IconButtonPropsOptions React.Basic.DOM.Props_button)) => Record given -> React.Basic.JSX
radio = React.Basic.element _Radio

radio_component :: ∀ required given componentProps. Prim.Row.Union given required (RadioPropsOptions componentProps) => Record given -> React.Basic.JSX
radio_component = React.Basic.element _Radio

radioWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (RadioPropsOptions (MUI.Core.IconButton.IconButtonPropsOptions React.Basic.DOM.Props_button)) => Prim.Row.Union jss jss_ RadioClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
radioWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _Radio)