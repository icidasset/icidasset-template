module Views.Icon exposing (view)

import Html exposing (Html, node, span)
import Html.Attributes exposing (attribute, class)
import Model.Types exposing (Model, Msg)
import Svg exposing (svg, use)


view : Model -> String -> Html Msg
view model name =
    let
        path =
            model.pathToRoot ++ "images/icons.svg"
    in
        span
            [ class ("icon icon--" ++ name) ]
            [ node
                "svg"
                [ class "icon__cnt" ]
                [ use
                    [ attribute "xlink:href" (path ++ "#" ++ name) ]
                    []
                ]
            ]
