module Templates.Layouts.Writing where

import Components
import Elements
import Lucid.Base (Html)
import Lucid.Html5


template :: Template
template obj children =
  [ _container
      []
      [ article_
          []
          [ h1_
              []
              [ "TODO - Title of writing" ]

          , children
          ]
      ]
  ]
