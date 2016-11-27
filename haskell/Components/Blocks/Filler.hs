module Components.Blocks.Filler where

import Elements
import Lucid.Base (Attribute, makeAttribute, toHtml)
import Lucid.Html5
import Types
import Utilities ((↩))

import qualified Components.Icon
import qualified Data.Text as Text (append, intercalate)


template :: [Attribute] -> String -> String -> Partial
template attributes icon label =
  \obj ->
    a_
      ([ class_ " block block--filler " ] ++ attributes)
      ( span_
          [ class_ "block--filler__inner" ] ↩
          [ Components.Icon.template icon obj
          , span_ (toHtml label)
          ]
      )
