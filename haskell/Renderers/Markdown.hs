module Renderers.Markdown where

import CMark (commonmarkToHtml)
import Data.ByteString (ByteString)
import Data.Text.Encoding (decodeUtf8, encodeUtf8)
import Shikensu.Types (Definition, content)


-- FUNCTIONS


renderer :: Definition -> Maybe ByteString
renderer def = fmap (encodeUtf8 . commonmarkToHtml [] . decodeUtf8) (content def)
