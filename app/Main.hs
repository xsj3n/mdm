{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE ExtendedDefaultRules #-}
module Main where 
import Yesod
import AAMgmr
import Data.List

data Mgmt = Mgmt
mkYesod "Mgmt" [parseRoutes|
/ RootR GET
|]

instance Yesod Mgmt

getRootR :: Handler Value
getRootR = return $ object ["msg" .= "text"]

main :: IO ()
main  = getIPKeyList >>= print . intercalate " " 


--warp 3000 Mgmt
