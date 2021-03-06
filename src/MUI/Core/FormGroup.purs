module MUI.Core.FormGroup where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

type FormGroupPropsOptions componentProps = ( children :: Array React.Basic.JSX, classes :: FormGroupClassKey, row :: Boolean | componentProps )

foreign import data FormGroupProps :: Type

foreign import data FormGroupPropsPartial :: Type

formGroupPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (FormGroupPropsOptions React.Basic.DOM.Props_div) => Record options -> FormGroupPropsPartial
formGroupPropsPartial = Unsafe.Coerce.unsafeCoerce

type FormGroupClassKeyGenericOptions a = ( root :: a, row :: a )

type FormGroupClassKeyOptions  = FormGroupClassKeyGenericOptions String

foreign import data FormGroupClassKey :: Type

formGroupClassKey :: ∀ required given. Prim.Row.Union given required FormGroupClassKeyOptions => Record given -> FormGroupClassKey
formGroupClassKey = Unsafe.Coerce.unsafeCoerce

type FormGroupClassKeyOptionsJSS  = FormGroupClassKeyGenericOptions MUI.Core.JSS

foreign import data FormGroupClassKeyJSS :: Type

formGroupClassKeyJSS :: ∀ required given. Prim.Row.Union given required FormGroupClassKeyOptionsJSS => Record given -> FormGroupClassKeyJSS
formGroupClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _FormGroup :: ∀ a. React.Basic.ReactComponent a

formGroup :: ∀ required given. Prim.Row.Union given required (FormGroupPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
formGroup = React.Basic.element _FormGroup

formGroup_component :: ∀ required given componentProps. Prim.Row.Union given required (FormGroupPropsOptions componentProps) => Record given -> React.Basic.JSX
formGroup_component = React.Basic.element _FormGroup

formGroupWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (FormGroupPropsOptions React.Basic.DOM.Props_div) => Prim.Row.Union jss jss_ FormGroupClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
formGroupWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _FormGroup)