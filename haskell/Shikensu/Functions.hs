module Shikensu.Functions
    ( frontmatter
    , frontmatterDef
    , lowerCaseBasename
    , lowerCaseBasenameDef
    , pathToRootForProxy
    , permalinkPages
    ) where

import Data.ByteString (ByteString)
import Data.Frontmatter (IResult(..), parseFrontmatter)
import Data.Maybe (fromMaybe)
import Flow
import Shikensu (Definition(..), Dictionary(..), Metadata)
import Shikensu.Contrib (permalinkDef)

import qualified Data.HashMap.Strict as HashMap (empty, union)
import qualified Data.Text as Text (pack, toLower, unpack)
import qualified Data.Yaml as Yaml (decode)


-- Functions


frontmatter :: Dictionary -> Dictionary
frontmatter = fmap frontmatterDef


frontmatterDef :: Definition -> Definition
frontmatterDef def =
    let
        union         = flip HashMap.union (metadata def)
        (yaml, text)  = extractFrontmatter (content def)
    in
        def {
            content   = text,
            metadata  = maybe (metadata def) (union . frontmatterDecoder) yaml
        }


lowerCaseBasename :: Dictionary -> Dictionary
lowerCaseBasename = fmap lowerCaseBasenameDef


lowerCaseBasenameDef :: Definition -> Definition
lowerCaseBasenameDef def =
    def {
        basename = basename def
            |> Text.pack
            |> Text.toLower
            |> Text.unpack
    }


pathToRootForProxy :: Dictionary -> Dictionary
pathToRootForProxy =
    fmap $ \def ->
        if basename def == "200" then
            def { pathToRoot = "/" }
        else
            def


permalinkPages :: [String] -> Dictionary -> Dictionary
permalinkPages nonPermalinkedPages =
    fmap $ \def ->
        if basename def `elem` nonPermalinkedPages
            then def { pathToRoot = "/" }
            else permalinkDef "index" def



-- Helpers, Pt. 1
-- Frontmatter


extractFrontmatter :: Maybe ByteString -> (Maybe ByteString, Maybe ByteString)
extractFrontmatter maybeDoc =
    case maybeDoc of
        Just doc ->
            case parseFrontmatter doc of
                Done text yaml  -> (Just yaml, Just text)
                _               -> (Nothing, Just doc)

        Nothing ->
            (Nothing, Nothing)


frontmatterDecoder :: ByteString -> Metadata
frontmatterDecoder yaml =
    yaml
        |> Yaml.decode
        |> fromMaybe HashMap.empty
