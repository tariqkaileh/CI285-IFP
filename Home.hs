{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Home where

import Foundation
import Yesod.Core
--import Yesod.Form
--import Control.Applicative ((<$>), (<*>))
--import Data.Text
   
--The code below should be within the whamlet found below: --
{-   
<form method=post action=@{AddR} enctype=#{enctype}>
                ^{widget}
                <p>It also doesn't include the submit button.
                <button>Submit
        |]

-}

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
 setTitle "Minimal Multifile"
 [whamlet|
   
<h1>Welcome to my Calculator restfulAPI. </h1>
 
        <p>
            <a href=@{AddR 5 7}>HTML addition
        <p>
            <a href=@{AddR 5 7}?_accept=application/json>JSON addition

        <p>
            <a href=@{SubR 5 7}>HTML subtraction
        <p>
            <a href=@{SubR 5 7}?_accept=application/json>JSON subtraction

        <p>
            <a href=@{MulR 5 7}>HTML multiplication
        <p>
            <a href=@{MulR 5 7}?_accept=application/json>JSON multiplication

        <p>
            <a href=@{DivR 5 7}>HTML division
        <p>
            <a href=@{DivR 5 7}?_accept=application/json>JSON division
        <p>
            <a href=@{SqoR 5}>HTML square
        <p>
            <a href=@{SqoR 5}?_accept=application/json>JSON square

<h3> Tareq Kailah 15813131 </h3>
    |]
{-
data Calc = Calc
     {first :: Int,
      operand :: Text,
      second :: Int
     }

calcForm1 :: AForm Handler Calc
calcForm1 = Calc
    <$> areq intField "First Value" Nothing
    <*> areq textField "Operand" Nothing
    <*> areq intField "Second Value" Nothing    

calcForm :: Html -> MForm Handler (FormResult Calc, Widget)
calcForm = renderDivs calcForm1
-}
