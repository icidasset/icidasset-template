module Layouts.Writing where

import Data.Monoid ((<>))
import Components
import Elements
import Lucid.Base (Html)
import Lucid.Html5
import Types


template :: Template
template obj children =
  _container
    []
    ( article_
        []
        ( h1_
            []
            ( "TODO - Title of writing" )

        <> children
        )
    )
