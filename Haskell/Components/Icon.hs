module Components.Icon where

import Data.Text (Text)
import Html
import Html.Attributes
import Protolude hiding (span)
import Shikensu.Utilities
import qualified List.Ext as List
import qualified Data.Text as Text (append, intercalate, pack)
import qualified Shikensu (Metadata)
import Flow

-- 🔱


template :: Text -> Shikensu.Metadata -> Html
template name obj =
    let
        pathToRoot  = obj !~> "pathToRoot"
        path        = Text.append pathToRoot "images/icons.svg"
    in
    svg
        [ cls "fill-current"
        , style "height: 1em; width: 1em;"
        ]
        [ [ path, name ]
            |> Text.intercalate "#"
            |> Html.Attributes.attr "xlink:href"
            |> List.singleton
            |> (flip use) []
        ]
