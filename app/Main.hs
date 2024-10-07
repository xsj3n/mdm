{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE ExtendedDefaultRules #-}
import Yesod

data Mgmt = Mgmt

mkYesod "Mgmt" [parseRoutes|
/ RootR GET
|]

instance Yesod Mgmt

getRootR :: Handler Value
getRootR = return $ object ["msg" .= "text"]

main :: IO ()
main  = warp 3000 Mgmt
