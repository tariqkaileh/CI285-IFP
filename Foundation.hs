{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE QuasiQuotes                #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}
{-# LANGUAGE ViewPatterns               #-}

module Foundation where

import Yesod.Core
import Yesod.Form
import Database.Persist.Sqlite

{-
data Operator = Add | Divide | Multiply | Subtract | Squareof
    deriving (Show, Eq)
-}

{-
share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
Operations
    operand String
    left Int
    right Int
    result Int
    deriving Show
|]
-}

data App = App --ConnectionPool

mkYesodData "App" $(parseRoutesFile "routes")

instance Yesod App

{-
instance RenderMessage App FormMessage where
    renderMessage _ _ = defaultFormMessage

instance YesodPersist App where
  type YesodPersistBackend App = SqlBackend

  runDB action = do
    App pool <- getYesod
    runSqlPool action pool
-}
