{- this module was autogenerated, do not edit -}
module MUI.Core.ButtonGroup where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce
import Unsafe.Reference (unsafeRefEq) as Unsafe.Reference

foreign import data Variant :: Type

variant :: { contained :: Variant, outlined :: Variant, text :: Variant }
variant = { contained: Unsafe.Coerce.unsafeCoerce "contained", outlined: Unsafe.Coerce.unsafeCoerce "outlined", text: Unsafe.Coerce.unsafeCoerce "text" }

foreign import data Size :: Type

size :: { large :: Size, medium :: Size, small :: Size }
size = { large: Unsafe.Coerce.unsafeCoerce "large", medium: Unsafe.Coerce.unsafeCoerce "medium", small: Unsafe.Coerce.unsafeCoerce "small" }

foreign import data Orientation :: Type

orientation :: { horizontal :: Orientation, vertical :: Orientation }
orientation = { horizontal: Unsafe.Coerce.unsafeCoerce "horizontal", vertical: Unsafe.Coerce.unsafeCoerce "vertical" }

foreign import data Color :: Type

color :: { default :: Color, inherit :: Color, primary :: Color, secondary :: Color }
color = { default: Unsafe.Coerce.unsafeCoerce "default", inherit: Unsafe.Coerce.unsafeCoerce "inherit", primary: Unsafe.Coerce.unsafeCoerce "primary", secondary: Unsafe.Coerce.unsafeCoerce "secondary" }

instance eqColor :: Eq Color where
  eq = Unsafe.Reference.unsafeRefEq

instance eqOrientation :: Eq Orientation where
  eq = Unsafe.Reference.unsafeRefEq

instance eqSize :: Eq Size where
  eq = Unsafe.Reference.unsafeRefEq

instance eqVariant :: Eq Variant where
  eq = Unsafe.Reference.unsafeRefEq

type ButtonGroupPropsOptions componentProps = ( children :: Array React.Basic.JSX, classes :: ButtonGroupClassKey, color :: Color, disableFocusRipple :: Boolean, disableRipple :: Boolean, disabled :: Boolean, fullWidth :: Boolean, orientation :: Orientation, size :: Size, variant :: Variant | componentProps )

foreign import data ButtonGroupProps :: Type

foreign import data ButtonGroupPropsPartial :: Type

buttonGroupPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (ButtonGroupPropsOptions React.Basic.DOM.Props_div) => Record options -> ButtonGroupPropsPartial
buttonGroupPropsPartial = Unsafe.Coerce.unsafeCoerce

type ButtonGroupClassKeyGenericOptions a = ( contained :: a, disabled :: a, fullWidth :: a, grouped :: a, groupedContained :: a, groupedContainedHorizontal :: a, groupedContainedPrimary :: a, groupedContainedSecondary :: a, groupedContainedVertical :: a, groupedHorizontal :: a, groupedOutlined :: a, groupedOutlinedHorizontal :: a, groupedOutlinedPrimary :: a, groupedOutlinedSecondary :: a, groupedOutlinedVertical :: a, groupedText :: a, groupedTextHorizontal :: a, groupedTextPrimary :: a, groupedTextSecondary :: a, groupedTextVertical :: a, groupedVertical :: a, root :: a, vertical :: a )

type ButtonGroupClassKeyOptions  = ButtonGroupClassKeyGenericOptions String

foreign import data ButtonGroupClassKey :: Type

buttonGroupClassKey :: ∀ required given. Prim.Row.Union given required ButtonGroupClassKeyOptions => Record given -> ButtonGroupClassKey
buttonGroupClassKey = Unsafe.Coerce.unsafeCoerce

type ButtonGroupClassKeyOptionsJSS  = ButtonGroupClassKeyGenericOptions MUI.Core.JSS

foreign import data ButtonGroupClassKeyJSS :: Type

buttonGroupClassKeyJSS :: ∀ required given. Prim.Row.Union given required ButtonGroupClassKeyOptionsJSS => Record given -> ButtonGroupClassKeyJSS
buttonGroupClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _ButtonGroup :: ∀ a. React.Basic.ReactComponent a

buttonGroup :: ∀ required given. Prim.Row.Union given required (ButtonGroupPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
buttonGroup = React.Basic.element _ButtonGroup

buttonGroup_component :: ∀ required given componentProps. Prim.Row.Union given required (ButtonGroupPropsOptions componentProps) => Record given -> React.Basic.JSX
buttonGroup_component = React.Basic.element _ButtonGroup

buttonGroupWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (ButtonGroupPropsOptions React.Basic.DOM.Props_div) => Prim.Row.Union jss jss_ ButtonGroupClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
buttonGroupWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _ButtonGroup)