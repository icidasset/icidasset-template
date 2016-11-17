module Moto.Utilities
  ( dictionary
  , lsequence
  , process

  , (!)
  , (<&>)
  ) where


import Data.Dynamic (Dynamic, Typeable, fromDynamic)
import Data.Maybe (fromJust)
import Data.Text (Text)
import Flow
import Shikensu (list, makeDefinition, makeDictionary)
import Shikensu.Contrib.IO (read)
import Shikensu.Types (Dictionary, Pattern)
import System.Directory (canonicalizePath)

import qualified Data.Aeson as Aeson (ToJSON, encode)
import qualified Data.ByteString.Lazy as ByteString (toStrict)
import qualified Data.List as List (head, lookup, map, reverse, unzip, zip)
import qualified Data.Text.Encoding as Text (decodeUtf8)


-- Data


rootDir :: IO String
rootDir = canonicalizePath "./"




-- IO


dictionary :: String -> IO Dictionary
dictionary localPath =
  rootDir >>= \dir -> return (makeDictionary dir "" [localPath])


lsequence :: Monad m => [(String, m a)] -> m [(String, a)]
lsequence list =
  let
    unzipped = List.unzip list
  in
    unzipped
      |> sequence . snd
      |> fmap ((List.zip . fst) unzipped)


process :: [Pattern] -> IO Dictionary
process patterns =
  rootDir
    >>= list patterns
    >>= Shikensu.Contrib.IO.read




-- Pure


(!) :: (Eq k, Typeable v) => [(k, Dynamic)] -> k -> v
(!) deps = fromJust . fromDynamic . fromJust . ((flip List.lookup) deps)


(<&>) :: Functor f => f a -> (a -> b) -> f b
(<&>) = flip fmap
