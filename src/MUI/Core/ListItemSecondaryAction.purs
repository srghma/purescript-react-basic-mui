module MUI.Core.ListItemSecondaryAction where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

type ListItemSecondaryActionPropsOptions componentProps = ( children :: Array React.Basic.JSX, classes :: ListItemSecondaryActionClassKey | componentProps )

foreign import data ListItemSecondaryActionProps :: Type

foreign import data ListItemSecondaryActionPropsPartial :: Type

listItemSecondaryActionPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (ListItemSecondaryActionPropsOptions React.Basic.DOM.Props_div) => Record options -> ListItemSecondaryActionPropsPartial
listItemSecondaryActionPropsPartial = Unsafe.Coerce.unsafeCoerce

type ListItemSecondaryActionClassKeyGenericOptions a = ( root :: a )

type ListItemSecondaryActionClassKeyOptions  = ListItemSecondaryActionClassKeyGenericOptions String

foreign import data ListItemSecondaryActionClassKey :: Type

listItemSecondaryActionClassKey :: ∀ required given. Prim.Row.Union given required ListItemSecondaryActionClassKeyOptions => Record given -> ListItemSecondaryActionClassKey
listItemSecondaryActionClassKey = Unsafe.Coerce.unsafeCoerce

type ListItemSecondaryActionClassKeyOptionsJSS  = ListItemSecondaryActionClassKeyGenericOptions MUI.Core.JSS

foreign import data ListItemSecondaryActionClassKeyJSS :: Type

listItemSecondaryActionClassKeyJSS :: ∀ required given. Prim.Row.Union given required ListItemSecondaryActionClassKeyOptionsJSS => Record given -> ListItemSecondaryActionClassKeyJSS
listItemSecondaryActionClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _ListItemSecondaryAction :: ∀ a. React.Basic.ReactComponent a

listItemSecondaryAction :: ∀ required given. Prim.Row.Union given required (ListItemSecondaryActionPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
listItemSecondaryAction = React.Basic.element _ListItemSecondaryAction

listItemSecondaryAction_component :: ∀ required given componentProps. Prim.Row.Union given required (ListItemSecondaryActionPropsOptions componentProps) => Record given -> React.Basic.JSX
listItemSecondaryAction_component = React.Basic.element _ListItemSecondaryAction

listItemSecondaryActionWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (ListItemSecondaryActionPropsOptions React.Basic.DOM.Props_div) => Prim.Row.Union jss jss_ ListItemSecondaryActionClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
listItemSecondaryActionWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _ListItemSecondaryAction)