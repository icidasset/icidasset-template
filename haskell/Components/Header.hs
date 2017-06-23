module Components.Header where

import Data.Text (Text)
import Html hiding (title)
import Html.Attributes
import Html.Custom
import Prelude hiding (div, span)
import Shikensu.Utilities

import qualified Components.Icon
import qualified Data.Text as Text (concat)
import qualified Shikensu (Metadata)


-- 🍯


template :: Shikensu.Metadata -> Html
template obj =
    header
        [ cls "header" ]
        [ container [] [ left obj, right ] ]



-- 👈


left :: Shikensu.Metadata -> Html
left obj =
    div
        [ cls "header__col header__col--left" ]
        [ -- Logo
          --
          a
            [ hrefRelative
                obj
                (if obj !~> "basename" /= "index" then "../" else "")
            , cls
                "header__logo"
            ]
            [ text "I.A." ]

        -- Category
        --
        , case obj ~> "category" of
            Just cat ->
                span
                    [ cls "header__cat" ]
                    [ text cat ]
            Nothing ->
                nothing

        -- Lightning bolt
        --
        , case obj !~> "parentPath" of
            Just x ->
                a
                    [ href x, cls "header__go-up"
                    , title "Go up"
                    ]
                    [ Components.Icon.template "i-flash" obj
                    ]
            Nothing ->
                nothing
        ]



-- 👉


right :: Html
right =
    div
        [ cls "header__col header__col--right" ]
        [ span
            []
            [ text "Steven Vandevelde" ]
        ]
