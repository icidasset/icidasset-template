{-| Element functions you can use in the templates.

-}
module Elements where

import Lucid.Base
import Lucid.Html5


blocks_ :: Element
blocks_ attributes children =
  div_
    (attributes ++ [class_ "blocks"])
    (children)


blocksRow_ :: Element
blocksRow_ attributes children =
  div_
    (attributes ++ [class_ "blocks__row"])
    (children)


container_ :: Element
container_ attributes children =
  div_
    (attributes ++ [class_ "container"])
    (children)


use_ :: Html ()
use_ = makeElementNoEnd "use"
