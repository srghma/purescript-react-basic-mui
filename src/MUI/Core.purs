module MUI.Core where

import Foreign (unsafeToForeign)
import Simple.JSON (class WriteForeign)

type Color =
  { "50"  :: String
  , "100" :: String
  , "200" :: String
  , "300" :: String
  , "400" :: String
  , "500" :: String
  , "600" :: String
  , "700" :: String
  , "800" :: String
  , "900" :: String
  , "A100" :: String
  , "A200" :: String
  , "A400" :: String
  , "A700" :: String
}

foreign import data JSS :: Type

newtype StringToString = StringToString (String -> String)
newtype StringToNumber = StringToNumber (String -> Number)
newtype NumberToNumber = NumberToNumber (Number -> Number)
newtype JSSToJSS = JSSToJSS (JSS -> JSS)

instance writeForeignJSS :: WriteForeign JSS where writeImpl = unsafeToForeign
instance writeForeignJSSToJSS :: WriteForeign JSSToJSS where writeImpl = unsafeToForeign
instance writeForeignStringToString :: WriteForeign StringToString where writeImpl = unsafeToForeign
instance writeForeignStringToNumber :: WriteForeign StringToNumber where writeImpl = unsafeToForeign
instance writeForeignNumberToNumber :: WriteForeign NumberToNumber where writeImpl = unsafeToForeign