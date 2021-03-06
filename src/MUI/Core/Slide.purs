module MUI.Core.Slide where

import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import React.Basic.Events (EventHandler) as React.Basic.Events
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce
import Unsafe.Reference (unsafeRefEq) as Unsafe.Reference

foreign import data Timeout :: Type

timeout :: { number :: Number -> Timeout, record :: { appear :: Number, enter :: Number, exit :: Number } -> Timeout }
timeout = { number: Unsafe.Coerce.unsafeCoerce, record: Unsafe.Coerce.unsafeCoerce }

foreign import data Direction :: Type

direction :: { down :: Direction, left :: Direction, right :: Direction, up :: Direction }
direction = { down: Unsafe.Coerce.unsafeCoerce "down", left: Unsafe.Coerce.unsafeCoerce "left", right: Unsafe.Coerce.unsafeCoerce "right", up: Unsafe.Coerce.unsafeCoerce "up" }

instance eqDirection :: Eq Direction where
  eq = Unsafe.Reference.unsafeRefEq

type SlidePropsOptions componentProps = ( direction :: Direction, "in" :: Boolean, onEnter :: React.Basic.Events.EventHandler, onEntered :: React.Basic.Events.EventHandler, onEntering :: React.Basic.Events.EventHandler, onExit :: React.Basic.Events.EventHandler, onExited :: React.Basic.Events.EventHandler, onExiting :: React.Basic.Events.EventHandler, timeout :: Timeout | componentProps )

foreign import data SlideProps :: Type

foreign import data SlidePropsPartial :: Type

slidePropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (SlidePropsOptions React.Basic.DOM.Props_div) => Record options -> SlidePropsPartial
slidePropsPartial = Unsafe.Coerce.unsafeCoerce

foreign import _Slide :: ∀ a. React.Basic.ReactComponent a

slide :: ∀ required given. Prim.Row.Union given required (SlidePropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
slide = React.Basic.element _Slide

slide_component :: ∀ required given componentProps. Prim.Row.Union given required (SlidePropsOptions componentProps) => Record given -> React.Basic.JSX
slide_component = React.Basic.element _Slide