module Play.IOTerminalFile where

import Control.Monad
import Data.Char
import System.IO

--main = do putStrLn . show $ 2    

--Demonstrando uso de return ()
main1 = do
    c <- getChar
    if c /= ' '
        then do
            putChar c
            main1
        else return ()

main1' = do
    c <- getChar
    when (c /= ' ') $ do
        putChar c
        main1'

--Consome infinitamente
main2' = forever $ do
    putStr "Give me some input: "
    l <- getLine
    putStrLn $ map toUpper l

--Usando do mapM
main3 = do
    colors <- forM [1,2,3,4] (\a -> do
        putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"
        color <- getLine
        return color)
    putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "
    mapM putStrLn colors

--Usando pela primeira vez getContents que é lazy
shortLinesOnly::String->String
shortLinesOnly = unlines . filter ((>) 15 . length ) . lines

main4 = do
    contents <- getContents
    putStr (shortLinesOnly contents)

main4'= interact shortLinesOnly

--Trabalhando com Handle
main5 = do
    handle <- openFile "girlfriend.txt" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle

main5' = do --lembre que withFile ja fecha o handle
    withFile "girlfriend.txt" ReadMode (\handle -> do
        contents <- hGetContents handle
        putStr contents)

withFile' :: FilePath -> IOMode -> (Handle -> IO a) -> IO a
withFile' path mode f = do
    handle <- openFile path mode
    result <- f handle
    hClose handle
    return result

    