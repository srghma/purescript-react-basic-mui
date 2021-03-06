module MUI.Core.Menu where

import Data.Nullable (Nullable) as Data.Nullable
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
import Web.DOM (Element) as Web.DOM

foreign import data Variant :: Type

variant :: { menu :: Variant, selectedMenu :: Variant }
variant = { menu: Unsafe.Coerce.unsafeCoerce "menu", selectedMenu: Unsafe.Coerce.unsafeCoerce "selectedMenu" }

foreign import data TransitionDuration :: Type

transitionDuration :: { auto :: TransitionDuration, number :: Number -> TransitionDuration, record :: { appear :: Number, enter :: Number, exit :: Number } -> TransitionDuration }
transitionDuration = { auto: Unsafe.Coerce.unsafeCoerce "auto", number: Unsafe.Coerce.unsafeCoerce, record: Unsafe.Coerce.unsafeCoerce }

instance eqVariant :: Eq Variant where
  eq = Unsafe.Reference.unsafeRefEq

type MenuPropsOptions componentProps = ( anchorEl :: Data.Nullable.Nullable Web.DOM.Element, autoFocus :: Boolean, children :: Array React.Basic.JSX, classes :: MenuClassKey, disableAutoFocusItem :: Boolean, onClose :: React.Basic.Events.EventHandler, onEnter :: React.Basic.Events.EventHandler, onEntered :: React.Basic.Events.EventHandler, onEntering :: React.Basic.Events.EventHandler, onExit :: React.Basic.Events.EventHandler, onExited :: React.Basic.Events.EventHandler, onExiting :: React.Basic.Events.EventHandler, open :: Boolean, transitionDuration :: TransitionDuration, variant :: Variant | componentProps )

foreign import data MenuProps :: Type

foreign import data MenuPropsPartial :: Type

menuPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (MenuPropsOptions React.Basic.DOM.Props_div) => Record options -> MenuPropsPartial
menuPropsPartial = Unsafe.Coerce.unsafeCoerce

type MenuClassKeyGenericOptions a = ( list :: a, paper :: a )

type MenuClassKeyOptions  = MenuClassKeyGenericOptions String

foreign import data MenuClassKey :: Type

menuClassKey :: ∀ required given. Prim.Row.Union given required MenuClassKeyOptions => Record given -> MenuClassKey
menuClassKey = Unsafe.Coerce.unsafeCoerce

type MenuClassKeyOptionsJSS  = MenuClassKeyGenericOptions MUI.Core.JSS

foreign import data MenuClassKeyJSS :: Type

menuClassKeyJSS :: ∀ required given. Prim.Row.Union given required MenuClassKeyOptionsJSS => Record given -> MenuClassKeyJSS
menuClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _Menu :: ∀ a. React.Basic.ReactComponent a

menu :: ∀ required given. Prim.Row.Union given required (MenuPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
menu = React.Basic.element _Menu

menu_component :: ∀ required given componentProps. Prim.Row.Union given required (MenuPropsOptions componentProps) => Record given -> React.Basic.JSX
menu_component = React.Basic.element _Menu

menuWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (MenuPropsOptions React.Basic.DOM.Props_div) => Prim.Row.Union jss jss_ MenuClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
menuWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _Menu)