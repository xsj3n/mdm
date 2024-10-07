module AAMgmr where
import System.IO.Strict as SI

getIPKeyList :: [String]
getIPKeyList = SI.readFile "/home/xs/src/mdm/testnix.nix" >>= splitPeerToken . words 

splitPeerToken :: [String] -> [String]
splitPeerToken []  = []
splitPeerToken [wrds] = let w = snd $ splitAt (elemIndex "peer" wrds) wrds 
                        in fst $ splitAt (last $ elemIndices "]" w) w




