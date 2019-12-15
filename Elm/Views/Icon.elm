module Views.Icon exposing (view)

import Html exposing (Html)
import Html.Attributes exposing (style)
import Json.Encode as Json
import Svg exposing (svg, use)
import Svg.Attributes exposing (class, xlinkHref)


view : String -> String -> Html msg
view name pathToRoot =
    let
        path =
            pathToRoot ++ "images/icons.svg"

        xh =
            path ++ "#" ++ name
    in
    svg
        [ class "fill-current"
        , style
            [ ( "height", "1em" )
            , ( "width", "1em" )
            ]
        ]
        [ use
            [ xlinkHref xh ]
            []
        ]
