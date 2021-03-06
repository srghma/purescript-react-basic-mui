module MUI.Core.DialogContent where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

type DialogContentPropsOptions componentProps = ( children :: Array React.Basic.JSX, classes :: DialogContentClassKey, dividers :: Boolean | componentProps )

foreign import data DialogContentProps :: Type

foreign import data DialogContentPropsPartial :: Type

dialogContentPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (DialogContentPropsOptions React.Basic.DOM.Props_div) => Record options -> DialogContentPropsPartial
dialogContentPropsPartial = Unsafe.Coerce.unsafeCoerce

type DialogContentClassKeyGenericOptions a = ( root :: a )

type DialogContentClassKeyOptions  = DialogContentClassKeyGenericOptions String

foreign import data DialogContentClassKey :: Type

dialogContentClassKey :: ∀ required given. Prim.Row.Union given required DialogContentClassKeyOptions => Record given -> DialogContentClassKey
dialogContentClassKey = Unsafe.Coerce.unsafeCoerce

type DialogContentClassKeyOptionsJSS  = DialogContentClassKeyGenericOptions MUI.Core.JSS

foreign import data DialogContentClassKeyJSS :: Type

dialogContentClassKeyJSS :: ∀ required given. Prim.Row.Union given required DialogContentClassKeyOptionsJSS => Record given -> DialogContentClassKeyJSS
dialogContentClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _DialogContent :: ∀ a. React.Basic.ReactComponent a

dialogContent :: ∀ required given. Prim.Row.Union given required (DialogContentPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
dialogContent = React.Basic.element _DialogContent

dialogContent_component :: ∀ required given componentProps. Prim.Row.Union given required (DialogContentPropsOptions componentProps) => Record given -> React.Basic.JSX
dialogContent_component = React.Basic.element _DialogContent

dialogContentWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (DialogContentPropsOptions React.Basic.DOM.Props_div) => Prim.Row.Union jss jss_ DialogContentClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
dialogContentWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _DialogContent)