import Control.Applicative(Applicative(..))
import Control.Monad(liftM,ap)

-- /* Ejercicio 1 *\
newtype Id a = Id a deriving Show

instance Functor Id where
    fmap = liftM

instance Applicative Id where
    pure = return
    (<*>) = ap

instance Monad Id where
    return = Id
    Id x >>= f = f x

{-
monad.1
return x >>= f =(def return)= Id x >>= f =(def >>=)= f x

monad.2
t >>= return =(caso único)= Id x >>= return =(def >>=)= return x =(def return)= Id x =(inicio)= t

monad.3
-- (t >>= f) >>= g =(caso único)= (Id x >>= f) >>= g =(def >>=)= f x >>= g =(caso único)= Id y >>= g
=(def >>=)= g y

-- t >>= (\z -> f z >>= g) =(caso)= Id x >>= (\z-> f z >>= g) =(def >>=)= (\z-> f z >>= g) x
=(lambda)= f x >>= g =(caso)= Id y >>= g =(def >>=)= g y
-}

-- instance Monad Maybe where
--     return = Just
--     Just x >>= f = f x
--     Nothing >>= f = Nothing

{-
monad.1
return x >>= f =(def return)= Just x >>= f =(def >>=)= f x

monad.2
t >>= return 
-- t = Just x
Just x >>= return =(def >>=)= return x =(def return)= Just x =(inicio)= t
-- t = Nothing
Nothing >>= return =(def >>=)= Nothing = t

monad.3
(t >>= f) >>= g
-- t = Just x
(Just x >>= f) >>= g =(def >>=)= f x >>= g
    -- f x = Just y
    Just y >>= g = g y
    -- f x = Nothing
    Nothing >>= g = Nothing

Just x >>= (\p -> f p >>= g) =(def >>=)= (\p -> f p >>= g) x =(lambda)= f x >>= g ...

-- t = Nothing
(Nothing >>= f) >>= g =(def >>=)= Nothing >>= g =(def >>=)= Nothing

Nothing >>= (\p -> f p >>= g) =(def >>=)= Nothing
-}

-- /* Ejercicio 2 *\
-- instance Monad [] where
--     return x = [x]
--     xs >>= f = [y | x <- xs , y <- f x]

(>>-) :: [a] -> (a -> [b]) -> [b]
(>>-) xs f = [y | x <- xs , y <- f x]

{-
monad.1
return x >>= f =(def return)= [x] >>= f =(def >>=)= [y | p <- [x], y <- f x] =(p valor unico)=
    [y | y <- f x] =(eta redux)= f x

monad.2
t >>= return =(def >>=)= [y | x <- t, y <- return x] =(def return)= [y | x <- t, y <- [x]]
(hay un y por cada x, reduzco) = [x | x <- t] =(eta redux)= t

monad.3
(t >>= f) >>= g =(def >>=)= [y | x <- t, y <- f x] >>= g =(def >>=)=
    [p | k <- [y | x <- t, y <- f x], p <- g k] =(redux)= [p | x <- t, k <- f x, p <- g k]

t >>= (\x -> f x >>= g) =(def >>=)= [y | z <- t, y <- f z >>= g] =(def >>=)=
    [y | z <- t, y <- [k | n <- f z, k <- g n]] =(redux)=
        [y | z <- t, n <- f z, y <- g n] =(renombre)= [p | x <- t, k <- f x, p <- g k]
-}

-- /* Ejercicio 3 *\
newtype State s a = St {runState :: s -> (a,s)}

instance Functor (State s) where
    fmap = liftM

instance Applicative (State s) where
    pure = return
    (<*>) = ap

instance Monad (State s) where
    return x = St (\s -> (x,s))
    (St h) >>= f = St (\s -> let (x,s') = h s in runState (f x) s)

{-
monad.1
return x >>= f = St (\s -> (x,s)) >>= f = St (\t -> let (y,t') = (\s -> (x,s)) t in runState (f x) t))
= St (\t -> let (y,t') = (x,t) in runState (f y) t)) = St (\t -> runState (f x) t) = St (runState (f x))


-}