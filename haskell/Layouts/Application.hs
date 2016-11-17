module Templates.Layouts.Application where

import Components
import Elements
import Lucid.Base (Html)
import Lucid.Html5


template :: Template
template obj children =
  [ doctype_
  , html_
      []
      [
        head
          []
          [ meta_ [ charset_ "utf-8" ]
          , meta_ [ httpEquiv_ "Content-Type" content_ "text/html; charset=utf-8" ]
          , meta_ [ httpEquiv_ "X-UA-Compatible" content_ "IE=edge" ]
          , meta_ [ name_ "viewport", content_ "width=device-width, initial-scale=1" ]

          , title_ [] [ "TODO" ]

          , link_
              [ rel_ "stylesheet"
              , href_ "TODO"
              ]

          , link_
              [ rel_ "stylesheet"
              , href_ "https://fonts.googleapis.com/css?family=" ++
                      "Playfair+Display|Montserrat:400,700|Lora:400,700,400italic,700italic"
              ]

          , faviconsTemplate obj []
          ]

      , body
          [ class_ "TODO - Specify collection" ]
          [ Components.Header.template

          , children
          ]
      ]
  ]


faviconsTemplate :: Template
faviconsTemplate obj =
  []


{-| TODO

<link rel="apple-touch-icon" sizes="57x57" href="{{pathToRoot}}images/favicons/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="{{pathToRoot}}images/favicons/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="{{pathToRoot}}images/favicons/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="{{pathToRoot}}images/favicons/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="{{pathToRoot}}images/favicons/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="{{pathToRoot}}images/favicons/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="{{pathToRoot}}images/favicons/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="{{pathToRoot}}images/favicons/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="{{pathToRoot}}images/favicons/apple-touch-icon-180x180.png">
<link rel="icon" type="image/png" href="{{pathToRoot}}images/favicons/favicon-32x32.png" sizes="32x32">
<link rel="icon" type="image/png" href="{{pathToRoot}}images/favicons/favicon-194x194.png" sizes="194x194">
<link rel="icon" type="image/png" href="{{pathToRoot}}images/favicons/favicon-96x96.png" sizes="96x96">
<link rel="icon" type="image/png" href="{{pathToRoot}}images/favicons/android-chrome-192x192.png" sizes="192x192">
<link rel="icon" type="image/png" href="{{pathToRoot}}images/favicons/favicon-16x16.png" sizes="16x16">
<link rel="manifest" href="{{pathToRoot}}images/favicons/manifest.json">
<link rel="shortcut icon" href="{{pathToRoot}}images/favicons/favicon.ico">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="{{pathToRoot}}images/favicons/mstile-144x144.png">
<meta name="msapplication-config" content="{{pathToRoot}}images/favicons/browserconfig.xml">
<meta name="theme-color" content="#ffffff">

-}
