module Chunky where

import Html (Attribute, Html)
import Html.Attributes (cls)
import Protolude

import qualified Data.Text as Text
import qualified Html


-- 1


slab :: ([Attribute] -> [Html] -> Html) -> [Attribute] -> [Text] -> [Html] -> Html
slab typ attributes classes children =
    typ
        ( (<>)
            [ cssClass classes  ]
            attributes
        )
        children


slaby a b c d =
    slab a b c [ d ]



-- 2


brick =
    slab Html.div


bricky a b c =
    brick a b [ c ]



-- 3


chunk =
    brick []


chunky a b =
    chunk a [ b ]


inline  =
    slab Html.span []



-- 4


raw =
    chunk []


rawy a =
    raw [ a ]



-- ㊙️


cssClass :: [Text] -> Attribute
cssClass classes =
    cls (Text.intercalate " " classes)
