module Html.Custom where

import CMark (commonmarkToHtml, optSmart)
import Data.Text (Text)
import Flow
import Html
import Html.Attributes (cls, href, src)
import Protolude
import Shikensu.Utilities ((!~>))

import qualified Data.Text as Text
import qualified Shikensu (Metadata)


-- NODES


highlightScript :: Text -> Html
highlightScript name =
    let
        prefix = "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.10/" :: Text

        suffix = ".min.js" :: Text
    in
        script
            [ src (Text.concat [ prefix, name, suffix ]) ]
            []


markdown :: Text -> Html
markdown text =
    text
        |> commonmarkToHtml [ optSmart ]
        |> unencoded


markdownWithoutBlocks :: Text -> Html
markdownWithoutBlocks text =
    text
        |> commonmarkToHtml [ optSmart ]
        |> Text.replace "<p>" ""
        |> Text.replace "</p>" ""
        |> unencoded


relativeScript :: Text -> Text -> Html
relativeScript pathPrefix path =
    script
        [ src $ Text.append pathPrefix path ]
        []



-- ATTRIBUTES


hrefRelative :: Shikensu.Metadata -> Text -> Attribute
hrefRelative obj suffix =
    suffix
        |> Text.append (obj !~> "pathToRoot" :: Text)
        |> href


hrefRelativeDir :: Shikensu.Metadata -> Shikensu.Metadata -> Attribute
hrefRelativeDir parent obj =
    "/"
        |> Text.append (obj !~> "dirname" :: Text)
        |> hrefRelative parent
