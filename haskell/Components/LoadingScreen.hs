module Components.LoadingScreen where

import Html
import Html.Attributes
import Prelude hiding (div)

import qualified Shikensu (Metadata)


-- 🍯


template :: Shikensu.Metadata -> Html
template _ =
    div
        [ cls "loading-screen roughly-centered" ]
        [ svg
            [ cls "spinner"
            , height "29px"
            , viewbox "0 0 30 30"
            , width "29px"
            ]
            [ circle
                [ cls "spinner__path"
                , attr "cx" "15"
                , attr "cy" "15"
                , attr "fill" "none"
                , attr "r" "14"
                , attr "stroke-linecap" "round"
                , attr "stroke-width" "2"
                ]
                []
            ]
        ]
