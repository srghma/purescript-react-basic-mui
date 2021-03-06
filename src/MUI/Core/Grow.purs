module MUI.Core.Grow where

import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

foreign import data Timeout :: Type

timeout :: { auto :: Timeout, number :: Number -> Timeout, record :: { appear :: Number, enter :: Number, exit :: Number } -> Timeout }
timeout = { auto: Unsafe.Coerce.unsafeCoerce "auto", number: Unsafe.Coerce.unsafeCoerce, record: Unsafe.Coerce.unsafeCoerce }

type GrowPropsOptions componentProps = ( "in" :: Boolean, timeout :: Timeout | componentProps )

foreign import data GrowProps :: Type

foreign import data GrowPropsPartial :: Type

growPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (GrowPropsOptions React.Basic.DOM.Props_div) => Record options -> GrowPropsPartial
growPropsPartial = Unsafe.Coerce.unsafeCoerce

foreign import _Grow :: ∀ a. React.Basic.ReactComponent a

grow :: ∀ required given. Prim.Row.Union given required (GrowPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
grow = React.Basic.element _Grow

grow_component :: ∀ required given componentProps. Prim.Row.Union given required (GrowPropsOptions componentProps) => Record given -> React.Basic.JSX
grow_component = React.Basic.element _Grow