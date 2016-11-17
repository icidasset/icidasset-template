{-# LANGUAGE RankNTypes #-}
module Types where

import Data.HashMap.Strict (HashMap)
import Lucid.Base (Attribute, Html, HtmlT)
import Shikensu.Types (Metadata)


type Element a = forall m. Monad m => [Attribute] -> HtmlT m a -> HtmlT m a
type Template = Metadata -> Html () -> Html ()
type TemplateCatalog = HashMap String Template
