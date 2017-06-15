{-# LANGUAGE FlexibleContexts #-}
module Utilities
    ( (<&>)
    , (?~>)
    , (↩)
    , highlightScript_
    , pathToRootForProxy
    ) where

import Data.Aeson (FromJSON, ToJSON)
import Data.Text (Text)
import Lucid.Base (Html)
import Lucid.Html5 (script_, src_)
import Shikensu.Types
import Shikensu.Utilities ((~>))

import qualified Data.Text as Text (concat)


-- Pure


infix 6 ↩


(↩) :: (Monoid b) => (b -> b) -> [b] -> b
(↩) h = h . mconcat


(<&>) :: Functor f => f a -> (a -> b) -> f b
(<&>) = flip fmap


(?~>) :: (FromJSON a, ToJSON a) => Maybe Metadata -> Text -> Maybe a
(?~>) m k = m >>= (~> k)


pathToRootForProxy :: Dictionary -> Dictionary
pathToRootForProxy =
    fmap $ \def ->
        if basename def == "200" then
            def { pathToRoot = "/" }
        else
            def


highlightScript_ :: Text -> Html ()
highlightScript_ name =
    let
        prefix = "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/" :: Text
        suffix = ".min.js" :: Text
    in
        script_
            [ src_ (Text.concat [ prefix, name, suffix ]) ]
            ""
