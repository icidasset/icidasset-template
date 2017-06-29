module Renderers.Markdown where

import CMark (commonmarkToHtml, optSmart)
import Data.ByteString (ByteString)
import Data.Text.Encoding (decodeUtf8, encodeUtf8)
import Flow
import Shikensu (Definition(..))


-- FUNCTIONS


renderer :: Definition -> Maybe ByteString
renderer def = fmap markdown (content def)


markdown :: ByteString -> ByteString
markdown = decodeUtf8 .> commonmarkToHtml [optSmart] .> encodeUtf8
