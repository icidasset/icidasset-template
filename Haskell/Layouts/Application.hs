module Layouts.Application where

import Data.Monoid ((<>))
import Data.Text (Text)
import Flow
import Html
import Html.Attributes hiding (title)
import Html.Custom
import Protolude hiding (div, head, link)
import Shikensu.Utilities

import qualified Components.Header
import qualified Data.Text as Text (append, empty, replace, toLower)
import qualified Shikensu (Metadata)


-- 🔱


template :: Html -> Shikensu.Metadata -> Html -> Html
template additionalHeadNodes obj child =
    [ doctype
    , html
        []
        [ -- <head>
          --
          head
            []
            [ headNodes obj, additionalHeadNodes ]

        -- <body>
        --
        , body
            []
            [ Components.Header.template obj
            , child
            ]

        ]
    ]
    |> mconcat



-- <Head>


headNodes :: Shikensu.Metadata -> Html
headNodes obj = mconcat
    [ meta [ charset "utf-8" ] []
    , meta [ httpEquiv "Content-Type", content "text/html; charset=utf-8" ] []
    , meta [ httpEquiv "X-UA-Compatible", content "IE=edge" ] []
    , meta [ name "viewport", content "width=device-width, initial-scale=1" ] []

    , title
        []
        [ Text.append
                ( case obj ~> "title" of
                    Just x -> Text.append x " – "
                    Nothing -> ""
                )
                "I.A."

            |> text
        ]

    , link
        [ rel "stylesheet"
        , hrefRelative obj "stylesheet.css"
        ]
        []

    , link
        [ rel "stylesheet"
        , href $
            "https://fonts.googleapis.com/css?family=" <>
            "Playfair+Display:400,700|Nunito+Sans:400,600,700,400italic,700italic"
        ]
        []

    , link
        [ rel "stylesheet"
        , href "//cdn.jsdelivr.net/npm/hack-font@3.3.0/build/web/hack-subset.css"
        ]
        []

    , favicons obj
    ]



-- Favicons


favicons :: Shikensu.Metadata -> Html
favicons obj = mconcat
    [ link
        [ rel "apple-touch-icon"
        , sizes "57x57"
        , hrefRelative obj "images/favicons/apple-touch-icon-57x57.png"
        ]
        []

    , link
        [ rel "apple-touch-icon"
        , sizes "60x60"
        , hrefRelative obj "images/favicons/apple-touch-icon-60x60.png"
        ]
        []

    , link
        [ rel "apple-touch-icon"
        , sizes "72x72"
        , hrefRelative obj "images/favicons/apple-touch-icon-72x72.png"
        ]
        []

    , link
        [ rel "apple-touch-icon"
        , sizes "76x76"
        , hrefRelative obj "images/favicons/apple-touch-icon-76x76.png"
        ]
        []

    , link
        [ rel "apple-touch-icon"
        , sizes "114x114"
        , hrefRelative obj "images/favicons/apple-touch-icon-114x114.png"
        ]
        []

    , link
        [ rel "apple-touch-icon"
        , sizes "120x120"
        , hrefRelative obj "images/favicons/apple-touch-icon-120x120.png"
        ]
        []

    , link
        [ rel "apple-touch-icon"
        , sizes "144x144"
        , hrefRelative obj "images/favicons/apple-touch-icon-144x144.png"
        ]
        []

    , link
        [ rel "apple-touch-icon"
        , sizes "152x152"
        , hrefRelative obj "images/favicons/apple-touch-icon-152x152.png"
        ]
        []

    , link
        [ rel "apple-touch-icon"
        , sizes "180x180"
        , hrefRelative obj "images/favicons/apple-touch-icon-180x180.png"
        ]
        []

    -- Generic
    , link
        [ rel "icon"
        , sizes "16x16"
        , typ "image/png"
        , hrefRelative obj "images/favicons/favicon-16x16.png"
        ]
        []

    , link
        [ rel "icon"
        , sizes "32x32"
        , typ "image/png"
        , hrefRelative obj "images/favicons/favicon-32x32.png"
        ]
        []

    , link
        [ rel "icon"
        , sizes "96x96"
        , typ "image/png"
        , hrefRelative obj "images/favicons/favicon-96x96.png"
        ]
        []

    , link
        [ rel "icon"
        , sizes "194x194"
        , typ "image/png"
        , hrefRelative obj "images/favicons/favicon-194x194.png"
        ]
        []

    -- Android
    , link
        [ rel "icon"
        , sizes "192x192"
        , typ "image/png"
        , hrefRelative obj "images/favicons/android-chrome-192x192.png"
        ]
        []

    -- Manifest
    , link
        [ rel "manifest"
        , hrefRelative obj "images/favicons/manifest.json"
        ]
        []

    -- Ico format
    , link
        [ rel "shortcut icon"
        , hrefRelative obj "images/favicons/favicon.ico"
        ]
        []

    -- Meta
    , meta
        [ name "msapplication-TileColor"
        , content "#ffffff"
        ]
        []

    , meta
        [ name "msapplication-TileImage"
        , content "{{pathToRoot}}images/favicons/mstile-144x144.png"
        ]
        []

    , meta
        [ name "msapplication-config"
        , content "{{pathToRoot}}images/favicons/browserconfig.xml"
        ]
        []

    , meta
        [ name "theme-color"
        , content "#ffffff"
        ]
        []

    ]
