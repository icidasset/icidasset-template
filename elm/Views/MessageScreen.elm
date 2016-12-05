module Views.MessageScreen exposing (view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Model.Types exposing (Model)


view : String -> Html msg
view message =
    div
        [ class "message-screen roughly-centered" ]
        [ div
            [ class "message-screen__message" ]
            [ text message ]
        ]
