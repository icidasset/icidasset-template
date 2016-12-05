module Views.AuthScreen exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onSubmit)
import Model.Types exposing (Model, Msg)


view : (String -> Msg) -> Msg -> Html Msg
view inputMsg submitMsg =
    div
        [ class "auth-screen roughly-centered" ]
        [ Html.form
            [ onSubmit submitMsg ]
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
