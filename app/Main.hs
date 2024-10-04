{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
module Main where
import           Yesod

data Mgmt = Mgmt

mkYesod "Mgmt" [parseRoutes|
/ RootR GET
|]

instance Yesod Mgmt

getRootR = return $ object ["msg" .= "text"]

main :: IO ()
main  = warp 3000 Mgmt
