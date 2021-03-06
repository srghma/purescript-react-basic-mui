module MUI.Core.Breadcrumbs where

import Foreign (Foreign) as Foreign
import MUI.Core (JSS) as MUI.Core
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

type BreadcrumbsPropsOptions componentProps = ( children :: Array React.Basic.JSX, classes :: BreadcrumbsClassKey, itemsAfterCollapse :: Number, itemsBeforeCollapse :: Number, maxItems :: Number, ref :: Foreign.Foreign, separator :: React.Basic.JSX | componentProps )

foreign import data BreadcrumbsProps :: Type

foreign import data BreadcrumbsPropsPartial :: Type

breadcrumbsPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (BreadcrumbsPropsOptions React.Basic.DOM.Props_div) => Record options -> BreadcrumbsPropsPartial
breadcrumbsPropsPartial = Unsafe.Coerce.unsafeCoerce

type BreadcrumbsClassKeyGenericOptions a = ( li :: a, ol :: a, root :: a, separator :: a )

type BreadcrumbsClassKeyOptions  = BreadcrumbsClassKeyGenericOptions String

foreign import data BreadcrumbsClassKey :: Type

breadcrumbsClassKey :: ∀ required given. Prim.Row.Union given required BreadcrumbsClassKeyOptions => Record given -> BreadcrumbsClassKey
breadcrumbsClassKey = Unsafe.Coerce.unsafeCoerce

type BreadcrumbsClassKeyOptionsJSS  = BreadcrumbsClassKeyGenericOptions MUI.Core.JSS

foreign import data BreadcrumbsClassKeyJSS :: Type

breadcrumbsClassKeyJSS :: ∀ required given. Prim.Row.Union given required BreadcrumbsClassKeyOptionsJSS => Record given -> BreadcrumbsClassKeyJSS
breadcrumbsClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _Breadcrumbs :: ∀ a. React.Basic.ReactComponent a

breadcrumbs :: ∀ required given. Prim.Row.Union given required (BreadcrumbsPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
breadcrumbs = React.Basic.element _Breadcrumbs

breadcrumbs_component :: ∀ required given componentProps. Prim.Row.Union given required (BreadcrumbsPropsOptions componentProps) => Record given -> React.Basic.JSX
breadcrumbs_component = React.Basic.element _Breadcrumbs

breadcrumbsWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (BreadcrumbsPropsOptions React.Basic.DOM.Props_div) => Prim.Row.Union jss jss_ BreadcrumbsClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
breadcrumbsWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _Breadcrumbs)