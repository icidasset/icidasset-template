module Renderers.Lucid where

import Data.ByteString (ByteString)
import Flow
import Protolude
import Shikensu (Definition(..))
import Types

import qualified Data.ByteString as BS (empty)
import qualified Data.ByteString.Lazy as BS.Lazy (toStrict)
import qualified Data.HashMap.Strict as HashMap (lookup)
import qualified Lucid.Base as Lucid (renderBS, toHtmlRaw)


-- 🔱


catalogRenderer :: TemplateCatalog -> Definition -> Maybe ByteString
catalogRenderer catalog def =
    let
        name =
            if not (null $ dirname def) then
                dirname def
            else
                basename def

        template = HashMap.lookup name catalog
    in
        case template of
            Just t -> renderer t def
            Nothing -> Just BS.empty


renderer :: Template -> Definition -> Maybe ByteString
renderer template def =
    (Lucid.toHtmlRaw .> template (metadata def) .> Lucid.renderBS .> BS.Lazy.toStrict .> Just)
    (maybe BS.empty identity $ content def)
