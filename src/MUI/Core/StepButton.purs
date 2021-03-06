module MUI.Core.StepButton where

import Foreign (Foreign) as Foreign
import MUI.Core (JSS) as MUI.Core
import MUI.Core.ButtonBase (ButtonBasePropsOptions) as MUI.Core.ButtonBase
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_button) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce
import Unsafe.Reference (unsafeRefEq) as Unsafe.Reference

foreign import data Orientation :: Type

orientation :: { horizontal :: Orientation, vertical :: Orientation }
orientation = { horizontal: Unsafe.Coerce.unsafeCoerce "horizontal", vertical: Unsafe.Coerce.unsafeCoerce "vertical" }

instance eqOrientation :: Eq Orientation where
  eq = Unsafe.Reference.unsafeRefEq

type StepButtonPropsOptions componentProps = ( active :: Boolean, alternativeLabel :: Boolean, children :: Array React.Basic.JSX, classes :: StepButtonClassKey, completed :: Boolean, disabled :: Boolean, icon :: Foreign.Foreign, last :: Boolean, optional :: React.Basic.JSX, orientation :: Orientation | componentProps )

foreign import data StepButtonProps :: Type

foreign import data StepButtonPropsPartial :: Type

stepButtonPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (StepButtonPropsOptions (MUI.Core.ButtonBase.ButtonBasePropsOptions React.Basic.DOM.Props_button)) => Record options -> StepButtonPropsPartial
stepButtonPropsPartial = Unsafe.Coerce.unsafeCoerce

type StepButtonClassKeyGenericOptions a = ( root :: a, touchRipple :: a, vertical :: a )

type StepButtonClassKeyOptions  = StepButtonClassKeyGenericOptions String

foreign import data StepButtonClassKey :: Type

stepButtonClassKey :: ∀ required given. Prim.Row.Union given required StepButtonClassKeyOptions => Record given -> StepButtonClassKey
stepButtonClassKey = Unsafe.Coerce.unsafeCoerce

type StepButtonClassKeyOptionsJSS  = StepButtonClassKeyGenericOptions MUI.Core.JSS

foreign import data StepButtonClassKeyJSS :: Type

stepButtonClassKeyJSS :: ∀ required given. Prim.Row.Union given required StepButtonClassKeyOptionsJSS => Record given -> StepButtonClassKeyJSS
stepButtonClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _StepButton :: ∀ a. React.Basic.ReactComponent a

stepButton :: ∀ required given. Prim.Row.Union given required (StepButtonPropsOptions (MUI.Core.ButtonBase.ButtonBasePropsOptions React.Basic.DOM.Props_button)) => Record given -> React.Basic.JSX
stepButton = React.Basic.element _StepButton

stepButton_component :: ∀ required given componentProps. Prim.Row.Union given required (StepButtonPropsOptions componentProps) => Record given -> React.Basic.JSX
stepButton_component = React.Basic.element _StepButton

stepButtonWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (StepButtonPropsOptions (MUI.Core.ButtonBase.ButtonBasePropsOptions React.Basic.DOM.Props_button)) => Prim.Row.Union jss jss_ StepButtonClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
stepButtonWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _StepButton)