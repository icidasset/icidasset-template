module Html.Attributes where

import Data.Text (Text)
import Html (Attribute)

import qualified Lucid
import qualified Lucid.Base


-- Generic bits


attr :: Text -> Text -> Attribute
attr =
    Lucid.Base.makeAttribute



-- Attributes


charset = Lucid.charset_
content = Lucid.content_
height = Lucid.height_
href = Lucid.href_
httpEquiv = Lucid.httpEquiv_
name = Lucid.name_
rel = Lucid.rel_
sizes = Lucid.sizes_
src = Lucid.src_
width = Lucid.width_

cls = Lucid.class_
class_ = Lucid.class_
typ = Lucid.type_
type_ = Lucid.type_

viewbox = attr "viewbox"

title :: Text -> Attribute
title = Lucid.title_
