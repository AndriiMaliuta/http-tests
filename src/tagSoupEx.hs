module TagS where

import Network.HTTP
import Text.HTML.TagSoup

openURL :: String -> IO String
openURL x = getResponseBody =<< simpleHTTP (getRequest x)

spjPapers :: IO ()
spjPapers = do
        tags <- parseTags <$> openURL "http://research.microsoft.com/en-us/people/simonpj/"
        let links = map f $ sections (~== "<A>") $
                    takeWhile (~/= "<a name=haskell>") $
                    drop 5 $ dropWhile (~/= "<a name=current>") tags
        putStr $ unlines links
    where
        f :: [Tag String] -> String
        f = dequote . unwords . words . fromTagText . head . filter isTagText

        dequote ('\"':xs) | last xs == '\"' = init xs
        dequote x = x

main :: IO ()
main = spjPapers