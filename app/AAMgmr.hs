module AAMgmr where
import System.IO.Strict as SI
import Data.List as LI
import Data.Bool
import Data.Map as MP
import Data.Text as TT

qdelim :: Text 
qdelim = TT.pack "\""

x -: f = f x


getIPKeyList :: IO (Map Text Text)
getIPKeyList = SI.readFile "/home/xs/src/mdm/testnix.nix" >>=  return . parsePeers



parsePeers :: String -> Map Text Text 
parsePeers txt = let lns = TT.lines $ TT.pack txt 
                 in  let indices = findIndices (TT.isInfixOf $ TT.pack "publicKey") lns 
                     in  MP.fromList 
                         $ LI.map (\x -> (splitOn qdelim x)  !! 1 )
                         $ LI.foldl (\acc x -> acc ++ [(lns !! x, lns !! x + 1)]) [] indices



