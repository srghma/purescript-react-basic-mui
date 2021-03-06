module MUI.Core.Snackbar where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.ClickAwayListener (ClickAwayListenerProps) as MUI.Core.ClickAwayListener
import MUI.Core.SnackbarContent (SnackbarContentProps) as MUI.Core.SnackbarContent
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import React.Basic.Events (EventHandler) as React.Basic.Events
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce
import Unsafe.Reference (unsafeRefEq) as Unsafe.Reference

foreign import data TransitionDuration :: Type

transitionDuration :: { number :: Number -> TransitionDuration, record :: { appear :: Number, enter :: Number, exit :: Number } -> TransitionDuration }
transitionDuration = { number: Unsafe.Coerce.unsafeCoerce, record: Unsafe.Coerce.unsafeCoerce }

foreign import data Vertical :: Type

vertical :: { bottom :: Vertical, top :: Vertical }
vertical = { bottom: Unsafe.Coerce.unsafeCoerce "bottom", top: Unsafe.Coerce.unsafeCoerce "top" }

foreign import data Horizontal :: Type

horizontal :: { center :: Horizontal, left :: Horizontal, right :: Horizontal }
horizontal = { center: Unsafe.Coerce.unsafeCoerce "center", left: Unsafe.Coerce.unsafeCoerce "left", right: Unsafe.Coerce.unsafeCoerce "right" }

instance eqHorizontal :: Eq Horizontal where
  eq = Unsafe.Reference.unsafeRefEq

instance eqVertical :: Eq Vertical where
  eq = Unsafe.Reference.unsafeRefEq

type SnackbarPropsOptions componentProps = ( "ClickAwayListenerProps" :: MUI.Core.ClickAwayListener.ClickAwayListenerProps, "ContentProps" :: MUI.Core.SnackbarContent.SnackbarContentProps, action :: React.Basic.JSX, anchorOrigin :: { horizontal :: Horizontal, vertical :: Vertical }, autoHideDuration :: Number, children :: Array React.Basic.JSX, classes :: SnackbarClassKey, disableWindowBlurListener :: Boolean, message :: React.Basic.JSX, onClose :: React.Basic.Events.EventHandler, onEnter :: React.Basic.Events.EventHandler, onEntered :: React.Basic.Events.EventHandler, onEntering :: React.Basic.Events.EventHandler, onExit :: React.Basic.Events.EventHandler, onExited :: React.Basic.Events.EventHandler, onExiting :: React.Basic.Events.EventHandler, open :: Boolean, resumeHideDuration :: Number, transitionDuration :: TransitionDuration | componentProps )

foreign import data SnackbarProps :: Type

foreign import data SnackbarPropsPartial :: Type

snackbarPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (SnackbarPropsOptions React.Basic.DOM.Props_div) => Record options -> SnackbarPropsPartial
snackbarPropsPartial = Unsafe.Coerce.unsafeCoerce

type SnackbarClassKeyGenericOptions a = ( anchorOriginBottomCenter :: a, anchorOriginBottomLeft :: a, anchorOriginBottomRight :: a, anchorOriginTopCenter :: a, anchorOriginTopLeft :: a, anchorOriginTopRight :: a, root :: a )

type SnackbarClassKeyOptions  = SnackbarClassKeyGenericOptions String

foreign import data SnackbarClassKey :: Type

snackbarClassKey :: ∀ required given. Prim.Row.Union given required SnackbarClassKeyOptions => Record given -> SnackbarClassKey
snackbarClassKey = Unsafe.Coerce.unsafeCoerce

type SnackbarClassKeyOptionsJSS  = SnackbarClassKeyGenericOptions MUI.Core.JSS

foreign import data SnackbarClassKeyJSS :: Type

snackbarClassKeyJSS :: ∀ required given. Prim.Row.Union given required SnackbarClassKeyOptionsJSS => Record given -> SnackbarClassKeyJSS
snackbarClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _Snackbar :: ∀ a. React.Basic.ReactComponent a

snackbar :: ∀ required given. Prim.Row.Union given required (SnackbarPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
snackbar = React.Basic.element _Snackbar

snackbar_component :: ∀ required given componentProps. Prim.Row.Union given required (SnackbarPropsOptions componentProps) => Record given -> React.Basic.JSX
snackbar_component = React.Basic.element _Snackbar

snackbarWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (SnackbarPropsOptions React.Basic.DOM.Props_div) => Prim.Row.Union jss jss_ SnackbarClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
snackbarWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _Snackbar)