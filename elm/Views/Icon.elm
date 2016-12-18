module Views.Icon exposing (view)

import Html exposing (Html, node, span)
import Html.Attributes exposing (class)
import Json.Encode as Json
import Model.Types exposing (Model, Msg)
import Svg exposing (svg, use)
import Svg.Attributes exposing (xlinkHref)


view : Model -> String -> Html Msg
view model name =
    let
        path =
            model.pathToRoot ++ "images/icons.svg"
    in
        span
            [ class ("icon icon--" ++ name) ]
            [ svg
                [ Svg.Attributes.class "icon__cnt" ]
                [ use
                    [ xlinkHref (path ++ "#" ++ name) ]
                    []
                ]
            ]
