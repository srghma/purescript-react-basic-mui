module MUI.Core.List where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_ul) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

type ListPropsOptions componentProps = ( children :: Array React.Basic.JSX, classes :: ListClassKey, dense :: Boolean, disablePadding :: Boolean, subheader :: React.Basic.JSX | componentProps )

foreign import data ListProps :: Type

foreign import data ListPropsPartial :: Type

listPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (ListPropsOptions React.Basic.DOM.Props_ul) => Record options -> ListPropsPartial
listPropsPartial = Unsafe.Coerce.unsafeCoerce

type ListClassKeyGenericOptions a = ( dense :: a, padding :: a, root :: a, subheader :: a )

type ListClassKeyOptions  = ListClassKeyGenericOptions String

foreign import data ListClassKey :: Type

listClassKey :: ∀ required given. Prim.Row.Union given required ListClassKeyOptions => Record given -> ListClassKey
listClassKey = Unsafe.Coerce.unsafeCoerce

type ListClassKeyOptionsJSS  = ListClassKeyGenericOptions MUI.Core.JSS

foreign import data ListClassKeyJSS :: Type

listClassKeyJSS :: ∀ required given. Prim.Row.Union given required ListClassKeyOptionsJSS => Record given -> ListClassKeyJSS
listClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _List :: ∀ a. React.Basic.ReactComponent a

list :: ∀ required given. Prim.Row.Union given required (ListPropsOptions React.Basic.DOM.Props_ul) => Record given -> React.Basic.JSX
list = React.Basic.element _List

list_component :: ∀ required given componentProps. Prim.Row.Union given required (ListPropsOptions componentProps) => Record given -> React.Basic.JSX
list_component = React.Basic.element _List

listWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (ListPropsOptions React.Basic.DOM.Props_ul) => Prim.Row.Union jss jss_ ListClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
listWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _List)