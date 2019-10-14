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



-- 🖼


titleColorClasses :: [ Text ]
titleColorClasses =
     [ "text-indigo-700"
     , "dark:text-indigo-400"
     ]



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
        textColor =
            if Maybe.isJust maybeHref then
                "text-indigo-500"
            else
                "text-indigo-300"

        darkTextColor =
            if Maybe.isJust maybeHref then
                "dark:text-indigo-300"
            else
                "dark:text-indigo-300 dark:opacity-50"
    in
    slab
        Html.a
        (
            case maybeHref of
                Just h      -> [ Html.Attributes.href h ]
                Nothing     -> []
        )
        [ "bg-indigo-100"
        , "flex-col"
        , "font-semibold"
        , "items-center"
        , "justify-center"
        , "mb-4"
        , "py-8"
        , "rounded"
        , "text-center"
        , textColor

        --
        , "md:flex-1"
        , "md:mb-0"
        , "md:mx-3"
        , "md:py-0"

        --
        , "dark:bg-indigo-800"
        , darkTextColor

        --
        , if hideOnSmallScreen then "hidden md:flex" else "flex"
        ]
        [ inline
            [ "text-4xl" ]
            [ Components.Icon.template icon metadata ]
        , inline
            [ "block", "mt-2" ]
            [ text label ]
        ]
