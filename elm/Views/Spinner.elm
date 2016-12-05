module Views.Spinner exposing (view)

import Svg exposing (Svg, circle, svg)
import Svg.Attributes exposing (..)


view : Svg msg
view =
    svg
        [ class "spinner"
        , height "29px"
        , viewBox "0 0 30 30"
        , width "29px"
        ]
        [ circle
            [ class "spinner__path"
            , cx "15"
            , cy "15"
            , fill "none"
            , r "14"
            , strokeLinecap "round"
            , strokeWidth "2"
            ]
            []
        ]
