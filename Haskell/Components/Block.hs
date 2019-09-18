module Components.Block where

import Chunky
import Data.Text (Text)
import Html
import Html.Attributes
import Html.Custom (nodeWithClass)
import Protolude hiding (Left, Right)

import qualified Components.Icon
import qualified Data.Maybe as Maybe
import qualified Data.Text as Text (append, intercalate)
import qualified Shikensu (Metadata)


-- 🔱


node :: [Text] -> [Html] -> Html
node classes =
    chunk (classes <> [ "md:flex-1", "mt-16", "md:mt-0", "md:mx-3" ])


row :: [Text] -> [Html] -> Html
row classes =
    chunk (classes <> [ "md:flex", "mt-16", "md:-mx-3" ])


note :: Text -> Html
note n =
    chunk [ "italic", "mt-6", "text-xs" ] [ text n ]


title :: [Text] -> [Html] -> Html
title classes =
    chunk (classes <> [ "font-bold", "font-serif", "mb-4", "text-xl" ])



-- FILLER


data Filler =
    Filler
        { hideOnSmallScreen :: Bool
        , href :: Maybe Text
        , icon :: Text
        , label :: Text
        , metadata :: Shikensu.Metadata
        }


filler :: Filler -> Html
filler (Filler hideOnSmallScreen maybeHref icon label metadata) =
    let
        opacity =
            if Maybe.isJust maybeHref then
                "opacity-100"
            else
                "opacity-50"
    in
    slab
        Html.a
        (
            case maybeHref of
                Just h      -> [ Html.Attributes.href h ]
                Nothing     -> []
        )
        [ "bg-gray-200"
        , "flex-col"
        , "font-semibold"
        , "items-center"
        , "justify-center"
        , "mb-4"
        , "py-8"
        , "rounded"
        , "text-center"
        , "text-gray-500"

        --
        , "md:flex-1"
        , "md:mb-0"
        , "md:mx-3"
        , "md:py-0"

        --
        , if hideOnSmallScreen then "hidden md:flex" else "flex"
        ]
        [ inline
            [ "text-4xl", opacity ]
            [ Components.Icon.template icon metadata ]
        , inline
            [ "block", "mt-2", opacity ]
            [ text label ]
        ]
