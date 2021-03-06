module MUI.Core.Table where

import MUI.Core (JSS) as MUI.Core
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_table) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce
import Unsafe.Reference (unsafeRefEq) as Unsafe.Reference

foreign import data Size :: Type

size :: { medium :: Size, small :: Size }
size = { medium: Unsafe.Coerce.unsafeCoerce "medium", small: Unsafe.Coerce.unsafeCoerce "small" }

foreign import data Padding :: Type

padding :: { checkbox :: Padding, default :: Padding, none :: Padding }
padding = { checkbox: Unsafe.Coerce.unsafeCoerce "checkbox", default: Unsafe.Coerce.unsafeCoerce "default", none: Unsafe.Coerce.unsafeCoerce "none" }

instance eqPadding :: Eq Padding where
  eq = Unsafe.Reference.unsafeRefEq

instance eqSize :: Eq Size where
  eq = Unsafe.Reference.unsafeRefEq

type TablePropsOptions componentProps = ( children :: Array React.Basic.JSX, classes :: TableClassKey, padding :: Padding, size :: Size, stickyHeader :: Boolean | componentProps )

foreign import data TableProps :: Type

foreign import data TablePropsPartial :: Type

tablePropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (TablePropsOptions React.Basic.DOM.Props_table) => Record options -> TablePropsPartial
tablePropsPartial = Unsafe.Coerce.unsafeCoerce

type TableClassKeyGenericOptions a = ( root :: a, stickyHeader :: a )

type TableClassKeyOptions  = TableClassKeyGenericOptions String

foreign import data TableClassKey :: Type

tableClassKey :: ∀ required given. Prim.Row.Union given required TableClassKeyOptions => Record given -> TableClassKey
tableClassKey = Unsafe.Coerce.unsafeCoerce

type TableClassKeyOptionsJSS  = TableClassKeyGenericOptions MUI.Core.JSS

foreign import data TableClassKeyJSS :: Type

tableClassKeyJSS :: ∀ required given. Prim.Row.Union given required TableClassKeyOptionsJSS => Record given -> TableClassKeyJSS
tableClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _Table :: ∀ a. React.Basic.ReactComponent a

table :: ∀ required given. Prim.Row.Union given required (TablePropsOptions React.Basic.DOM.Props_table) => Record given -> React.Basic.JSX
table = React.Basic.element _Table

table_component :: ∀ required given componentProps. Prim.Row.Union given required (TablePropsOptions componentProps) => Record given -> React.Basic.JSX
table_component = React.Basic.element _Table

tableWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (TablePropsOptions React.Basic.DOM.Props_table) => Prim.Row.Union jss jss_ TableClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
tableWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _Table)