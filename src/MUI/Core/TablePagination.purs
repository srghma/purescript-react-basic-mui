module MUI.Core.TablePagination where

import Foreign (Foreign) as Foreign
import MUI.Core (JSS) as MUI.Core
import MUI.Core.IconButton (IconButtonProps) as MUI.Core.IconButton
import MUI.Core.Select (SelectProps) as MUI.Core.Select
import MUI.Core.Styles.Types (Theme) as MUI.Core.Styles.Types
import MUI.Core.Styles.WithStyles (withStyles) as MUI.Core.Styles.WithStyles
import MUI.Core.TableCell (TableCellPropsOptions) as MUI.Core.TableCell
import Prim.Row (class Union) as Prim.Row
import React.Basic (element, JSX, ReactComponent) as React.Basic
import React.Basic.DOM (Props_td) as React.Basic.DOM
import React.Basic.Events (EventHandler) as React.Basic.Events
import Unsafe.Coerce (unsafeCoerce) as Unsafe.Coerce

foreign import data Anonymous :: Type

anonymous :: { number :: Number -> Anonymous, record :: { label :: String, value :: Number } -> Anonymous }
anonymous = { number: Unsafe.Coerce.unsafeCoerce, record: Unsafe.Coerce.unsafeCoerce }

type TablePaginationPropsOptions componentProps = ( "SelectProps" :: MUI.Core.Select.SelectProps, backIconButtonProps :: MUI.Core.IconButton.IconButtonProps, children :: Array React.Basic.JSX, classes :: TablePaginationClassKey, count :: Number, labelDisplayedRows :: Foreign.Foreign, labelRowsPerPage :: React.Basic.JSX, nextIconButtonProps :: MUI.Core.IconButton.IconButtonProps, onChangePage :: React.Basic.Events.EventHandler, onChangeRowsPerPage :: React.Basic.Events.EventHandler, page :: Number, rowsPerPage :: Number, rowsPerPageOptions :: Array Anonymous | componentProps )

foreign import data TablePaginationProps :: Type

foreign import data TablePaginationPropsPartial :: Type

tablePaginationPropsPartial :: ∀ options_ options. Prim.Row.Union options options_ (TablePaginationPropsOptions (MUI.Core.TableCell.TableCellPropsOptions React.Basic.DOM.Props_td)) => Record options -> TablePaginationPropsPartial
tablePaginationPropsPartial = Unsafe.Coerce.unsafeCoerce

type TablePaginationClassKeyGenericOptions a = (  )

type TablePaginationClassKeyOptions  = TablePaginationClassKeyGenericOptions String

foreign import data TablePaginationClassKey :: Type

tablePaginationClassKey :: ∀ required given. Prim.Row.Union given required TablePaginationClassKeyOptions => Record given -> TablePaginationClassKey
tablePaginationClassKey = Unsafe.Coerce.unsafeCoerce

type TablePaginationClassKeyOptionsJSS  = TablePaginationClassKeyGenericOptions MUI.Core.JSS

foreign import data TablePaginationClassKeyJSS :: Type

tablePaginationClassKeyJSS :: ∀ required given. Prim.Row.Union given required TablePaginationClassKeyOptionsJSS => Record given -> TablePaginationClassKeyJSS
tablePaginationClassKeyJSS = Unsafe.Coerce.unsafeCoerce

foreign import _TablePagination :: ∀ a. React.Basic.ReactComponent a

tablePagination :: ∀ required given. Prim.Row.Union given required (TablePaginationPropsOptions (MUI.Core.TableCell.TableCellPropsOptions React.Basic.DOM.Props_td)) => Record given -> React.Basic.JSX
tablePagination = React.Basic.element _TablePagination

tablePagination_component :: ∀ required given componentProps. Prim.Row.Union given required (TablePaginationPropsOptions componentProps) => Record given -> React.Basic.JSX
tablePagination_component = React.Basic.element _TablePagination

tablePaginationWithStyles :: ∀ required jss_ jss given. Prim.Row.Union given required (TablePaginationPropsOptions (MUI.Core.TableCell.TableCellPropsOptions React.Basic.DOM.Props_td)) => Prim.Row.Union jss jss_ TablePaginationClassKeyOptionsJSS => (MUI.Core.Styles.Types.Theme -> Record jss) -> Record given -> React.Basic.JSX
tablePaginationWithStyles style = React.Basic.element (Unsafe.Coerce.unsafeCoerce MUI.Core.Styles.WithStyles.withStyles style _TablePagination)