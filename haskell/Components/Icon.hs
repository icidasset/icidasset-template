module Components.Icon where

import Template
import qualified Data.Text as Text (append, intercalate, pack)


template :: String -> Partial
template name =
  \obj ->
    let
      pathToRoot  = obj ⚡⚡ "pathToRoot" :: Text
      path        = Text.append pathToRoot "images/icons.svg"
      name_       = Text.pack name
    in
      span_
        [ class_ (Text.append "icon icon--" name_) ] ↩
        [ svg_
            [ class_ "icon__cnt" ] ↩
            [ use_
                [ makeAttribute "xlink:href" (Text.intercalate "#" [path, name_]) ]
            ]
        ]
