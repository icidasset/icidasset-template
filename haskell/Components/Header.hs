module Templates.Header where

import Elements
import Lucid.Base (Html)
import Lucid.Html5


template :: Template
template obj _ =
  header_
    [ class_ "header" ]
    [ container_
        []
        [ div_
            [ class_ "header__col header__col--left" ]
            [ a_
                [ href_ "TODO" ]
                [ "I.A." ]
            ]

        , div_
            [ class_ "header__col header__col--right" ]
            [ span_
                []
                [ "Steven Vandevelde" ]
            ]
        ]
    ]
