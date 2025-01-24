module Play.Functor where

fPlusOne::(Functor f, Num n) => f n -> f n
fPlusOne = fmap (+1)

fReplicateThree::(Functor f) => f a -> f [a]
fReplicateThree = fmap (replicate 3)

a = fmap (replicate 3) [1,2,3] -- == [[1,1,1],[2,2,2],[3,3,3]] --fmap é equivalente a map para []
b = fmap (replicate 3) (Just 4) -- == Just [4,4,4] --Nao esqueca dos parentess
c fmap (replicate 3) Nothing  -- == Nothing --

--

{-
PRIMEIRA LEI: Ao usar id como a função para um functor, 
 o functor deve si manter que nem o original
Ex:
    fmap id (Just 3) == Just 3
    id (Just 3) == Just 3

    fmap id Nothing == Nothing
    id Nothing = Nothing

SEGUNDA LEI: Ao usar função f e g, devem ter os mesmos resultados 
 nesses cenarios, os seguintes casos, fmap (a . b) x e fmap a (fmap b x) 
Ex: 
    (add1,add2) = ( (+1),(+2) )
    fmap (add1 . add2) $ Just 10 == Just 13
    fmap add1 (fmap add2 $ Just 10) == Just 13

CASO QUE A LEI É QUEBRADA
Ex:
    data CMaybe a = CNothing | CJust Int a deriving (Show)

    instance Functor CMaybe where
    fmap f CNothing = CNothing
    fmap f (CJust counter x) = CJust (counter+1) (f x)

    fmap id (CJust 0 "haha") == CJust 1 "haha"
    id (CJust 0 "haha") = CJust 0 "haha"
-}