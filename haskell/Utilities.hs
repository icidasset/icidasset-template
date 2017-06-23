module Utilities
    ( (?~>)
    ) where

import Data.Aeson (FromJSON, ToJSON)
import Data.Text (Text)
import Shikensu (Metadata)
import Shikensu.Utilities ((~>))


-- Pure


(?~>) :: (FromJSON a, ToJSON a) => Maybe Metadata -> Text -> Maybe a
(?~>) m k = m >>= (~> k)
