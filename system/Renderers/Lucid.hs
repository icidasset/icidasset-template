module Renderers.Lucid where

import Data.ByteString (ByteString)
import Data.Maybe as Maybe (fromJust, fromMaybe)
import Data.Text.Encoding (decodeUtf8, encodeUtf8)
import Flow
import Shikensu.Types
import Types

import qualified Data.ByteString as BS (empty)
import qualified Data.ByteString.Lazy as BS.Lazy (toStrict)
import qualified Data.HashMap.Strict as HashMap (lookup)
import qualified Lucid.Base as Lucid (renderBS, toHtml, toHtmlRaw)



-- FUNCTIONS


catalogRenderer :: TemplateCatalog -> Definition -> Maybe ByteString
catalogRenderer catalog def =
  let
    template = HashMap.lookup (basename def) catalog
  in
    case template of
      Just t -> renderer t def
      Nothing -> Just BS.empty


renderer :: Template -> Definition -> Maybe ByteString
renderer template def =
  content def
    |> fromMaybe BS.empty
    |> Lucid.toHtmlRaw
    |> template (metadata def)
    |> Lucid.renderBS
    |> BS.Lazy.toStrict
    |> Just
