module MUI.Core.CardActions where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

type CardActionsPropsOptions componentProps = ( children :: Array React.Basic.JSX, classes :: CardActionsClassKey, disableSpacing :: Boolean | componentProps )

foreign import data CardActionsProps :: Type

foreign import data CardActionsPropsPartial :: Type

cardActionsPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (CardActionsPropsOptions React.Basic.DOM.Props_div) => Record options -> CardActionsPropsPartial
cardActionsPropsPartial = Unsafe.Coerce.unsafeCoerce

type CardActionsClassKeyGenericOptions a = ( root :: a, spacing :: a )

type CardActionsClassKeyOptions  = CardActionsClassKeyGenericOptions String

foreign import data CardActionsClassKey :: Type

cardActionsClassKey :: ∀ required given. Prim.Row.Union given required CardActionsClassKeyOptions => Record given -> CardActionsClassKey
cardActionsClassKey = Unsafe.Coerce.unsafeCoerce

type CardActionsClassKeyOptionsJSS  = CardActionsClassKeyGenericOptions MUI.Core.JSS

foreign import data CardActionsClassKeyJSS :: Type

cardActionsClassKeyJSS :: ∀ required given. Prim.Row.Union given required CardActionsClassKeyOptionsJSS => Record given -> CardActionsClassKeyJSS
cardActionsClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _CardActions :: ∀ a. React.Basic.ReactComponent a

cardActions :: ∀ required given. Prim.Row.Union given required (CardActionsPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
cardActions = React.Basic.element _CardActions

cardActions_component :: ∀ required given componentProps. Prim.Row.Union given required (CardActionsPropsOptions componentProps) => Record given -> React.Basic.JSX
cardActions_component = React.Basic.element _CardActions

cardActionsWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (CardActionsPropsOptions React.Basic.DOM.Props_div) => Prim.Row.Union jss jss_ CardActionsClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
cardActionsWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _CardActions)