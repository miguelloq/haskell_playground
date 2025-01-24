module Exercism () where

import Data.Char (toLower)
import Data.Function ((&))
import qualified Data.Set as Set

greet::String->String
greet name = "Hello " ++ name

isLeapYear::Integer->Bool
isLeapYear n
    | n `mod` 4 == 0 && n `mod` 100 /= 0 = True
    | n `mod` 400 == 0 = True
    | otherwise = False

reverseString::String->String
reverseString str = helper "" str
    where 
        helper s "" = s
        helper s (x:xs) = helper (x:s) xs 

data Planet = Mercury | Venus | Earth | Mars | Jupiter | Saturn | Uranus | Neptune
ageOn::Planet->Float->Float
ageOn planet seconds =  
    case planet of  Mercury -> multEarth 0.2408467
                    Venus -> multEarth 0.61519726
                    Earth -> multEarth 1.0
                    Mars -> multEarth 1.8808158
                    Jupiter -> multEarth 11.862615
                    Saturn -> multEarth 29.447498
                    Uranus -> multEarth 84.016846
                    Neptune -> multEarth 164.79132 
    where
        earthY = seconds / 31557600
        roundToTwoDecimals x = fromIntegral (round (x * 100)) / 100
        multEarth s = roundToTwoDecimals (earthY / s)


data Radius = Outside | Outer | Middle | Inner      
score::Float->Float->Int
score x y = distance x y & distanceToType & typeToInt
    where         
        typeToInt Outside = 0
        typeToInt Outer = 1
        typeToInt Middle = 5
        typeToInt Inner = 10
        distance x y  = sqrt (x**2 + y**2)
        distanceToType dist | dist > 10.0 = Outside | dist > 5.0 = Outer | dist > 1.0 = Middle | otherwise = Inner
        
isPangram::String->Bool
isPangram sentence = Set.size uniqueLetters == 26
    where
        letters = map toLower sentence
        uniqueLetters = Set.fromList letters