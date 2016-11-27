module Views.AuthScreen exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, name, placeholder, style, type_)
import Model.Types exposing (Model)


view : Model -> Html msg
view model =
    div
        [ class "auth-screen roughly-centered" ]
        [ form
            []
            formNodes
        ]



-- Children


formNodes : List (Html msg)
formNodes =
    [ p
        []
        [ input
            [ name "email", placeholder "Email", type_ "email" ]
            []
        ]
    , p
        [ style [ ( "text-align", "right" ) ] ]
        [ button
            [ type_ "submit", style [ ( "display", "block" ), ( "width", "100%" ) ] ]
            [ text "Sign in" ]
        ]
    ]
