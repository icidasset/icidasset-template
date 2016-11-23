{-| Attribute functions you can use in the templates.

-}
module Attributes where

import Data.Text (Text)
import Lucid.Base (Attribute)
import Lucid.Html5 (href_)
import Shikensu.Types (Metadata)
import Types
import Utilities ((?), (??))

import qualified Data.Text as Text (append, pack)


relativeHref_ :: Metadata -> String -> Attribute
relativeHref_ obj suffix =
  let
    pathToRoot = obj ?? "pathToRoot" :: Text
    suffix_ = Text.pack suffix
  in
    href_ (Text.append pathToRoot suffix_)
