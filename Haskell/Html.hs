module Html where

import Data.Text (Text)
import Protolude

import qualified Data.List as List (head, null)
import qualified Data.Text as Text (unpack)
import qualified Lucid


-- 🌳


type Attribute = Lucid.Attribute


type Html = Lucid.Html ()



-- GENERIC


nothing :: Html
nothing =
    ""


raw :: Text -> Html
raw =
    Lucid.toHtmlRaw


text :: Text -> Html
text =
    Lucid.toHtml


node :: Text -> [Attribute] -> [Html] -> Html
node tagName attributes children =
    Lucid.termWith tagName attributes (mconcat children)



-- SPECIFIC


a = node "a"
article = node "article"
body = node "body"
circle = node "circle"
div = node "div"
em = node "em"
h1 = node "h1"
h2 = node "h2"
h3 = node "h3"
h4 = node "h4"
h5 = node "h5"
h6 = node "h6"
head = node "head"
header = node "header"
html = node "html"
li = node "li"
link = node "link"
meta = node "meta"
ol = node "ol"
p = node "p"
small = node "small"
span = node "span"
title = node "title"
ul = node "ul"
use = node "use"


br :: [Attribute] -> [Html] -> Html
br attributes _ = Lucid.br_ attributes


script :: [Attribute] -> [Html] -> Html
script x y = Lucid.script_ x (if not (List.null y) then List.head y else "")


svg :: [Attribute] -> [Html] -> Html
svg attributes children = Lucid.svg_ attributes (mconcat children)



-- SPECIAL


doctype :: Html
doctype = Lucid.doctype_
