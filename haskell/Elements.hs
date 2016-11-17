{-| Element functions you can use in the templates.

-}
module Elements where

import Lucid.Base
import Lucid.Html5
import Types


blocks_ :: Element a
blocks_ attributes =
  with
    (makeElement "div")
    ([ class_ "blocks" ] ++ attributes)


blocksRow_ :: Element a
blocksRow_ attributes =
  with
    (makeElement "div")
    ([ class_ "blocks__row" ] ++ attributes)


container_ :: Element a
container_ attributes =
  with
    (makeElement "div")
    ([ class_ "container" ] ++ attributes)


markdown_ :: Element a
markdown_ _ =
  (makeElement "div")


use_ :: Html ()
use_ = makeElementNoEnd "use"
