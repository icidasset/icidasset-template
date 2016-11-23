{-# LANGUAGE RankNTypes #-}
{-| Element functions you can use in the templates.

-}
module Elements where

import CMark (commonmarkToHtml, optSmart)
import Data.Text (Text)
import Flow
import Lucid.Base
import Lucid.Html5
import Types

import qualified Data.Text as Text (empty, intercalate, pack, replace)


block_ :: Element a
block_ = make "div" "block"

blockText_ :: Element a
blockText_ = make "div" "block__text"

blockTitle_ :: Element a
blockTitle_ = make "h2" "block__title"

blocks_ :: Element a
blocks_ = make "div" "blocks"

blocksRow_ :: Element a
blocksRow_ = make "div" "blocks__row"

container_ :: Element a
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


use_ :: [Attribute] -> Html ()
use_ = with (makeElementNoEnd "use")



-- Helpers


make :: String -> String -> Element a
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
