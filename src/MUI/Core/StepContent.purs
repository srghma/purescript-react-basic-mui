module MUI.Core.StepContent where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce
import Unsafe.Reference (unsafeRefEq) as Unsafe.Reference

foreign import data Orientation :: Type

orientation :: { horizontal :: Orientation, vertical :: Orientation }
orientation = { horizontal: Unsafe.Coerce.unsafeCoerce "horizontal", vertical: Unsafe.Coerce.unsafeCoerce "vertical" }

instance eqOrientation :: Eq Orientation where
  eq = Unsafe.Reference.unsafeRefEq

type StepContentPropsOptions componentProps = ( active :: Boolean, alternativeLabel :: Boolean, children :: Array React.Basic.JSX, classes :: StepContentClassKey, completed :: Boolean, last :: Boolean, optional :: Boolean, orientation :: Orientation | componentProps )

foreign import data StepContentProps :: Type

foreign import data StepContentPropsPartial :: Type

stepContentPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (StepContentPropsOptions React.Basic.DOM.Props_div) => Record options -> StepContentPropsPartial
stepContentPropsPartial = Unsafe.Coerce.unsafeCoerce

type StepContentClassKeyGenericOptions a = ( last :: a, root :: a, transition :: a )

type StepContentClassKeyOptions  = StepContentClassKeyGenericOptions String

foreign import data StepContentClassKey :: Type

stepContentClassKey :: ∀ required given. Prim.Row.Union given required StepContentClassKeyOptions => Record given -> StepContentClassKey
stepContentClassKey = Unsafe.Coerce.unsafeCoerce

type StepContentClassKeyOptionsJSS  = StepContentClassKeyGenericOptions MUI.Core.JSS

foreign import data StepContentClassKeyJSS :: Type

stepContentClassKeyJSS :: ∀ required given. Prim.Row.Union given required StepContentClassKeyOptionsJSS => Record given -> StepContentClassKeyJSS
stepContentClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _StepContent :: ∀ a. React.Basic.ReactComponent a

stepContent :: ∀ required given. Prim.Row.Union given required (StepContentPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
stepContent = React.Basic.element _StepContent

stepContent_component :: ∀ required given componentProps. Prim.Row.Union given required (StepContentPropsOptions componentProps) => Record given -> React.Basic.JSX
stepContent_component = React.Basic.element _StepContent

stepContentWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (StepContentPropsOptions React.Basic.DOM.Props_div) => Prim.Row.Union jss jss_ StepContentClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
stepContentWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _StepContent)