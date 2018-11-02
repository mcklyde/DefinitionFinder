{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

type Name = T.Text
type Meaning = T.Text
type Entry = (Name, Meaning)

textToEntry :: T.Text -> Entry
textToEntry str = T.breakOn " \915\199\246 " str

findName :: T.Text -> Entry -> Bool
findName str (w, d) = if str == w
        then True
        else False

prettyPrint :: Entry -> T.Text
prettyPrint (w, d) = T.drop 5 d

main :: IO ()
main = do
        putStrLn "Type a word thx"
        word <- getLine
        dictionary <- TIO.readFile "dictionary.txt"
        let entries = filter (\x -> findName (T.pack word) x) . map (textToEntry) . T.lines $ dictionary
        mapM_ (TIO.putStrLn . prettyPrint) entries
        return ()
