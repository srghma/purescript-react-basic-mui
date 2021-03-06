module MUI.Core.RootRef where

import Foreign (Foreign) as Foreign
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

type RootRefPropsOptions componentProps = ( rootRef :: Foreign.Foreign | componentProps )

foreign import data RootRefProps :: Type

foreign import data RootRefPropsPartial :: Type

rootRefPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (RootRefPropsOptions React.Basic.DOM.Props_div) => Record options -> RootRefPropsPartial
rootRefPropsPartial = Unsafe.Coerce.unsafeCoerce

foreign import _RootRef :: ∀ a. React.Basic.ReactComponent a

rootRef :: ∀ required given. Prim.Row.Union given required (RootRefPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
rootRef = React.Basic.element _RootRef

rootRef_component :: ∀ required given componentProps. Prim.Row.Union given required (RootRefPropsOptions componentProps) => Record given -> React.Basic.JSX
rootRef_component = React.Basic.element _RootRef