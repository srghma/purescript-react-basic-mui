module MUI.Core.Tabs where

import Foreign (Foreign) as Foreign
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

variant :: { fullWidth :: Variant, scrollable :: Variant, standard :: Variant }
variant = { fullWidth: Unsafe.Coerce.unsafeCoerce "fullWidth", scrollable: Unsafe.Coerce.unsafeCoerce "scrollable", standard: Unsafe.Coerce.unsafeCoerce "standard" }

foreign import data ScrollButtons :: Type

scrollButtons :: { auto :: ScrollButtons, desktop :: ScrollButtons, off :: ScrollButtons, on :: ScrollButtons }
scrollButtons = { auto: Unsafe.Coerce.unsafeCoerce "auto", desktop: Unsafe.Coerce.unsafeCoerce "desktop", off: Unsafe.Coerce.unsafeCoerce "off", on: Unsafe.Coerce.unsafeCoerce "on" }

foreign import data Orientation :: Type

orientation :: { horizontal :: Orientation, vertical :: Orientation }
orientation = { horizontal: Unsafe.Coerce.unsafeCoerce "horizontal", vertical: Unsafe.Coerce.unsafeCoerce "vertical" }

instance eqOrientation :: Eq Orientation where
  eq = Unsafe.Reference.unsafeRefEq

instance eqScrollButtons :: Eq ScrollButtons where
  eq = Unsafe.Reference.unsafeRefEq

instance eqVariant :: Eq Variant where
  eq = Unsafe.Reference.unsafeRefEq

type TabsPropsOptions componentProps = ( "ScrollButtonComponent" :: Foreign.Foreign, "TabIndicatorProps" :: Foreign.Foreign, action :: Foreign.Foreign, centered :: Boolean, children :: Array React.Basic.JSX, classes :: TabsClassKey, indicatorColor :: String, onChange :: React.Basic.Events.EventHandler, orientation :: Orientation, scrollButtons :: ScrollButtons, textColor :: String, value :: Foreign.Foreign, variant :: Variant, width :: String | componentProps )

foreign import data TabsProps :: Type

foreign import data TabsPropsPartial :: Type

tabsPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (TabsPropsOptions React.Basic.DOM.Props_div) => Record options -> TabsPropsPartial
tabsPropsPartial = Unsafe.Coerce.unsafeCoerce

type TabsClassKeyGenericOptions a = ( centered :: a, fixed :: a, flexContainer :: a, indicator :: a, root :: a, scrollButtons :: a, scrollButtonsDesktop :: a, scrollable :: a, scroller :: a )

type TabsClassKeyOptions  = TabsClassKeyGenericOptions String

foreign import data TabsClassKey :: Type

tabsClassKey :: ∀ required given. Prim.Row.Union given required TabsClassKeyOptions => Record given -> TabsClassKey
tabsClassKey = Unsafe.Coerce.unsafeCoerce

type TabsClassKeyOptionsJSS  = TabsClassKeyGenericOptions MUI.Core.JSS

foreign import data TabsClassKeyJSS :: Type

tabsClassKeyJSS :: ∀ required given. Prim.Row.Union given required TabsClassKeyOptionsJSS => Record given -> TabsClassKeyJSS
tabsClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _Tabs :: ∀ a. React.Basic.ReactComponent a

tabs :: ∀ required given. Prim.Row.Union given required (TabsPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
tabs = React.Basic.element _Tabs

tabs_component :: ∀ required given componentProps. Prim.Row.Union given required (TabsPropsOptions componentProps) => Record given -> React.Basic.JSX
tabs_component = React.Basic.element _Tabs

tabsWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (TabsPropsOptions React.Basic.DOM.Props_div) => Prim.Row.Union jss jss_ TabsClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
tabsWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _Tabs)