module MUI.Core.MenuItem where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.ListItem (ListItemPropsOptions) as MUI.Core.ListItem
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_li) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

type MenuItemPropsOptions componentProps = ( children :: Array React.Basic.JSX, classes :: MenuItemClassKey, dense :: Boolean, disableGutters :: Boolean | componentProps )

foreign import data MenuItemProps :: Type

foreign import data MenuItemPropsPartial :: Type

menuItemPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (MenuItemPropsOptions (MUI.Core.ListItem.ListItemPropsOptions React.Basic.DOM.Props_li)) => Record options -> MenuItemPropsPartial
menuItemPropsPartial = Unsafe.Coerce.unsafeCoerce

type MenuItemClassKeyGenericOptions a = ( dense :: a, gutters :: a, root :: a, selected :: a )

type MenuItemClassKeyOptions  = MenuItemClassKeyGenericOptions String

foreign import data MenuItemClassKey :: Type

menuItemClassKey :: ∀ required given. Prim.Row.Union given required MenuItemClassKeyOptions => Record given -> MenuItemClassKey
menuItemClassKey = Unsafe.Coerce.unsafeCoerce

type MenuItemClassKeyOptionsJSS  = MenuItemClassKeyGenericOptions MUI.Core.JSS

foreign import data MenuItemClassKeyJSS :: Type

menuItemClassKeyJSS :: ∀ required given. Prim.Row.Union given required MenuItemClassKeyOptionsJSS => Record given -> MenuItemClassKeyJSS
menuItemClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _MenuItem :: ∀ a. React.Basic.ReactComponent a

menuItem :: ∀ required given. Prim.Row.Union given required (MenuItemPropsOptions (MUI.Core.ListItem.ListItemPropsOptions React.Basic.DOM.Props_li)) => Record given -> React.Basic.JSX
menuItem = React.Basic.element _MenuItem

menuItem_component :: ∀ required given componentProps. Prim.Row.Union given required (MenuItemPropsOptions componentProps) => Record given -> React.Basic.JSX
menuItem_component = React.Basic.element _MenuItem

menuItemWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (MenuItemPropsOptions (MUI.Core.ListItem.ListItemPropsOptions React.Basic.DOM.Props_li)) => Prim.Row.Union jss jss_ MenuItemClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
menuItemWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _MenuItem)