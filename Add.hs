{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Add where

import Foundation
import Yesod.Core 
import Yesod.Form
import Home
{-
postAddR :: Handler Html
postAddR = do
    ((result, widget), enctype) <- runFormPost calcForm
    case result of
        FormSuccess calc -> defaultLayout [whamlet|<p>#{show calc}|]
       _ -> undefined
     [whamlet|
                <p>Invalid input, let's try again.
                <form method=post action=@{AddR} enctype=#{enctype}>
                    ^{widget}
                    <button>Submit
            |]
-}
getAddR :: Int -> Int -> Handler TypedContent
getAddR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Addition"
        [whamlet|#{x} + #{y} = #{z}|]
    provideJson $ object ["operand".= '+',
                          "first"  .= x,
                          "second" .= y,
                          "result" .= z]

    where
    z = x + y
