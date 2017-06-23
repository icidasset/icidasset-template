module Html.Custom where

import CMark (commonmarkToHtml, optSmart)
import Data.Text (Text)
import Flow
import Html
import Html.Attributes (cls, href, src)
import Shikensu.Utilities ((!~>))

import qualified Data.Text as Text
import qualified Shikensu (Metadata)


-- Tags


block = nodeWithClass "div" "block"
blockList = nodeWithClass "div" "block__list"
blockText = nodeWithClass "div" "block__text"
blockTitleLvl1 = nodeWithClass "h1" "block__title"
blockTitleLvl2 = nodeWithClass "h2" "block__title"
blocks = nodeWithClass "div" "blocks"
blocksRow = nodeWithClass "div" "blocks__row"
container = nodeWithClass "div" "container"


highlightScript :: Text -> Html
highlightScript name =
    let
        prefix = "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/" :: Text
        suffix = ".min.js" :: Text
    in
        script
            [ src (Text.concat [ prefix, name, suffix ]) ]
            []


markdown :: Text -> Html
markdown text =
    text
        |> commonmarkToHtml [ optSmart ]
        |> raw


markdownWithoutBlocks :: Text -> Html
markdownWithoutBlocks text =
    text
        |> commonmarkToHtml [ optSmart ]
        |> Text.replace "<p>" ""
        |> Text.replace "</p>" ""
        |> raw


relativeScript :: Text -> Text -> Html
relativeScript pathPrefix path =
    script
        [ src $ Text.append pathPrefix path ]
        []



-- Attributes


hrefRelative :: Shikensu.Metadata -> Text -> Attribute
hrefRelative obj suffix =
    suffix
        |> Text.append (obj !~> "pathToRoot" :: Text)
        |> href


hrefRelativeDir :: Shikensu.Metadata -> Attribute
hrefRelativeDir obj =
    "/"
        |> Text.append (obj !~> "dirname" :: Text)
        |> hrefRelative obj



-- ⚗️


nodeWithClass :: Text -> Text -> [Attribute] -> [Html] -> Html
nodeWithClass tagName rawklass attributes =
    let
        klass =
            Text.concat [ " ", rawklass, " " ]
    in
        node tagName (cls klass : attributes)
