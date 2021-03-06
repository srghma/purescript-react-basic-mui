module MUI.Core.ExpansionPanelActions where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

type ExpansionPanelActionsPropsOptions componentProps = ( children :: Array React.Basic.JSX, classes :: ExpansionPanelActionsClassKey | componentProps )

foreign import data ExpansionPanelActionsProps :: Type

foreign import data ExpansionPanelActionsPropsPartial :: Type

expansionPanelActionsPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (ExpansionPanelActionsPropsOptions React.Basic.DOM.Props_div) => Record options -> ExpansionPanelActionsPropsPartial
expansionPanelActionsPropsPartial = Unsafe.Coerce.unsafeCoerce

type ExpansionPanelActionsClassKeyGenericOptions a = ( root :: a, spacing :: a )

type ExpansionPanelActionsClassKeyOptions  = ExpansionPanelActionsClassKeyGenericOptions String

foreign import data ExpansionPanelActionsClassKey :: Type

expansionPanelActionsClassKey :: ∀ required given. Prim.Row.Union given required ExpansionPanelActionsClassKeyOptions => Record given -> ExpansionPanelActionsClassKey
expansionPanelActionsClassKey = Unsafe.Coerce.unsafeCoerce

type ExpansionPanelActionsClassKeyOptionsJSS  = ExpansionPanelActionsClassKeyGenericOptions MUI.Core.JSS

foreign import data ExpansionPanelActionsClassKeyJSS :: Type

expansionPanelActionsClassKeyJSS :: ∀ required given. Prim.Row.Union given required ExpansionPanelActionsClassKeyOptionsJSS => Record given -> ExpansionPanelActionsClassKeyJSS
expansionPanelActionsClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _ExpansionPanelActions :: ∀ a. React.Basic.ReactComponent a

expansionPanelActions :: ∀ required given. Prim.Row.Union given required (ExpansionPanelActionsPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
expansionPanelActions = React.Basic.element _ExpansionPanelActions

expansionPanelActions_component :: ∀ required given componentProps. Prim.Row.Union given required (ExpansionPanelActionsPropsOptions componentProps) => Record given -> React.Basic.JSX
expansionPanelActions_component = React.Basic.element _ExpansionPanelActions

expansionPanelActionsWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (ExpansionPanelActionsPropsOptions React.Basic.DOM.Props_div) => Prim.Row.Union jss jss_ ExpansionPanelActionsClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
expansionPanelActionsWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _ExpansionPanelActions)