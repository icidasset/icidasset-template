module Types where

import Data.HashMap.Strict (HashMap)
import Html (Attribute, Html)
import Protolude (Char)
import Shikensu (Metadata)


-- 🌳


type Partial = Metadata -> Html


type Template = Metadata -> Html -> Html


type TemplateCatalog = HashMap [Char] Template
