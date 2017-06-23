module Types where

import Data.HashMap.Strict (HashMap)
import Html (Attribute, Html)
import Shikensu (Metadata)


-- Aliases


type Partial = Metadata -> Html
type Template = Metadata -> Html -> Html
type TemplateCatalog = HashMap String Template
