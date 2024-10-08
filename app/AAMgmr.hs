module AAMgmr where
import System.IO.Strict as SI
import Data.List

x -: f = f x

getIPKeyList :: IO [String]
getIPKeyList = SI.readFile "/home/xs/src/mdm/testnix.nix" >>=  return . splitPeerToken . words 

splitPeerToken :: [String] -> Maybe [String]
splitPeerToken []  = Nothing
splitPeerToken [wrds] = (elemIndex "peer" wrds) >>= \index -> 
                        (snd $ splitAt index wrds) -: \wordlist ->
                        (last $ elemIndices "]" wordlist) -: \last_index -> 
                        Just $ fst $ splitAt last_index wordlist

