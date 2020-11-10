import Data.Char

data GenTree a = Gen a [GenTree a] deriving Show

instance Functor GenTree where
    fmap f (Gen x xs) = Gen (f x) (map (fmap f) xs)

data Cont a = C ((a -> Int) -> Int)

instance Functor Cont where
    fmap f (C g) = C (\k -> g (k . f))

appCont :: Cont a -> (a -> Int) -> Int
appCont (C g) f = g f