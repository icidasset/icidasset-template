module Layouts.Writing where

import Template
import qualified Data.Text as Text (concat)


template :: Template
template obj children =
  container_
    [] ↩
    [ article_
        [] ↩
        [ h1_
            [] ↩
            [ toHtml (obj ⚡⚡ "title" :: String) ]

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



-- Helpers


prismScript_ :: Text -> Html ()
prismScript_ name =
  let
    prefix = "https://cdnjs.cloudflare.com/ajax/libs/prism/1.5.1/" :: Text
    suffix = ".min.js" :: Text
  in
    script_
      [ src_ (Text.concat [ prefix, name, suffix ]) ]
      ( "" )
