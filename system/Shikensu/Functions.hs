module Shikensu.Functions where

import Flow
import Shikensu.Types
import qualified Data.Text as Text (pack, toLower, unpack)


lowerCaseBasename :: Dictionary -> Dictionary
lowerCaseBasename =
  fmap
    <| \def -> def {
         basename = basename def
           |> Text.pack
           |> Text.toLower
           |> Text.unpack
       }
