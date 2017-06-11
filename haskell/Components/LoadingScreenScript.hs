module Components.LoadingScreenScript where

import Template

import qualified Components.LoadingScreen
import qualified Data.Text as Text (append, concat)
import qualified Data.Text.Lazy as LazyText (toStrict)
import qualified Lucid (renderText)


{-| Replaces the contents of the node (selected by `selector`)
with a `LoadingScreen`.
-}
template :: Text -> Partial
template selector =
    \obj ->
        script_
            []
            ( Text.concat
                [ "document.querySelector('"
                , selector
                , "').innerHTML = '"
                , obj
                    |> Components.LoadingScreen.template
                    |> Lucid.renderText
                    |> LazyText.toStrict
                , "';"
                ]
            )
