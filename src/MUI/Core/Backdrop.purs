module MUI.Core.Backdrop where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Fade (FadePropsOptions) as MUI.Core.Fade
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (CSS, Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

foreign import data TransitionDuration :: Type

transitionDuration :: { number :: Number -> TransitionDuration, record :: { appear :: Number, enter :: Number, exit :: Number } -> TransitionDuration }
transitionDuration = { number: Unsafe.Coerce.unsafeCoerce, record: Unsafe.Coerce.unsafeCoerce }

type BackdropPropsOptions componentProps = ( children :: Array React.Basic.JSX, classes :: BackdropClassKey, invisible :: Boolean, open :: Boolean, style :: React.Basic.DOM.CSS, transitionDuration :: TransitionDuration | componentProps )

foreign import data BackdropProps :: Type

foreign import data BackdropPropsPartial :: Type

backdropPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (BackdropPropsOptions (MUI.Core.Fade.FadePropsOptions React.Basic.DOM.Props_div)) => Record options -> BackdropPropsPartial
backdropPropsPartial = Unsafe.Coerce.unsafeCoerce

type BackdropClassKeyGenericOptions a = ( invisible :: a, root :: a )

type BackdropClassKeyOptions  = BackdropClassKeyGenericOptions String

foreign import data BackdropClassKey :: Type

backdropClassKey :: ∀ required given. Prim.Row.Union given required BackdropClassKeyOptions => Record given -> BackdropClassKey
backdropClassKey = Unsafe.Coerce.unsafeCoerce

type BackdropClassKeyOptionsJSS  = BackdropClassKeyGenericOptions MUI.Core.JSS

foreign import data BackdropClassKeyJSS :: Type

backdropClassKeyJSS :: ∀ required given. Prim.Row.Union given required BackdropClassKeyOptionsJSS => Record given -> BackdropClassKeyJSS
backdropClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _Backdrop :: ∀ a. React.Basic.ReactComponent a

backdrop :: ∀ required given. Prim.Row.Union given required (BackdropPropsOptions (MUI.Core.Fade.FadePropsOptions React.Basic.DOM.Props_div)) => Record given -> React.Basic.JSX
backdrop = React.Basic.element _Backdrop

backdrop_component :: ∀ required given componentProps. Prim.Row.Union given required (BackdropPropsOptions componentProps) => Record given -> React.Basic.JSX
backdrop_component = React.Basic.element _Backdrop

backdropWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (BackdropPropsOptions (MUI.Core.Fade.FadePropsOptions React.Basic.DOM.Props_div)) => Prim.Row.Union jss jss_ BackdropClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
backdropWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _Backdrop)