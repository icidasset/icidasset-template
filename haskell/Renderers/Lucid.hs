module Renderers.Lucid where

import Data.ByteString (ByteString)
import Data.Maybe as Maybe (fromJust)
import Data.Text.Encoding (decodeUtf8, encodeUtf8)
import Shikensu.Types

import qualified Data.HashMap.Strict as HashMap



-- FUNCTIONS


catalogRenderer :: TemplateCatalog -> Definition -> Maybe ByteString
catalogRenderer catalog def =
  let
    template = catalog
      |> HashMap.lookup (basename def)
      |> Maybe.fromJust
  in
    render (metadata def) template


renderer :: Metadata -> Template -> Maybe ByteString
renderer obj template =
  template obj
    |> Lucid.renderBS
    |> BS.Lazy.toStrict
    |> Just
