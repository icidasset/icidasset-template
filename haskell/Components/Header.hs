module Components.Header where

import Template
import qualified Components.Icon
import qualified Data.Text as Text (concat)


template :: Partial
template obj =
  let
    parentPath = obj ⚡⚡ "parentPath" :: Maybe Text
    category   = obj ⚡ "category" :: Maybe String

    logoHref = Text.concat
      [ obj ⚡⚡ "pathToRoot"
      , if obj ⚡⚡ "basename" /= "index" then "../" else ""
      ]
  in
    header_
      [ class_ "header" ] ↩
      [ container_
          [] ↩
          [ div_
              [ class_ "header__col header__col--left" ] ↩
              [ a_
                  [ href_ logoHref, class_ "header__logo" ] ↩
                  [ "I.A." ]

              , case parentPath of
                  Just x ->
                    a_
                      [ href_ x, class_ "header__go-up", title_ "Go up" ] ↩
                      [ Components.Icon.template "i-flash" obj ]
                  Nothing ->
                    ""

              , case category of
                  Just cat ->
                    span_
                      [ class_ "header__cat" ] ↩
                      [ toHtml cat ]
                  Nothing ->
                    ""
              ]

          , div_
              [ class_ "header__col header__col--right" ] ↩
              [ span_ "Steven Vandevelde" ]
          ]
      ]
