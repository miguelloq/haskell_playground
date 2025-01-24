module Play.Sort where

minorsAndMajors :: (Ord a) => a -> [a] -> ([a], [a])
minorsAndMajors value = foldl f ([], [])
  where
    f (smaller, bigger) x = if x <= value then (x : smaller, bigger) else (smaller, x : bigger)

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x : xs) = quicksort smaller ++ [x] ++ quicksort bigger
    where
      (smaller, bigger) = minorsAndMajors x xs
