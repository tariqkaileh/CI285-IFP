{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Multiply where

import Foundation
import Yesod.Core

getMulR :: Int -> Int -> Handler TypedContent
getMulR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Multiplication"
        [whamlet|#{x} * #{y} = #{z}|]
    provideJson $ object ["operand".= '*',
                          "left"   .= x,
                          "right"  .= y,
                          "result" .= z
                         ]
  where
    z = x * y
