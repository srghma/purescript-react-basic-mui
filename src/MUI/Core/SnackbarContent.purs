module MUI.Core.SnackbarContent where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Paper (PaperPropsOptions) as MUI.Core.Paper
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

type SnackbarContentPropsOptions componentProps = ( action :: React.Basic.JSX, classes :: SnackbarContentClassKey, message :: React.Basic.JSX, role :: String | componentProps )

foreign import data SnackbarContentProps :: Type

foreign import data SnackbarContentPropsPartial :: Type

snackbarContentPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (SnackbarContentPropsOptions (MUI.Core.Paper.PaperPropsOptions React.Basic.DOM.Props_div)) => Record options -> SnackbarContentPropsPartial
snackbarContentPropsPartial = Unsafe.Coerce.unsafeCoerce

type SnackbarContentClassKeyGenericOptions a = ( action :: a, message :: a, root :: a )

type SnackbarContentClassKeyOptions  = SnackbarContentClassKeyGenericOptions String

foreign import data SnackbarContentClassKey :: Type

snackbarContentClassKey :: ∀ required given. Prim.Row.Union given required SnackbarContentClassKeyOptions => Record given -> SnackbarContentClassKey
snackbarContentClassKey = Unsafe.Coerce.unsafeCoerce

type SnackbarContentClassKeyOptionsJSS  = SnackbarContentClassKeyGenericOptions MUI.Core.JSS

foreign import data SnackbarContentClassKeyJSS :: Type

snackbarContentClassKeyJSS :: ∀ required given. Prim.Row.Union given required SnackbarContentClassKeyOptionsJSS => Record given -> SnackbarContentClassKeyJSS
snackbarContentClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _SnackbarContent :: ∀ a. React.Basic.ReactComponent a

snackbarContent :: ∀ required given. Prim.Row.Union given required (SnackbarContentPropsOptions (MUI.Core.Paper.PaperPropsOptions React.Basic.DOM.Props_div)) => Record given -> React.Basic.JSX
snackbarContent = React.Basic.element _SnackbarContent

snackbarContent_component :: ∀ required given componentProps. Prim.Row.Union given required (SnackbarContentPropsOptions componentProps) => Record given -> React.Basic.JSX
snackbarContent_component = React.Basic.element _SnackbarContent

snackbarContentWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (SnackbarContentPropsOptions (MUI.Core.Paper.PaperPropsOptions React.Basic.DOM.Props_div)) => Prim.Row.Union jss jss_ SnackbarContentClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
snackbarContentWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _SnackbarContent)