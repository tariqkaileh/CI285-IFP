{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Divide where

import Foundation
import Yesod.Core

msg :: String
msg = "Can not divide by 0"

getDivR :: Int -> Int -> Handler TypedContent
getDivR x y = if y == 0 then selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Division"
        [whamlet|#{x} / #{y} = #{msg}|]
    provideJson $ object ["operand".= '/',
                          "left"   .= x,
                          "right"  .= y,
                          "result" .= msg
                         ]
 else 
      selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Division"
        [whamlet|#{x} / #{y} = #{z}|]
    provideJson $ object ["operand".= '/',
                          "left"   .= x,
                          "right"  .= y,
                          "result" .= z
                         ]
  where
    z = ((fromIntegral x) / (fromIntegral y)) :: Double
{-
 this gave me a problem because 'z' is not Float. 
So when or if we devide and get fractional value at the end, that is not understood by the compiler etc
-}
