module Play.Exception where

import System.IO.Error
import System.IO
import System.Environment

--If file doent exists, throws exception
lengthInFileIO = do 
    contents <- readFile "we.txt"
    putStrLn $ "The filas has " ++ (show . length . lines $ contents) ++ " lines!"

main1 = lengthInFileIO
    where
        handler::IOError->IO()
        handler _ = putStrLn "Oops exception found"
        
--nao consegui importar catch sei la porque
