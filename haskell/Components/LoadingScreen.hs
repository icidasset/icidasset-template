module Components.LoadingScreen where

import Lucid.Base (makeAttribute, makeElement, with)
import Template


template :: Partial
template =
    \_ ->
        div_
            [ class_ "loading-screen roughly-centered" ] ↩
            [ svg_
                [ class_ "spinner"
                , height_ "29px"
                , makeAttribute "viewBox" "0 0 30 30"
                , width_ "29px"
                ] ↩
                [ with (makeElement "circle")
                    [ class_ "spinner__path"
                    , makeAttribute "cx" "15"
                    , makeAttribute "cy" "15"
                    , makeAttribute "fill" "none"
                    , makeAttribute "r" "14"
                    , makeAttribute "stroke-linecap" "round"
                    , makeAttribute "stroke-width" "2"
                    ] ↩
                    []
                ]
            ]
