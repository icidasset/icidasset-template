module Components.Header where

import Attributes
import Data.Monoid ((<>))
import Elements
import Lucid.Base (Html)
import Lucid.Html5
import Types


template :: Template
template obj _ =
  header_
    [ class_ "header" ]
    ( container_
        []
        ( div_
            [ class_ "header__col header__col--left" ]
            ( a_
                [ relativeHref_ obj "", class_ "header__logo" ]
                ( "I.A." )
            )

        <> div_
            [ class_ "header__col header__col--right" ]
            ( span_
                []
                ( "Steven Vandevelde" )
            )
        )
    )
