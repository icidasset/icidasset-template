module AuthScreen exposing (view)

import Html
import Html.Attributes


view : Html msg
view =
    div
        [ class "auth-screen" ]
        [ form
            []
            [ div
                []
                formNodes
            ]
        ]



-- Children


formNodes : List (Html msg)
formNodes =
    [ input
        [ type_ "text" ]
        []
    ]
