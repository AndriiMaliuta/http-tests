module Main where

import Data.Char
import Network.HTTP
import Network.HTTP.Conduit
-- import qualified Data.ByteString.Lazy.Char8 as L8
import qualified Data.ByteString.Lazy as LB
-- import Network.HTTP.Simple
-- import Network.HTTP.Client
-- import Network.HTTP.Types.Status (statusCode)
import Text.HTML.TagSoup
-- improt Data.Text.StringLike
import Data.Typeable

--simpleHttp "https://stackoverflow.com" --LB.putStr

main :: IO ()
main = do
    req <- simpleHttp "https://en.wikipedia.org/wiki/Main_Page"
    let allTaggs = parseTags req
    let mainTag = head (take 1 allTaggs)
    --let links = [tag | tag <- allTaggs, tag ]
    -- let links = map f $ sections (~== "<A>")
    let txt = fromTagText (dropWhile (~/= "<div id=mw-content-text>") mainTag)
    print txt