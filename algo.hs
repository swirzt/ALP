data Tree a = E | N Int (Tree a) a (Tree a)

first :: Tree a -> (a, Tree a)
first (N _ E x E) = (x, E)
first (N i l x r) = let (v, l') = first l in (v, N (i -1) l' x r)

size :: Tree a -> Int
size E = 0
size (N i _ _ _) = i

append :: Tree a -> Tree a -> Tree a
append xs E = xs
append E xs = xs
append xs ys = let (v, ys') = first ys in N (size xs + size ys) xs v ys'