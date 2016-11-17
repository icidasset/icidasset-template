module Types where

import Data.HashMap.Strict (HashMap)
import Lucid.Base (Html, HtmlT)
import Shikensu.Types (Metadata)


type Template = Metadata -> Html () -> Html ()
type TemplateCatalog = HashMap String Template
