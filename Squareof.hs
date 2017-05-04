{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Squareof where

import Foundation
import Yesod.Core 

getSqoR :: Int -> Handler TypedContent
getSqoR x = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Square of"
        [whamlet|#{x} * #{x} = #{z}|]
    provideJson $ object ["operand".= '*',
                          "first"  .= x,
                          "second" .= x,
                          "result" .= z]
  where
    z = x * x
