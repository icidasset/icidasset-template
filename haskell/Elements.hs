{-| Element functions you can use in the templates.

-}
module Elements where

import CMark (commonmarkToHtml, optSmart)
import Data.Text (Text)
import Flow
import Lucid.Base
import Lucid.Html5
import Types
import Utilities ((↩))

import qualified Data.Text as Text (empty, intercalate, pack, replace)


block_ = make "div" "block"
blockList_ = make "div" "block__list"
blockText_ = make "div" "block__text"
blockTitleLvl1_ = make "h1" "block__title"
blockTitleLvl2_ = make "h2" "block__title"
blocks_ = make "div" "blocks"
blocksRow_ = make "div" "blocks__row"
container_ = make "div" "container"



-- Custom


markdown_ :: Text -> Html ()
markdown_ = toHtmlRaw . commonmarkToHtml [optSmart]


markdownWithoutBlocks_ :: Text -> Html ()
markdownWithoutBlocks_ markdown =
  markdown
    |> commonmarkToHtml [optSmart]
    |> Text.replace "<p>" ""
    |> Text.replace "</p>" ""
    |> toHtmlRaw


use_ :: EmptyElement
use_ = with (makeElementNoEnd "use")



-- Helpers


make :: String -> String -> Element
make tagName className =
  let
    className_ = Text.intercalate
      " "
      [ Text.empty
      , Text.pack className
      , Text.empty
      ]
  in
    \attributes ->
      with
        (makeElement $ Text.pack tagName)
        ([ class_ $ className_ ] ++ attributes)
