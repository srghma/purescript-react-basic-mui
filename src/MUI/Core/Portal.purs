module MUI.Core.Portal where

import Foreign (Foreign) as Foreign
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import React.Basic.Events (EventHandler) as React.Basic.Events
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

type PortalPropsOptions componentProps = ( children :: Array React.Basic.JSX, container :: Foreign.Foreign, disablePortal :: Boolean, onRendered :: React.Basic.Events.EventHandler | componentProps )

foreign import data PortalProps :: Type

foreign import data PortalPropsPartial :: Type

portalPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (PortalPropsOptions React.Basic.DOM.Props_div) => Record options -> PortalPropsPartial
portalPropsPartial = Unsafe.Coerce.unsafeCoerce

foreign import _Portal :: ∀ a. React.Basic.ReactComponent a

portal :: ∀ required given. Prim.Row.Union given required (PortalPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
portal = React.Basic.element _Portal

portal_component :: ∀ required given componentProps. Prim.Row.Union given required (PortalPropsOptions componentProps) => Record given -> React.Basic.JSX
portal_component = React.Basic.element _Portal