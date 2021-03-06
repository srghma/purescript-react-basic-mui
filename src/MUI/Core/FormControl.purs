module MUI.Core.FormControl where

import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce
import Unsafe.Reference (unsafeRefEq) as Unsafe.Reference

foreign import data Variant :: Type

variant :: { filled :: Variant, outlined :: Variant, standard :: Variant }
variant = { filled: Unsafe.Coerce.unsafeCoerce "filled", outlined: Unsafe.Coerce.unsafeCoerce "outlined", standard: Unsafe.Coerce.unsafeCoerce "standard" }

foreign import data Margin :: Type

margin :: { dense :: Margin, none :: Margin, normal :: Margin }
margin = { dense: Unsafe.Coerce.unsafeCoerce "dense", none: Unsafe.Coerce.unsafeCoerce "none", normal: Unsafe.Coerce.unsafeCoerce "normal" }

foreign import data Color :: Type

color :: { primary :: Color, secondary :: Color }
color = { primary: Unsafe.Coerce.unsafeCoerce "primary", secondary: Unsafe.Coerce.unsafeCoerce "secondary" }

instance eqColor :: Eq Color where
  eq = Unsafe.Reference.unsafeRefEq

instance eqMargin :: Eq Margin where
  eq = Unsafe.Reference.unsafeRefEq

instance eqVariant :: Eq Variant where
  eq = Unsafe.Reference.unsafeRefEq

type FormControlPropsOptions componentProps = ( children :: Array React.Basic.JSX, color :: Color, disabled :: Boolean, error :: Boolean, fullWidth :: Boolean, hiddenLabel :: Boolean, margin :: Margin, required :: Boolean, variant :: Variant | componentProps )

foreign import data FormControlProps :: Type

foreign import data FormControlPropsPartial :: Type

formControlPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (FormControlPropsOptions React.Basic.DOM.Props_div) => Record options -> FormControlPropsPartial
formControlPropsPartial = Unsafe.Coerce.unsafeCoerce

foreign import _FormControl :: ∀ a. React.Basic.ReactComponent a

formControl :: ∀ required given. Prim.Row.Union given required (FormControlPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
formControl = React.Basic.element _FormControl

formControl_component :: ∀ required given componentProps. Prim.Row.Union given required (FormControlPropsOptions componentProps) => Record given -> React.Basic.JSX
formControl_component = React.Basic.element _FormControl