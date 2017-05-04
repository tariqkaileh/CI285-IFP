{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Subtract where

import Foundation
import Yesod.Core

getSubR :: Int -> Int -> Handler TypedContent
getSubR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Subtraction"
        [whamlet|#{x} - #{y} = #{z}|]
    provideJson $ object ["operand".= '-',
                          "left"   .= x,
                          "right"  .= y,
                          "result" .= z
                         ]
  where
    z = x - y
