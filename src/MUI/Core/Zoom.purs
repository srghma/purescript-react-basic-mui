module MUI.Core.Zoom where

import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

foreign import data Timeout :: Type

timeout :: { number :: Number -> Timeout, record :: { appear :: Number, enter :: Number, exit :: Number } -> Timeout }
timeout = { number: Unsafe.Coerce.unsafeCoerce, record: Unsafe.Coerce.unsafeCoerce }

type ZoomPropsOptions componentProps = ( "in" :: Boolean, timeout :: Timeout | componentProps )

foreign import data ZoomProps :: Type

foreign import data ZoomPropsPartial :: Type

zoomPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (ZoomPropsOptions React.Basic.DOM.Props_div) => Record options -> ZoomPropsPartial
zoomPropsPartial = Unsafe.Coerce.unsafeCoerce

foreign import _Zoom :: ∀ a. React.Basic.ReactComponent a

zoom :: ∀ required given. Prim.Row.Union given required (ZoomPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
zoom = React.Basic.element _Zoom

zoom_component :: ∀ required given componentProps. Prim.Row.Union given required (ZoomPropsOptions componentProps) => Record given -> React.Basic.JSX
zoom_component = React.Basic.element _Zoom