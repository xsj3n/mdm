module AAMgmr where
import System.IO.Strict as SI
import Data.List as LI
import Data.Bool
import Data.Map as MP


x -: f = f x


getIPKeyList :: IO (Map String String)
getIPKeyList = SI.readFile "/home/xs/src/mdm/testnix.nix" >>=  return . parsePeers .findInnerOf "peers" "];" 

-- Returns what is between x and y in z string
findInnerOf :: String -> String -> String -> [String]
findInnerOf _ _ []  = []
findInnerOf bound_one bound_two str = let lns = lines str
                                          pred_one x = not $ isInfixOf bound_one x 
                                          pred_two x = isInfixOf bound_two x
                                      in  let half = (dropWhile (pred_one) lns) 
                                          in  fst $ LI.splitAt (last (findIndices pred_two half)) half


stripStrs :: [String] -> [String]
stripStrs [] = []
stripStrs (x:xs) = dropWhile (not == )

parsePeers :: [String] -> Map String String
parsePeers [] = MP.empty
parsePeers xs = let indices = findIndices (isInfixOf "publicKey") xs
                in MP.fromList $ LI.foldl (\acc x -> [((xs !! x), (xs!! (x + 1)))] ++ acc) [] indices



