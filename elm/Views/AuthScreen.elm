module Views.AuthScreen exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model.Types exposing (Model)


view : Model -> Html msg
view model =
    div
        [ class "auth-screen roughly-centered" ]
        [ Html.form
            []
            formNodes
        ]



-- Children


formNodes : List (Html msg)
formNodes =
    [ p
        []
        [ label
            [ for "email" ]
            [ text "Email" ]
        , input
            [ name "email", placeholder "example@gmail.com", type_ "email" ]
            []
        ]
    , p
        [ style [ ( "text-align", "right" ) ] ]
        [ button
            [ type_ "submit", style [ ( "display", "block" ), ( "width", "100%" ) ] ]
            [ text "Sign in" ]
        ]
    ]
