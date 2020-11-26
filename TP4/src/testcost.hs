por :: Int -> Int -> Int
por = (*)

funcCost :: (a -> a -> b) -> Integer
funcCost por = 2
funcCost _ = 1