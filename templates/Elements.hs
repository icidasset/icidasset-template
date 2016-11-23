{-| Element functions you can use in the templates.

-}
module Elements where

import CMark (commonmarkToHtml, optSmart)
import Data.Text (Text)
import Flow
import Lucid.Base
import Lucid.Html5
import Types

import qualified Data.Text as Text (replace)


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


markdown_ :: Text -> Html ()
markdown_ = toHtmlRaw . commonmarkToHtml [optSmart]


markdownWithoutBlocks_ :: Text -> Html ()
markdownWithoutBlocks_ markdown =
  markdown
    |> commonmarkToHtml [optSmart]
    |> Text.replace "<p>" ""
    |> Text.replace "</p>" ""
    |> toHtmlRaw


use_ :: [Attribute] -> Html ()
use_ = with (makeElementNoEnd "use")
