{-| Template.

Combines all the necessary dependencies to write a Lucid template.

-}
module Template
  ( module Aeson
  , module Attributes
  , module Elements
  , module Flow
  , module Lucid.Base
  , module Lucid.Html5
  , module Text
  , module Types
  , module Utilities
  ) where

import Attributes
import Data.Aeson as Aeson (Object, Value)
import Data.Text as Text (Text)
import Elements
import Flow
import Lucid.Base (Attribute, Html, makeAttribute, toHtml)
import Lucid.Html5
import Types
import Utilities ((↩), (⚡), (⚡⚡))
