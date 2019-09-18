module Components.LoadingScreenScript where

import Data.Text (Text)
import Flow
import Html
import Protolude

import qualified Components.LoadingScreen
import qualified Data.Text as Text (append, concat)
import qualified Data.Text.Lazy as LazyText (toStrict)
import qualified Lucid (renderText)
import qualified Shikensu (Metadata)


-- 🔱


{-| Replaces the contents of the node (selected by `selector`)
with a `LoadingScreen`.
-}
template :: Text -> Shikensu.Metadata -> Html
template selector obj =
    script
        []
        [ [ "document.querySelector('"
          , selector
          , "').innerHTML = '"
          , obj
                |> Components.LoadingScreen.template
                |> Lucid.renderText
                |> LazyText.toStrict
          , "';"
          ]
            |> Text.concat
            |> raw
        ]
