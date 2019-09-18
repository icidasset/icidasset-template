module Common where

import Chunky (chunk)
import Data.Aeson (FromJSON, ToJSON)
import Data.Text (Text)
import Html (Html)
import Protolude
import Shikensu (Metadata)
import Shikensu.Utilities ((~>))


-- 🔱


(?~>) :: (FromJSON a, ToJSON a) => Maybe Metadata -> Text -> Maybe a
(?~>) m k = m >>= (~> k)


(<<=) :: Monad m => (a -> m b) -> m a -> m b
(<<=) =
    flip (>>=)



-- 🖼


accentColor :: Text
accentColor =
    "text-lightning"


container :: [Html] -> Html
container =
    chunk
        [ "max-w-5xl"
        , "mb-16"
        , "mx-auto"
        ]
