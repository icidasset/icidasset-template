module Renderers.Lucid where

import Data.ByteString (ByteString)
import Data.Maybe as Maybe (fromJust)
import Data.Text.Encoding (decodeUtf8, encodeUtf8)
import Flow
import Shikensu.Types
import Types

import qualified Data.ByteString.Lazy as BS.Lazy (toStrict)
import qualified Data.HashMap.Strict as HashMap (lookup)
import qualified Lucid.Base as Lucid (renderBS)



-- FUNCTIONS


catalogRenderer :: TemplateCatalog -> Definition -> Maybe ByteString
catalogRenderer catalog def =
  let
    template = catalog
      |> HashMap.lookup (basename def)
      |> Maybe.fromJust
  in
    renderer template def


renderer :: Template -> Definition -> Maybe ByteString
renderer template def =
  template (metadata def) ""
    |> Lucid.renderBS
    |> BS.Lazy.toStrict
    |> Just
