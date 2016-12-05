{-# LANGUAGE FlexibleContexts #-}
module Utilities
  ( lsequence
  , process

  , (↩)
  , (⚡)
  , (⚡⚡)
  , (<&>)
  , pathToRootForProxy
  ) where


import Data.Aeson (FromJSON, ToJSON, Result(..), Value, fromJSON)
import Data.Text (Text)
import Flow
import Shikensu (list)
import Shikensu.Types (Dictionary, Metadata, Pattern, basename, pathToRoot)
import System.Directory (canonicalizePath)

import qualified Data.Aeson as Aeson (Object, encode)
import qualified Data.HashMap.Strict as HashMap (lookup)
import qualified Data.List as List (unzip, zip)
import qualified Data.Text as Text (unpack)
import qualified Data.Text.Lazy as Lazy.Text (unpack)
import qualified Data.Text.Lazy.Encoding as Lazy.Text (decodeUtf8)


-- Data


rootDir :: IO String
rootDir = canonicalizePath "./"




-- IO


lsequence :: Monad m => [(String, m a)] -> m [(String, a)]
lsequence list =
  let
    unzipped = List.unzip list
  in
    unzipped
      |> sequence . snd
      |> fmap (List.zip . fst $ unzipped)


process :: [Pattern] -> IO Dictionary
process patterns =
  rootDir >>= list patterns




-- Pure


infix 6 ↩
infixl 6 ⚡
infixl 6 ⚡⚡


(↩) :: (Monoid b) => (b -> b) -> [b] -> b
(↩) h = h . mconcat


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


pathToRootForProxy :: Dictionary -> Dictionary
pathToRootForProxy =
  fmap $ \def ->
    if basename def == "200" then
      def { pathToRoot = "/" }
    else
      def




-- Private


fromResult :: ToJSON a => Result a -> a
fromResult result =
  case result of
    Success x -> x
    Error err -> error err


aesonObjectToString :: Aeson.Object -> String
aesonObjectToString = Lazy.Text.unpack . Lazy.Text.decodeUtf8 . Aeson.encode
