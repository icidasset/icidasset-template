module Views.AuthScreen exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, onInput, onSubmit)
import Json.Decode
import Model.Types exposing (Model, Msg)


view : (String -> Msg) -> Msg -> Html Msg
view inputMsg submitMsg =
    div
        [ class "auth-screen roughly-centered" ]
        [ Html.form
            [ class "with-min-width", onSubmit submitMsg ]
            (formNodes inputMsg)
        ]



-- Children


formNodes : (String -> Msg) -> List (Html Msg)
formNodes inputMsg =
    [ p
        []
        [ label
            [ for "email" ]
            [ text "Email" ]
        , input
            [ name "email"
            , placeholder "example@gmail.com"
            , type_ "email"
            , onInput inputMsg
            , on "change" (Json.Decode.map inputMsg Html.Events.targetValue)
            ]
            []
        ]
    , p
        [ style [ ( "text-align", "right" ) ] ]
        [ button
            [ type_ "submit", style [ ( "display", "block" ), ( "width", "100%" ) ] ]
            [ text "Sign in" ]
        ]
    ]