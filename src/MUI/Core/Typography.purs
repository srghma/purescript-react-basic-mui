module MUI.Core.Typography where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce
import Unsafe.Reference (unsafeRefEq) as Unsafe.Reference

foreign import data Variant :: Type

variant :: { body1 :: Variant, body2 :: Variant, button :: Variant, caption :: Variant, h1 :: Variant, h2 :: Variant, h3 :: Variant, h4 :: Variant, h5 :: Variant, h6 :: Variant, inherit :: Variant, overline :: Variant, srOnly :: Variant, subtitle1 :: Variant, subtitle2 :: Variant }
variant = { body1: Unsafe.Coerce.unsafeCoerce "body1", body2: Unsafe.Coerce.unsafeCoerce "body2", button: Unsafe.Coerce.unsafeCoerce "button", caption: Unsafe.Coerce.unsafeCoerce "caption", h1: Unsafe.Coerce.unsafeCoerce "h1", h2: Unsafe.Coerce.unsafeCoerce "h2", h3: Unsafe.Coerce.unsafeCoerce "h3", h4: Unsafe.Coerce.unsafeCoerce "h4", h5: Unsafe.Coerce.unsafeCoerce "h5", h6: Unsafe.Coerce.unsafeCoerce "h6", inherit: Unsafe.Coerce.unsafeCoerce "inherit", overline: Unsafe.Coerce.unsafeCoerce "overline", srOnly: Unsafe.Coerce.unsafeCoerce "srOnly", subtitle1: Unsafe.Coerce.unsafeCoerce "subtitle1", subtitle2: Unsafe.Coerce.unsafeCoerce "subtitle2" }

foreign import data Display :: Type

display :: { block :: Display, initial :: Display, inline :: Display }
display = { block: Unsafe.Coerce.unsafeCoerce "block", initial: Unsafe.Coerce.unsafeCoerce "initial", inline: Unsafe.Coerce.unsafeCoerce "inline" }

foreign import data Color :: Type

color :: { error :: Color, inherit :: Color, initial :: Color, primary :: Color, secondary :: Color, textPrimary :: Color, textSecondary :: Color }
color = { error: Unsafe.Coerce.unsafeCoerce "error", inherit: Unsafe.Coerce.unsafeCoerce "inherit", initial: Unsafe.Coerce.unsafeCoerce "initial", primary: Unsafe.Coerce.unsafeCoerce "primary", secondary: Unsafe.Coerce.unsafeCoerce "secondary", textPrimary: Unsafe.Coerce.unsafeCoerce "textPrimary", textSecondary: Unsafe.Coerce.unsafeCoerce "textSecondary" }

foreign import data Align :: Type

align :: { center :: Align, inherit :: Align, justify :: Align, left :: Align, right :: Align }
align = { center: Unsafe.Coerce.unsafeCoerce "center", inherit: Unsafe.Coerce.unsafeCoerce "inherit", justify: Unsafe.Coerce.unsafeCoerce "justify", left: Unsafe.Coerce.unsafeCoerce "left", right: Unsafe.Coerce.unsafeCoerce "right" }

instance eqAlign :: Eq Align where
  eq = Unsafe.Reference.unsafeRefEq

instance eqColor :: Eq Color where
  eq = Unsafe.Reference.unsafeRefEq

instance eqDisplay :: Eq Display where
  eq = Unsafe.Reference.unsafeRefEq

instance eqVariant :: Eq Variant where
  eq = Unsafe.Reference.unsafeRefEq

type TypographyPropsOptions componentProps = ( align :: Align, children :: Array React.Basic.JSX, classes :: TypographyClassKey, color :: Color, component :: React.Basic.ReactComponent {  | componentProps }, display :: Display, gutterBottom :: Boolean, noWrap :: Boolean, paragraph :: Boolean, variant :: Variant, variantMapping :: { body1 :: String, body2 :: String, button :: String, caption :: String, h1 :: String, h2 :: String, h3 :: String, h4 :: String, h5 :: String, h6 :: String, overline :: String, srOnly :: String, subtitle1 :: String, subtitle2 :: String } | componentProps )

foreign import data TypographyProps :: Type

foreign import data TypographyPropsPartial :: Type

typographyPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (TypographyPropsOptions React.Basic.DOM.Props_div) => Record options -> TypographyPropsPartial
typographyPropsPartial = Unsafe.Coerce.unsafeCoerce

type TypographyClassKeyGenericOptions a = ( alignCenter :: a, alignJustify :: a, alignLeft :: a, alignRight :: a, body1 :: a, body2 :: a, button :: a, caption :: a, colorError :: a, colorInherit :: a, colorSecondary :: a, colorTextSecondary :: a, displayBlock :: a, displayInline :: a, gutterBottom :: a, h1 :: a, h2 :: a, h3 :: a, h4 :: a, h5 :: a, h6 :: a, noWrap :: a, overline :: a, paragraph :: a, root :: a, srOnly :: a, subtitle1 :: a, subtitle2 :: a )

type TypographyClassKeyOptions  = TypographyClassKeyGenericOptions String

foreign import data TypographyClassKey :: Type

typographyClassKey :: ∀ required given. Prim.Row.Union given required TypographyClassKeyOptions => Record given -> TypographyClassKey
typographyClassKey = Unsafe.Coerce.unsafeCoerce

type TypographyClassKeyOptionsJSS  = TypographyClassKeyGenericOptions MUI.Core.JSS

foreign import data TypographyClassKeyJSS :: Type

typographyClassKeyJSS :: ∀ required given. Prim.Row.Union given required TypographyClassKeyOptionsJSS => Record given -> TypographyClassKeyJSS
typographyClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _Typography :: ∀ a. React.Basic.ReactComponent a

typography :: ∀ required given. Prim.Row.Union given required (TypographyPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
typography = React.Basic.element _Typography

typography_component :: ∀ required given componentProps. Prim.Row.Union given required (TypographyPropsOptions componentProps) => Record given -> React.Basic.JSX
typography_component = React.Basic.element _Typography

typographyWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (TypographyPropsOptions React.Basic.DOM.Props_div) => Prim.Row.Union jss jss_ TypographyClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
typographyWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _Typography)