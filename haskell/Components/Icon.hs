module Components.Icon where

import Data.Text (Text)
import Html
import Html.Attributes
import Prelude hiding (span)
import Shikensu.Utilities

import qualified Data.Text as Text (append, intercalate, pack)
import qualified Shikensu (Metadata)


-- 🍯


template :: Text -> Shikensu.Metadata -> Html
template name obj =
    let
        pathToRoot  = obj !~> "pathToRoot"
        path        = Text.append pathToRoot "images/icons.svg"
    in
        span
            [ cls (Text.append "icon icon--" name) ]
            [ svg
                [ cls "icon__cnt" ]
                [ use
                    [ attr "xlink:href" $ Text.intercalate "#" [ path, name ] ]
                    []
                ]
            ]
