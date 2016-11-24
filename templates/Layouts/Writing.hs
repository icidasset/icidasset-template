module Layouts.Writing where

import Data.Monoid ((<>))
import Elements
import Lucid.Base (Html)
import Lucid.Html5
import Types
import Utilities ((↩))


template :: Template
template obj children =
  container_
    [] ↩
    [ article_
        [] ↩
        [ h1_
            [] ↩
            [ "TODO - Title of writing" ]

        , children
        ]
    ]
