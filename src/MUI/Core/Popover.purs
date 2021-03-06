module MUI.Core.Popover where

import Foreign (Foreign) as Foreign
import MUI.Core (JSS) as MUI.Core
import MUI.Core.Modal (ModalPropsOptions) as MUI.Core.Modal
import MUI.Core.Paper (PaperProps) as MUI.Core.Paper
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import React.Basic.Events (EventHandler) as React.Basic.Events
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

foreign import data TransitionDuration :: Type

transitionDuration :: { auto :: TransitionDuration, number :: Number -> TransitionDuration, record :: { appear :: Number, enter :: Number, exit :: Number } -> TransitionDuration }
transitionDuration = { auto: Unsafe.Coerce.unsafeCoerce "auto", number: Unsafe.Coerce.unsafeCoerce, record: Unsafe.Coerce.unsafeCoerce }

foreign import data Vertical :: Type

vertical :: { bottom :: Vertical, center :: Vertical, number :: Number -> Vertical, top :: Vertical }
vertical = { bottom: Unsafe.Coerce.unsafeCoerce "bottom", center: Unsafe.Coerce.unsafeCoerce "center", number: Unsafe.Coerce.unsafeCoerce, top: Unsafe.Coerce.unsafeCoerce "top" }

foreign import data Horizontal :: Type

horizontal :: { center :: Horizontal, left :: Horizontal, number :: Number -> Horizontal, right :: Horizontal }
horizontal = { center: Unsafe.Coerce.unsafeCoerce "center", left: Unsafe.Coerce.unsafeCoerce "left", number: Unsafe.Coerce.unsafeCoerce, right: Unsafe.Coerce.unsafeCoerce "right" }

type PopoverPropsOptions componentProps = ( "PaperProps" :: MUI.Core.Paper.PaperProps, action :: Foreign.Foreign, anchorEl :: Foreign.Foreign, anchorOrigin :: { horizontal :: Horizontal, vertical :: Vertical }, anchorPosition :: { left :: Number, top :: Number }, children :: Array React.Basic.JSX, classes :: PopoverClassKey, elevation :: Number, getContentAnchorEl :: Foreign.Foreign, marginThreshold :: Number, onChange :: React.Basic.Events.EventHandler, onEnter :: React.Basic.Events.EventHandler, onEntering :: React.Basic.Events.EventHandler, onExit :: React.Basic.Events.EventHandler, onExited :: React.Basic.Events.EventHandler, onExiting :: React.Basic.Events.EventHandler, open :: Boolean, transitionDuration :: TransitionDuration | componentProps )

foreign import data PopoverProps :: Type

foreign import data PopoverPropsPartial :: Type

popoverPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (PopoverPropsOptions (MUI.Core.Modal.ModalPropsOptions React.Basic.DOM.Props_div)) => Record options -> PopoverPropsPartial
popoverPropsPartial = Unsafe.Coerce.unsafeCoerce

type PopoverClassKeyGenericOptions a = ( paper :: a, root :: a )

type PopoverClassKeyOptions  = PopoverClassKeyGenericOptions String

foreign import data PopoverClassKey :: Type

popoverClassKey :: ∀ required given. Prim.Row.Union given required PopoverClassKeyOptions => Record given -> PopoverClassKey
popoverClassKey = Unsafe.Coerce.unsafeCoerce

type PopoverClassKeyOptionsJSS  = PopoverClassKeyGenericOptions MUI.Core.JSS

foreign import data PopoverClassKeyJSS :: Type

popoverClassKeyJSS :: ∀ required given. Prim.Row.Union given required PopoverClassKeyOptionsJSS => Record given -> PopoverClassKeyJSS
popoverClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _Popover :: ∀ a. React.Basic.ReactComponent a

popover :: ∀ required given. Prim.Row.Union given required (PopoverPropsOptions (MUI.Core.Modal.ModalPropsOptions React.Basic.DOM.Props_div)) => Record given -> React.Basic.JSX
popover = React.Basic.element _Popover

popover_component :: ∀ required given componentProps. Prim.Row.Union given required (PopoverPropsOptions componentProps) => Record given -> React.Basic.JSX
popover_component = React.Basic.element _Popover

popoverWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (PopoverPropsOptions (MUI.Core.Modal.ModalPropsOptions React.Basic.DOM.Props_div)) => Prim.Row.Union jss jss_ PopoverClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
popoverWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _Popover)