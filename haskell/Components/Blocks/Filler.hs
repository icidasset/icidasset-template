module Components.Blocks.Filler where

import Data.Text (Text)
import Html
import Html.Attributes
import Html.Custom (nodeWithClass)
import Prelude hiding (span)

import qualified Components.Icon
import qualified Data.Text as Text (append, intercalate)
import qualified Shikensu (Metadata)


-- 🍯


data Filler =
    Filler
        { icon :: Text
        , label :: Text
        , metadata :: Shikensu.Metadata
        }


template :: [Attribute] -> Filler -> Html
template attributes (Filler icon label obj) =
    nodeWithClass
        "a"
        "block block--filler"
        attributes
        [ span
            [ cls "block--filler__inner" ]
            [ Components.Icon.template icon obj
            , span [] [ text label ]
            ]
        ]
