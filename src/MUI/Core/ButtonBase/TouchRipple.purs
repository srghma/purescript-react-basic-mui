module MUI.Core.ButtonBase.TouchRipple where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_span) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

type TouchRipplePropsOptions componentProps = ( center :: Boolean, classes :: TouchRippleClassKey | componentProps )

foreign import data TouchRippleProps :: Type

foreign import data TouchRipplePropsPartial :: Type

touchRipplePropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (TouchRipplePropsOptions React.Basic.DOM.Props_span) => Record options -> TouchRipplePropsPartial
touchRipplePropsPartial = Unsafe.Coerce.unsafeCoerce

type TouchRippleClassKeyGenericOptions a = ( child :: a, childLeaving :: a, childPulsate :: a, ripple :: a, ripplePulsate :: a, rippleVisible :: a, root :: a )

type TouchRippleClassKeyOptions  = TouchRippleClassKeyGenericOptions String

foreign import data TouchRippleClassKey :: Type

touchRippleClassKey :: ∀ required given. Prim.Row.Union given required TouchRippleClassKeyOptions => Record given -> TouchRippleClassKey
touchRippleClassKey = Unsafe.Coerce.unsafeCoerce

type TouchRippleClassKeyOptionsJSS  = TouchRippleClassKeyGenericOptions MUI.Core.JSS

foreign import data TouchRippleClassKeyJSS :: Type

touchRippleClassKeyJSS :: ∀ required given. Prim.Row.Union given required TouchRippleClassKeyOptionsJSS => Record given -> TouchRippleClassKeyJSS
touchRippleClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _TouchRipple :: ∀ a. React.Basic.ReactComponent a

touchRipple :: ∀ required given. Prim.Row.Union given required (TouchRipplePropsOptions React.Basic.DOM.Props_span) => Record given -> React.Basic.JSX
touchRipple = React.Basic.element _TouchRipple

touchRipple_component :: ∀ required given componentProps. Prim.Row.Union given required (TouchRipplePropsOptions componentProps) => Record given -> React.Basic.JSX
touchRipple_component = React.Basic.element _TouchRipple

touchRippleWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (TouchRipplePropsOptions React.Basic.DOM.Props_span) => Prim.Row.Union jss jss_ TouchRippleClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
touchRippleWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _TouchRipple)