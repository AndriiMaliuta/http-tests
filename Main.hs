module Main where

import Data.Char
-- import Network.HTTP
import qualified Data.ByteString.Lazy.Char8 as L8
-- import Network.HTTP.Simple
import Network.HTTP.Client
import Network.HTTP.Types.Status (statusCode)
import Text.HTML.TagSoup
import Data.Typeable

-- getData :: String -> String


main :: IO ()
main = do
   manSettings <- managerTlsConnection defaultManagerSettings 
   hostAddrr <- tupleToHostAddress ()
   manager <- newManager (manSettings (hostAddrr, "", 80)) --defaultManagerSettings

   request <- parseRequest "http://en.wikipedia.org/wiki/French_Revolutionary_Wars"
   response <- httpLbs request manager

--    putStrLn $ "The status code was: " ++ 
--         (show $ statusCode $ responseStatus response)
   putStrLn $ show $ typeOf $ responseBody response