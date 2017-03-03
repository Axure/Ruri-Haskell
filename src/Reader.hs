module Reader
(readLine)
 where

import Control.Monad

readLine:: a -> IO String
readLine prompt = do
    putStrLn "Ruri > " 
    name <- getLine
    return name


