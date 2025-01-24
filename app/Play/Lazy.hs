module Play.Lazy where

large::(Ord a)=>[a]->a
large [] = error "Empty List"
large [x] = x
--large (x:xs) | x>large xs = x | otherwise = large xs
large (x:xs) = max x (large xs)

--foo::[Integer]
--foo =  [1..] & map (^ 2) & filter odd & takeWhile (<10000)