module Components.Icon where

import Data.Monoid ((<>))
import Elements
import Lucid.Base (Html, makeAttribute)
import Lucid.Html5
import Types

import qualified Data.Text as Text (append, intercalate)


template :: Template
template obj _ =
  let
    name = "TODO"
    path = "TODO"
  in
    span_
      [ class_ (Text.append "icon icon--" name) ]
      ( svg_
          [ class_ "icon__cnt" ]
          ( use_ [ makeAttribute "xlink:href" (Text.intercalate "#" [path, name]) ] )
      )
