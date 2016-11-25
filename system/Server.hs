module Main where

import Snap.Core (Snap, route)
import Snap.Http.Server (quickHttpServe)
import Snap.Util.FileServe


main :: IO ()
main = quickHttpServe site


site :: Snap ()
site = route
  [ ("/", serveDirectory "./build")
  -- , ("/", serveFile "./build/200.html") -- TODO
  ]
