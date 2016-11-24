module Types where

import Data.HashMap.Strict (HashMap)
import Lucid.Base (Attribute, Html)
import Shikensu.Types (Metadata)


type Element = [Attribute] -> Html () -> Html ()
type EmptyElement = [Attribute] -> Html ()

type Partial = Metadata -> Html ()
type Template = Metadata -> Html () -> Html ()
type TemplateCatalog = HashMap String Template
