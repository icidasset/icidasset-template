module Types where


import Data.HashMap.Strict (HashMap)


type alias Children = [Html ()]
type alias Element = [Attribute] -> Children -> Html ()
type alias Template = Metadata -> Children -> Html ()
type alias TemplateCatalog = HashMap String Template
