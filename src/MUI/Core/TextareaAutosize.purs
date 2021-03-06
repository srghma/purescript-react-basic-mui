module MUI.Core.TextareaAutosize where

import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_textarea) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

foreign import data RowsMax :: Type

rowsMax :: { number :: Number -> RowsMax, string :: String -> RowsMax }
rowsMax = { number: Unsafe.Coerce.unsafeCoerce, string: Unsafe.Coerce.unsafeCoerce }

type TextareaAutosizePropsOptions componentProps = ( children :: Array React.Basic.JSX, rows :: Number, rowsMax :: RowsMax | componentProps )

foreign import data TextareaAutosizeProps :: Type

foreign import data TextareaAutosizePropsPartial :: Type

textareaAutosizePropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (TextareaAutosizePropsOptions React.Basic.DOM.Props_textarea) => Record options -> TextareaAutosizePropsPartial
textareaAutosizePropsPartial = Unsafe.Coerce.unsafeCoerce

foreign import _TextareaAutosize :: ∀ a. React.Basic.ReactComponent a

textareaAutosize :: ∀ required given. Prim.Row.Union given required (TextareaAutosizePropsOptions React.Basic.DOM.Props_textarea) => Record given -> React.Basic.JSX
textareaAutosize = React.Basic.element _TextareaAutosize

textareaAutosize_component :: ∀ required given componentProps. Prim.Row.Union given required (TextareaAutosizePropsOptions componentProps) => Record given -> React.Basic.JSX
textareaAutosize_component = React.Basic.element _TextareaAutosize