{-# LANGUAGE OverloadedStrings #-}

module Lib where

import qualified Data.Text as T
import qualified Data.Text.IO as TIO

type Name = T.Text

type Meaning = T.Text

type Entry = (Name, Meaning)

textToEntry :: T.Text -> Entry
textToEntry str = T.breakOn " \8212 " str

findName :: T.Text -> Entry -> Bool
findName str (w, d) = T.isInfixOf str w

prettyPrint :: Entry -> T.Text
prettyPrint (w, d) = T.drop 3 d
