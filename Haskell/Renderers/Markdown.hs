module Renderers.Markdown where

import CMark (commonmarkToHtml, optSmart, optUnsafe)
import Data.ByteString (ByteString)
import Data.Text.Encoding (decodeUtf8, encodeUtf8)
import Flow
import Protolude
import Shikensu (Definition(..))


-- 🔱


renderer :: Definition -> Maybe ByteString
renderer def = map markdown (content def)


markdown :: ByteString -> ByteString
markdown = decodeUtf8 .> commonmarkToHtml [optSmart, optUnsafe] .> encodeUtf8
