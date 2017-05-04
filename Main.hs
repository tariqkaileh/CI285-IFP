{-# LANGUAGE OverloadedStrings          #-}
import Application ()
import Foundation
import Yesod.Core
import Database.Persist.Sqlite
--import Control.Monad.Trans.Resource (runResourceT)
--import Control.Monad.Logger (runStderrLoggingT)

--openConnectionCount :: Int
--openConnectionCount = 10

main :: IO ()
main = --runStderrLoggingT $ withSqlitePool "test.db3" openConnectionCount $ \pool -> liftIO $ do
    --runResourceT $ flip runSqlPool pool $ do
     --   runMigration migrateAll
    warp 3000 $ App -- pool

