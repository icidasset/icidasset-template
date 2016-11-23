module Layouts.Application where

import Components.Header
import Data.Aeson (fromJSON)
import Data.Monoid ((<>))
import Data.Text (Text)
import Elements
import Lucid.Base (Html)
import Lucid.Html5
import Types
import Utilities ((?))

import qualified Data.Text as Text (append)


template :: Template
template obj children =
  ( doctype_ <> html_
      []
      ( head_
          []
          (    meta_ [ charset_ "utf-8" ]
            <> meta_ [ httpEquiv_ "Content-Type", content_ "text/html; charset=utf-8" ]
            <> meta_ [ httpEquiv_ "X-UA-Compatible", content_ "IE=edge" ]
            <> meta_ [ name_ "viewport", content_ "width=device-width, initial-scale=1" ]

            <> title_ [] ( "TODO" )

            <> link_
                [ rel_ "stylesheet"
                , href_ "application.css" -- TODO
                ]

            <> link_
                [ rel_ "stylesheet"
                , href_ ( Text.append
                            "https://fonts.googleapis.com/css?family="
                            "Playfair+Display|Montserrat:400,700|Lora:400,700,400italic,700italic"
                        )
                ]

            <> faviconsTemplate obj ""
          )

      <> body_
          [ class_ "TODO - Specify collection" ]
          ( Components.Header.template obj "" <> children )
      )
  )


faviconsTemplate :: Template
faviconsTemplate obj children =
  let
    pathToRoot = obj ? "pathToRoot" :: Text
    relativeHref_ = \p -> href_ (Text.append pathToRoot p)
  in
  link_
    [ rel_ "apple-touch-icon"
    , sizes_ "57x57"
    , relativeHref_ "images/favicons/apple-touch-icon-57x57.png" ]

  <> link_
    [ rel_ "apple-touch-icon"
    , sizes_ "60x60"
    , relativeHref_ "images/favicons/apple-touch-icon-60x60.png" ]

  <> link_
    [ rel_ "apple-touch-icon"
    , sizes_ "72x72"
    , relativeHref_ "images/favicons/apple-touch-icon-72x72.png" ]

  <> link_
    [ rel_ "apple-touch-icon"
    , sizes_ "76x76"
    , relativeHref_ "images/favicons/apple-touch-icon-76x76.png" ]

  <> link_
    [ rel_ "apple-touch-icon"
    , sizes_ "114x114"
    , relativeHref_ "images/favicons/apple-touch-icon-114x114.png" ]

  <> link_
    [ rel_ "apple-touch-icon"
    , sizes_ "120x120"
    , relativeHref_ "images/favicons/apple-touch-icon-120x120.png" ]

  <> link_
    [ rel_ "apple-touch-icon"
    , sizes_ "144x144"
    , relativeHref_ "images/favicons/apple-touch-icon-144x144.png" ]

  <> link_
    [ rel_ "apple-touch-icon"
    , sizes_ "152x152"
    , relativeHref_ "images/favicons/apple-touch-icon-152x152.png" ]

  <> link_
    [ rel_ "apple-touch-icon"
    , sizes_ "180x180"
    , relativeHref_ "images/favicons/apple-touch-icon-180x180.png" ]

  -- Generic
  <> link_
    [ rel_ "icon"
    , sizes_ "16x16"
    , type_ "image/png"
    , relativeHref_ "images/favicons/favicon-16x16.png" ]

  <> link_
    [ rel_ "icon"
    , sizes_ "32x32"
    , type_ "image/png"
    , relativeHref_ "images/favicons/favicon-32x32.png" ]

  <> link_
    [ rel_ "icon"
    , sizes_ "96x96"
    , type_ "image/png"
    , relativeHref_ "images/favicons/favicon-96x96.png" ]

  <> link_
    [ rel_ "icon"
    , sizes_ "194x194"
    , type_ "image/png"
    , relativeHref_ "images/favicons/favicon-194x194.png" ]

  -- Android
  <> link_
    [ rel_ "icon"
    , sizes_ "192x192"
    , type_ "image/png"
    , relativeHref_ "images/favicons/android-chrome-192x192.png" ]

  -- Manifest
  <> link_
    [ rel_ "manifest"
    , relativeHref_ "images/favicons/manifest.json" ]

  -- Ico format
  <> link_
    [ rel_ "shortcut icon"
    , relativeHref_ "images/favicons/favicon.ico" ]

  -- Meta
  <> meta_
    [ name_ "msapplication-TileColor"
    , content_ "#ffffff" ]

  <> meta_
    [ name_ "msapplication-TileImage"
    , content_ "{{pathToRoot}}images/favicons/mstile-144x144.png" ]

  <> meta_
    [ name_ "msapplication-config"
    , content_ "{{pathToRoot}}images/favicons/browserconfig.xml" ]

  <> meta_
    [ name_ "theme-color"
    , content_ "#ffffff" ]
