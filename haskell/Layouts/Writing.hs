module Layouts.Writing where

import Data.Text (Text)
import Html
import Html.Custom
import Prelude hiding (div)
import Shikensu.Utilities

import qualified Shikensu (Metadata)


template :: Shikensu.Metadata -> Html -> Html
template obj child =
    container
        []
        [ article
            []
            [ h1
                []
                [ text $ obj !~> "title" ]

            , child
            ]

        , highlightScript "highlight"
        , highlightScript "languages/elixir"
        , highlightScript "languages/elm"
        , highlightScript "languages/haskell"
        , highlightScript "languages/javascript"
        , highlightScript "languages/json"
        , highlightScript "languages/markdown"
        , highlightScript "languages/shell"
        , highlightScript "languages/yaml"

        , script
            []
            [ raw "hljs.initHighlightingOnLoad();" ]
        ]
