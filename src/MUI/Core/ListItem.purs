module MUI.Core.ListItem where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_li) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce
import Unsafe.Reference (unsafeRefEq) as Unsafe.Reference

foreign import data AlignItems :: Type

alignItems :: { "FlexStart" :: AlignItems, center :: AlignItems }
alignItems = { "FlexStart": Unsafe.Coerce.unsafeCoerce "flex-start", center: Unsafe.Coerce.unsafeCoerce "center" }

instance eqAlignItems :: Eq AlignItems where
  eq = Unsafe.Reference.unsafeRefEq

type ListItemPropsOptions componentProps = ( alignItems :: AlignItems, autoFocus :: Boolean, button :: Boolean, children :: Array React.Basic.JSX, classes :: ListItemClassKey, dense :: Boolean, disableGutters :: Boolean, disabled :: Boolean, divider :: Boolean, selected :: Boolean | componentProps )

foreign import data ListItemProps :: Type

foreign import data ListItemPropsPartial :: Type

listItemPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (ListItemPropsOptions React.Basic.DOM.Props_li) => Record options -> ListItemPropsPartial
listItemPropsPartial = Unsafe.Coerce.unsafeCoerce

type ListItemClassKeyGenericOptions a = ( button :: a, container :: a, default :: a, dense :: a, disabled :: a, divider :: a, focusVisible :: a, gutters :: a, root :: a, secondaryAction :: a, selected :: a )

type ListItemClassKeyOptions  = ListItemClassKeyGenericOptions String

foreign import data ListItemClassKey :: Type

listItemClassKey :: ∀ required given. Prim.Row.Union given required ListItemClassKeyOptions => Record given -> ListItemClassKey
listItemClassKey = Unsafe.Coerce.unsafeCoerce

type ListItemClassKeyOptionsJSS  = ListItemClassKeyGenericOptions MUI.Core.JSS

foreign import data ListItemClassKeyJSS :: Type

listItemClassKeyJSS :: ∀ required given. Prim.Row.Union given required ListItemClassKeyOptionsJSS => Record given -> ListItemClassKeyJSS
listItemClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _ListItem :: ∀ a. React.Basic.ReactComponent a

listItem :: ∀ required given. Prim.Row.Union given required (ListItemPropsOptions React.Basic.DOM.Props_li) => Record given -> React.Basic.JSX
listItem = React.Basic.element _ListItem

listItem_component :: ∀ required given componentProps. Prim.Row.Union given required (ListItemPropsOptions componentProps) => Record given -> React.Basic.JSX
listItem_component = React.Basic.element _ListItem

listItemWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (ListItemPropsOptions React.Basic.DOM.Props_li) => Prim.Row.Union jss jss_ ListItemClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
listItemWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _ListItem)