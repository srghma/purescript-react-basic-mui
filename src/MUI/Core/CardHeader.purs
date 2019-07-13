module MUI.Core.CardHeader where

import Prelude

import Data.Maybe (Maybe(..))
import MUI.Core (JSS)
import MUI.Core.Internal (InternalJSX, toInternalChildren)
import React.Basic (JSX, ReactComponent, element)
import Simple.JSON (write)
import Unsafe.Coerce (unsafeCoerce)

type TypographyProps = String

type CardHeaderProps =
  ( action :: Maybe JSX
  , avatar :: Maybe JSX
  , children :: Maybe (Array JSX)
  , className :: Maybe String
  , classes :: CardHeaderClassKey 
  , component :: Maybe String
  , disableTypography :: Maybe Boolean
  , subheader :: Maybe JSX
  , subheaderTypographyProps :: Maybe TypographyProps
  , title :: Maybe JSX
  , titleTypographyProps :: Maybe TypographyProps
  )

type CardHeaderClassKey =
  { root :: Maybe JSS
  , avatar :: Maybe JSS
  , action :: Maybe JSS
  , content :: Maybe JSS
  , title :: Maybe JSS
  , subheader :: Maybe JSS
  }

classes :: CardHeaderClassKey 
classes = 
  { root : Nothing
  , avatar : Nothing
  , action : Nothing
  , content : Nothing
  , title : Nothing
  , subheader : Nothing
  }

cardHeaderProps :: { | CardHeaderProps }
cardHeaderProps =
  { action : Nothing
  , avatar : Nothing
  , children : Nothing
  , classes
  , className : Nothing
  , component : Just "div"
  , disableTypography : Just false
  , subheader : Nothing
  , subheaderTypographyProps : Nothing
  , title : Nothing
  , titleTypographyProps : Nothing
  }

action :: ∀ r. { action :: Maybe JSX | r } -> { action :: Maybe InternalJSX | r }
action = unsafeCoerce 

avatar :: ∀ r. { avatar :: Maybe JSX | r } -> { avatar :: Maybe InternalJSX | r }
avatar = unsafeCoerce

subheader :: ∀ r. { subheader :: Maybe JSX | r } -> { subheader :: Maybe InternalJSX | r }
subheader = unsafeCoerce

title :: ∀ r. { title :: Maybe JSX | r } -> { title :: Maybe InternalJSX | r }
title = unsafeCoerce


cardHeader :: { | CardHeaderProps } -> JSX
cardHeader props = do
  element _CardHeader (unsafeCoerce $ write $ convert props)
  where
    convert = action <<< avatar <<< subheader <<< title <<< toInternalChildren

foreign import _CardHeader :: ∀ a. ReactComponent a