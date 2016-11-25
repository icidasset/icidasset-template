module Components.Header where

import Attributes
import Components.Icon
import Data.Text (Text)
import Elements
import Lucid.Base (Html)
import Lucid.Html5
import Types
import Utilities ((↩), (⚡⚡))

import qualified Data.Text as Text (null)


template :: Partial
template obj =
  let
    parentPath = obj ⚡⚡ "parentPath" :: Maybe Text
  in
    header_
      [ class_ "header" ] ↩
      [ container_
          [] ↩
          [ div_
              [ class_ "header__col header__col--left" ] ↩
              [ a_
                  [ relativeHref_ obj "", class_ "header__logo" ] ↩
                  [ "I.A." ]

              , case parentPath of
                  Just x ->
                    a_
                      [ href_ x, class_ "header__go-up", title_ "Go up" ] ↩
                      [ Components.Icon.template "i-flash" obj ]
                  Nothing ->
                    ""
              ]

          , div_
              [ class_ "header__col header__col--right" ] ↩
              [ span_ "Steven Vandevelde" ]
          ]
      ]
