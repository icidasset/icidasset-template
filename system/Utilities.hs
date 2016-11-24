{-# LANGUAGE FlexibleContexts #-}
module Utilities
  ( dictionary
  , lsequence
  , process

  , (↩)
  , (!)
  , (⚡)
  , (⚡⚡)
  , (<&>)
  ) where


import Data.Aeson (FromJSON, ToJSON, Result(..), Value, encode, fromJSON)
import Data.Dynamic (Dynamic, Typeable, fromDynamic)
import Data.Maybe (fromJust)
import Data.Text (Text)
import Flow
import Lucid.Base
import Shikensu (list, makeDefinition, makeDictionary)
import Shikensu.Contrib.IO (read)
import Shikensu.Types (Dictionary, Metadata, Pattern)
import System.Directory (canonicalizePath)

import qualified Data.Aeson as Aeson (Object, ToJSON, encode)
import qualified Data.ByteString.Lazy as ByteString (toStrict)
import qualified Data.HashMap.Strict as HashMap (lookup)
import qualified Data.List as List (head, lookup, map, reverse, unzip, zip)
import qualified Data.Text as Text (unpack)
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
  rootDir >>= list patterns




-- Pure


infix 6 ↩
infixl 6 ⚡
infixl 6 ⚡⚡


(↩) :: (Monoid b) => (b -> b) -> [b] -> b
(↩) h = h . mconcat


(!) :: (Eq k, Typeable v) => [(k, Dynamic)] -> k -> v
(!) deps = fromJust . fromDynamic . fromJust . ((flip List.lookup) deps)


(⚡) :: (FromJSON a, ToJSON a) => Metadata -> Text -> Maybe a
(⚡) obj key =
  key
    |> (flip HashMap.lookup) obj
    |> fmap fromJSON
    |> fmap fromResult


(⚡⚡) :: (FromJSON a, ToJSON a) => Metadata -> Text -> a
(⚡⚡) obj key = case (obj ⚡ key) of
  Just x  -> x
  Nothing -> error $
    "Could not find the key `" ++ (Text.unpack key)         ++ "` " ++
    "on the metadata object `" ++ (aesonObjectToString obj) ++ "` using (⚡⚡)"


(<&>) :: Functor f => f a -> (a -> b) -> f b
(<&>) = flip fmap


fromResult :: ToJSON a => Result a -> a
fromResult result =
  case result of
    Success x -> x
    Error err -> error err


aesonObjectToString :: Aeson.Object -> String
aesonObjectToString = Text.unpack . Text.decodeUtf8 . ByteString.toStrict . Aeson.encode
