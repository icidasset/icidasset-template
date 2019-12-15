module Views.MessageScreen exposing (view)

import Chunky exposing (..)
import Html exposing (Html, text)


view : String -> Html msg
view message =
    chunk
        [ "almost-fullscreen"
        , "flex"
        , "italic"
        , "items-center"
        , "justify-center"
        ]
        [ text message ]
