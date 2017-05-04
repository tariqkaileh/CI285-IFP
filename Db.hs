{-# LANGUAGE OverloadedStrings #-}

module Db where

import Control.Applicative ()
import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow ()

data TestField = TestField String Int Int Int deriving (Show)

instance FromRow TestField where
  fromRow = TestField <$> field <*> field <*> field <*> field

instance ToRow TestField where
  toRow (TestField op r l res) = toRow (op, r, l, res)

x :: Int 
x = 7
y :: Int
y = 1
z :: Int
z = 7

main :: IO ()
main = do
  conn <- open "test.db"
  execute conn "INSERT INTO Operations VALUES (?,?,?,?)" (TestField "*" x y z)
  close conn
