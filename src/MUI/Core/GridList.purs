module MUI.Core.GridList where

import MUI.Core (JSS) as MUI.Core
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

foreign import data CellHeight :: Type

cellHeight :: { auto :: CellHeight, number :: Number -> CellHeight }
cellHeight = { auto: Unsafe.Coerce.unsafeCoerce "auto", number: Unsafe.Coerce.unsafeCoerce }

type GridListPropsOptions componentProps = ( cellHeight :: CellHeight, children :: Array React.Basic.JSX, classes :: GridListClassKey, cols :: Number, component :: React.Basic.ReactComponent {  | componentProps }, spacing :: Number | componentProps )

foreign import data GridListProps :: Type

type GridListClassKeyGenericOptions a = ( root :: a )

type GridListClassKeyOptions  = GridListClassKeyGenericOptions String

foreign import data GridListClassKey :: Type

gridListClassKey :: ∀ required given. Prim.Row.Union given required GridListClassKeyOptions => Record given -> GridListClassKey
gridListClassKey = Unsafe.Coerce.unsafeCoerce

type GridListClassKeyOptionsJSS  = GridListClassKeyGenericOptions MUI.Core.JSS

foreign import data GridListClassKeyJSS :: Type

gridListClassKeyJSS :: ∀ required given. Prim.Row.Union given required GridListClassKeyOptionsJSS => Record given -> GridListClassKeyJSS
gridListClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _GridList :: ∀ a. React.Basic.ReactComponent a

gridList :: ∀ required given. Prim.Row.Union given required (GridListPropsOptions React.Basic.DOM.Props_div) => Record given -> React.Basic.JSX
gridList = React.Basic.element _GridList

gridList_component :: ∀ required given componentProps. Prim.Row.Union given required (GridListPropsOptions componentProps) => Record given -> React.Basic.JSX
gridList_component = React.Basic.element _GridList