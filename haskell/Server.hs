module Main where

import Network.HTTP.Types (status200)
import Network.Wai
import Network.Wai.Application.Static
import Network.Wai.Handler.Warp (run)


main :: IO ()
main = run 8080 app


app :: Application
app = staticApp $ config { ss404Handler = Just proxy }


config :: StaticSettings
config = defaultFileServerSettings "./build"


proxy :: Application
proxy _ sendResponse = sendResponse $ responseFile
    status200
    [( "Content-Type", "text/html" )]
    "./build/200.html"
    Nothing
