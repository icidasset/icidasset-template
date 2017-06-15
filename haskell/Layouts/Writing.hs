module Layouts.Writing where

import Template


template :: Template
template obj children =
    container_
        [] ↩
        [ article_
            [] ↩
            [ h1_
                [] ↩
                [ toHtml (obj !~> "title" :: String) ]

            , children
            ]

        , highlightScript_ "highlight"
        , highlightScript_ "languages/bash"
        , highlightScript_ "languages/elixir"
        , highlightScript_ "languages/haskell"
        , highlightScript_ "languages/javascript"
        , highlightScript_ "languages/json"
        , highlightScript_ "languages/markdown"
        , highlightScript_ "languages/yaml"
        ]
