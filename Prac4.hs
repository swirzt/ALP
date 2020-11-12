-- {-# LANGUAGE RankNTypes #-}

-- -- | Laws:
-- --
-- -- > runList xs cons nil == xs
-- -- > runList (fromList xs) f z == foldr f z xs
-- -- > foldr f z (toList xs) == runList xs f z
-- newtype List a = 
--     List { runList :: forall r. (a -> r -> r) -> r -> r }

-- -- | Make a 'List' out of a regular list.
-- fromList :: [a] -> List a
-- fromList xs = List $ \k z -> foldr k z xs

-- -- | Turn a 'List' into a regular list.
-- toList :: List a -> [a]
-- toList xs = runList xs (:) []

-- -- | The 'List' counterpart to '(:)'.  Unlike 'DList', whose
-- -- implementation uses the regular list type, 'List' abstracts
-- -- over it as well.
-- cons :: a -> List a -> List a
-- cons x xs = List $ \k z -> k x (runList xs k z)

-- -- | Append two 'List's.  This runs in O(1) time.  Note that
-- -- there is no need to materialize the lists as @[a]@.
-- append :: List a -> List a -> List a
-- append xs ys = List $ \k z -> runList xs k (runList ys k z)

-- -- i.e.,

-- nil = {- fromList [] = List $ \k z -> foldr k z []
--                   = -} List $ \k z -> z

-- singleton x = {- cons x nil = List $ \k z -> k x (runList nil k z) 
--             = -} List $ \k z -> k x z

-- snoc xs x = {- append xs $ singleton x
--           = List $ \k z -> runList xs k (runList (singleton x) k z) 
--           = -} List $ \k z -> runList xs k (k x z)


-- null :: [a] -> Bool
-- null [] = True
-- null _  = False

insert :: (a -> a -> Bool) -> [a] -> a -> [a]
insert f xs x = foldr (\y ys  -> if null ys
                                    then if f y x
                                          then y : x : ys
                                          else y : ys
                                    else if f y x && f x (head ys)
                                          then y : x : ys
                                          else y : ys)
                        [] xs
