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

        , prismScript_ "prism"
        , prismScript_ "components/prism-bash"
        , prismScript_ "components/prism-elixir"
        , prismScript_ "components/prism-haskell"
        , prismScript_ "components/prism-javascript"
        , prismScript_ "components/prism-json"
        , prismScript_ "components/prism-markdown"
        , prismScript_ "components/prism-yaml"
        ]
