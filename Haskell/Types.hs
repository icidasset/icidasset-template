module Types where

import qualified Data.Aeson.KeyMap as KeyMap
import Html (Attribute, Html)
import Protolude (Char)
import Shikensu (Metadata)


-- 🌳


type Partial = Metadata -> Html


type Template = Metadata -> Html -> Html


type TemplateCatalog = KeyMap.KeyMap Template
