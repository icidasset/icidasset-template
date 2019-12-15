module Html.Attributes where

import Data.Text (Text)
import Html (Attribute)
import Protolude

import qualified Lucid
import qualified Lucid.Base


-- GENERIC


attr :: Text -> Text -> Attribute
attr =
    Lucid.Base.makeAttribute



-- SPECIFIC


charset = Lucid.charset_
cls = Lucid.class_
class_ = Lucid.class_
className = Lucid.class_
content = Lucid.content_
height = Lucid.height_
href = Lucid.href_
httpEquiv = Lucid.httpEquiv_
id = Lucid.id_
name = Lucid.name_
rel = Lucid.rel_
sizes = Lucid.sizes_
src = Lucid.src_
typ = Lucid.type_
type_ = Lucid.type_
width = Lucid.width_
viewbox = attr "viewbox"


style :: Text -> Attribute
style = Lucid.style_


title :: Text -> Attribute
title = Lucid.title_
