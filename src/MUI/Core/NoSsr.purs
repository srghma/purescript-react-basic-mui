module MUI.Core.NoSsr where

import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

type NoSsrPropsOptions componentProps = ( children :: Array React.Basic.JSX, defer :: Boolean, fallback :: React.Basic.JSX | componentProps )

foreign import data NoSsrProps :: Type

foreign import data NoSsrPropsPartial :: Type

noSsrPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (NoSsrPropsOptions React.Basic.DOM.Props_div) => Record options -> NoSsrPropsPartial
noSsrPropsPartial = Unsafe.Coerce.unsafeCoerce

foreign import _NoSsr :: ∀ a. React.Basic.ReactComponent a

noSsr :: ∀ required given. Prim.Row.Union given required (NoSsrPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
noSsr = React.Basic.element _NoSsr

noSsr_component :: ∀ required given componentProps. Prim.Row.Union given required (NoSsrPropsOptions componentProps) => Record given -> React.Basic.JSX
noSsr_component = React.Basic.element _NoSsr