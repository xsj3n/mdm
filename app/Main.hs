{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE ExtendedDefaultRules #-}
module Main where 
import Yesod
import AA

data Mgmt = Mgmt
mkYesod "Mgmt" [parseRoutes|
/ RootR GET
|]

instance Yesod Mgmt

getRootR :: Handler Value
getRootR = return $ object ["msg" .= "text"]

main :: IO ()
main  = print $ getIPKeyList  

--warp 3000 Mgmt
