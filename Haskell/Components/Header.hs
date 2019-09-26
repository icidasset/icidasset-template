module Components.Header where

import Chunky
import Common
import Data.Text (Text)
import Flow
import Html hiding (title)
import Html.Attributes
import Html.Custom
import Protolude hiding (div, span)
import Shikensu.Utilities

import qualified Components.Icon
import qualified Data.Text as Text
import qualified Shikensu (Metadata)


-- 🔱


template :: Shikensu.Metadata -> Html
template obj =
    let
        workspace =
            case obj ~> "workingDirname" of
                Just x  -> x |> Text.replace "src/" "" |> Text.toLower
                Nothing -> Text.empty
    in
    slab
        Html.header
        []
        [ "border-b"
        , "border-gray-200"
        , "flex"
        , "items-center"
        , "leading-relaxed"
        , "mb-8"
        , "mx-auto"
        , "py-8"

        --
        , case workspace of
            "writings"  -> "max-w-2xl"
            _           -> "max-w-5xl"
        ]
        [ left obj, right ]



-- 👈


left :: Shikensu.Metadata -> Html
left obj =
    chunk
        [ "flex", "flex-1", "items-center" ]
        [ -- Logo
          --
          slab
            Html.a
            [ hrefRelative
                obj
                (if obj !~> "basename" /= "index" then "../" else "")
            ]
            [ "antialiased"
            , "font-serif"
            , "font-bold"
            , "tracking-widest"
            ]
            [ text "I.A." ]

        -- Category
        --
        , case obj ~> "category" of
            Just cat ->
                brick
                    [ style "padding: 0 6px" ]
                    [ "bg-black"
                    , "font-medium"
                    , "font-serif"
                    , "leading-loose"
                    , "ml-4"
                    , "mr-4"
                    , "px-1"
                    , "rounded"
                    , "text-white"
                    , "text-xs"
                    , "tracking-wide"
                    , "uppercase"
                    ]
                    [ text cat ]
            Nothing ->
                nothing

        -- Lightning bolt
        --
        , case obj !~> "parentPath" of
            Just x ->
                slab
                    Html.a
                    [ href x, title "Go up" ]
                    [ "ml-4", "mt-px", "text-lightning" ]
                    [ Components.Icon.template "i-flash" obj ]
            Nothing ->
                nothing
        ]



-- 👉


right :: Html
right =
    brick
        [ style "letter-spacing: 0.2em" ]
        [ "antialiased", "flex-1", "text-gray-600", "text-right", "text-xs", "uppercase" ]
        [ text "Steven Vandevelde" ]
