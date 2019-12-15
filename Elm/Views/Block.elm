module Views.Block exposing (..)

import Chunky exposing (..)
import Html exposing (..)
import Html.Attributes
import Views.Icon



-- 🔱


node : List String -> List (Html msg) -> Html msg
node classes =
    chunk (classes ++ [ "md:flex-1", "mt-16", "md:mt-0", "md:mx-3" ])


row : List String -> List (Html msg) -> Html msg
row classes =
    chunk (classes ++ [ "md:flex", "mt-16", "md:-mx-3" ])


note : String -> Html msg
note n =
    chunk [ "italic", "mt-6", "text-xs" ] [ text n ]


title : List String -> List (Html msg) -> Html msg
title classes =
    chunk (classes ++ [ "font-bold", "font-serif", "mb-4", "text-xl" ])



-- 🖼


titleColorClasses : List String
titleColorClasses =
    [ "text-indigo-700"
    , "dark:text-indigo-400"
    ]



-- FILLER


type alias Filler =
    { hideOnSmallScreen : Bool
    , href : Maybe String
    , icon : String
    , label : String
    , pathToRoot : String
    }


filler : Filler -> Html msg
filler { hideOnSmallScreen, href, icon, label, pathToRoot } =
    let
        textColor =
            case href of
                Just _ ->
                    "text-indigo-500"

                Nothing ->
                    "text-indigo-300"

        darkTextColor =
            case href of
                Just _ ->
                    "dark:text-indigo-300"

                Nothing ->
                    "dark:text-indigo-300 dark:opacity-50"
    in
    slab
        Html.a
        (case href of
            Just h ->
                [ Html.Attributes.href h ]

            Nothing ->
                []
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
        , if hideOnSmallScreen then
            "hidden md:flex"

          else
            "flex"
        ]
        [ inline
            [ "text-4xl" ]
            [ Views.Icon.view icon pathToRoot ]
        , inline
            [ "block", "mt-2" ]
            [ text label ]
        ]
