module Components.Icon where

import Data.Monoid ((<>))
import Elements
import Lucid.Base (Html)
import Lucid.Html5
import Types


template :: Template
template obj _ =
  let
    path = "TODO"
  in
    span_
      [ class_ "icon icon--" ++ name ]
      ( svg_
          [ class_ "icon__cnt" ]
          ( use_ [ makeAttribute "xlink:href" (path ++ "#" ++ name) ] )
      )
