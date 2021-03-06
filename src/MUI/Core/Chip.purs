module MUI.Core.Chip where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import React.Basic.Events (EventHandler) as React.Basic.Events
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce
import Unsafe.Reference (unsafeRefEq) as Unsafe.Reference

foreign import data Variant :: Type

variant :: { default :: Variant, outlined :: Variant }
variant = { default: Unsafe.Coerce.unsafeCoerce "default", outlined: Unsafe.Coerce.unsafeCoerce "outlined" }

foreign import data Size :: Type

size :: { medium :: Size, small :: Size }
size = { medium: Unsafe.Coerce.unsafeCoerce "medium", small: Unsafe.Coerce.unsafeCoerce "small" }

foreign import data Color :: Type

color :: { default :: Color, inherit :: Color, primary :: Color, secondary :: Color }
color = { default: Unsafe.Coerce.unsafeCoerce "default", inherit: Unsafe.Coerce.unsafeCoerce "inherit", primary: Unsafe.Coerce.unsafeCoerce "primary", secondary: Unsafe.Coerce.unsafeCoerce "secondary" }

instance eqColor :: Eq Color where
  eq = Unsafe.Reference.unsafeRefEq

instance eqSize :: Eq Size where
  eq = Unsafe.Reference.unsafeRefEq

instance eqVariant :: Eq Variant where
  eq = Unsafe.Reference.unsafeRefEq

type ChipPropsOptions componentProps = ( avatar :: React.Basic.JSX, classes :: ChipClassKey, color :: Color, deleteIcon :: React.Basic.JSX, disabled :: Boolean, icon :: React.Basic.JSX, label :: React.Basic.JSX, onDelete :: React.Basic.Events.EventHandler, size :: Size, variant :: Variant | componentProps )

foreign import data ChipProps :: Type

foreign import data ChipPropsPartial :: Type

chipPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (ChipPropsOptions React.Basic.DOM.Props_div) => Record options -> ChipPropsPartial
chipPropsPartial = Unsafe.Coerce.unsafeCoerce

type ChipClassKeyGenericOptions a = ( avatar :: a, avatarColorPrimary :: a, avatarColorSecondary :: a, avatarSmall :: a, clickable :: a, clickableColorPrimary :: a, clickableColorSecondary :: a, colorPrimary :: a, colorSecondary :: a, deletable :: a, deletableColorPrimary :: a, deletableColorSecondary :: a, deleteIcon :: a, deleteIconColorPrimary :: a, deleteIconColorSecondary :: a, deleteIconOutlinedColorPrimary :: a, deleteIconOutlinedColorSecondary :: a, deleteIconSmall :: a, disabled :: a, icon :: a, iconColorPrimary :: a, iconColorSecondary :: a, iconSmall :: a, label :: a, labelSmall :: a, outlined :: a, outlinedPrimary :: a, outlinedSecondary :: a, root :: a, sizeSmall :: a )

type ChipClassKeyOptions  = ChipClassKeyGenericOptions String

foreign import data ChipClassKey :: Type

chipClassKey :: ∀ required given. Prim.Row.Union given required ChipClassKeyOptions => Record given -> ChipClassKey
chipClassKey = Unsafe.Coerce.unsafeCoerce

type ChipClassKeyOptionsJSS  = ChipClassKeyGenericOptions MUI.Core.JSS

foreign import data ChipClassKeyJSS :: Type

chipClassKeyJSS :: ∀ required given. Prim.Row.Union given required ChipClassKeyOptionsJSS => Record given -> ChipClassKeyJSS
chipClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _Chip :: ∀ a. React.Basic.ReactComponent a

chip :: ∀ required given. Prim.Row.Union given required (ChipPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
chip = React.Basic.element _Chip

chip_component :: ∀ required given componentProps. Prim.Row.Union given required (ChipPropsOptions componentProps) => Record given -> React.Basic.JSX
chip_component = React.Basic.element _Chip

chipWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (ChipPropsOptions React.Basic.DOM.Props_div) => Prim.Row.Union jss jss_ ChipClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
chipWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _Chip)