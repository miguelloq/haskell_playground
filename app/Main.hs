module Main where
import Control.Monad
import Data.List (isInfixOf)
import Data.Char (toUpper)
import System.IO

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x
--flip' f = \x y -> f y x --equivalentes

reverseWords::String->String
reverseWords = unwords . map reverse . words

removeSubstring :: String -> String -> String
removeSubstring str sub = unwords $ removeSubWords (words str) (words sub)
  where
    removeSubWords :: [String] -> [String] -> [String]
    removeSubWords [] _ = []
    removeSubWords xs [] = xs
    removeSubWords xs ys
        | take (length ys) xs == ys = drop (length ys) xs
        | otherwise = head xs : removeSubWords (tail xs) ys


findComChar:: [String] -> [Char]
findComChar [] = []
findComChar (x:xs) = foldr sameChars x xs
    where
        sameChars s1 s2 = filter (`elem` s2) s1

main :: IO ()
main = do
    print "Hello world"
    return ()
