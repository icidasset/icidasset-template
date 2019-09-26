module Common where

import Chunky (slab)
import Data.Aeson (FromJSON, ToJSON)
import Data.Text (Text)
import Html (Html, main)
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
    slab
        Html.main
        []
        [ "max-w-5xl"
        , "mb-16"
        , "mx-auto"
        ]
