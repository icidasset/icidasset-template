module Views.LoadingScreen exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Views.Spinner


view : Html msg
view =
    div
        [ class "loading-screen roughly-centered" ]
        [ Views.Spinner.view ]
