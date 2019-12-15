module Views.LoadingScreen exposing (view)

import Chunky exposing (..)
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Views.Spinner


view : Html msg
view =
    chunk
        [ "almost-fullscreen"
        , "flex"
        , "items-center"
        , "justify-center"
        ]
        [ Views.Spinner.view ]
