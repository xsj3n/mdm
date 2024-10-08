module AAMgmr where
import System.IO.Strict as SI
import Data.List

x -: f = f x

getIPKeyList :: IO [String]
getIPKeyList = SI.readFile "/home/xis/src/mdm/testnix.nix" >>=  return . findInnerOf "peers" "];" 


findInnerOf :: String -> String -> String -> [String] 
findInnerOf bound_one bound_two text = let res = splitPeerToken bound_one bound_two $ words text
                                       in case res of Nothing -> error "Unable to find bound one"
                                                      Just ys -> ys


splitPeerToken :: String -> String -> [String] -> Maybe [String]
splitPeerToken []  = Nothing
splitPeerToken bound_one bound_two wrds = (elemIndex bound_one wrds) >>= \i -> 
                      let w = drop i wrds  
                      in Just $ take (last $ elemIndices bound_two w) w  



