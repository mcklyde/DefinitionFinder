module Main where

import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import Lib

main :: IO ()
main = do
  putStrLn "Type a word thx"
  word <- getLine
  dictionary <- TIO.readFile "dictionary.txt"
  let entries =
        filter (findName (T.pack word)) . map (textToEntry) . T.lines $
        dictionary
  mapM_ (TIO.putStrLn . prettyPrint) entries
