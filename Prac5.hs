import Prelude hiding (mapM)

-- /* Ejercicio 1 *\
newtype Pair a = P (a, a) deriving (Show)

instance Functor Pair where
  fmap f (P (a, b)) = P (f a, f b)

data Tree a = Empty | Branch a (Tree a) (Tree a) deriving (Show)

instance Functor Tree where
  fmap f Empty = Empty
  fmap f (Branch x l r) = Branch (f x) (fmap f l) (fmap f r)

data GenTree a = Gen a [GenTree a] deriving (Show)

instance Functor GenTree where
  fmap f (Gen x xs) = Gen (f x) (map (fmap f) xs)

newtype Cont a = C ((a -> Int) -> Int)

instance Functor Cont where
  fmap f (C g) = C (\k -> g (k . f))

appCont :: Cont a -> (a -> Int) -> Int
appCont (C g) = g

-- /* Ejercicio 3 *\
-- data A a = Num Int | Sum (A a) (A a) | Mul (A a) (A a) | Res (A a) (A a) | Var a

-- (>>==) :: A a -> (a -> A b) -> A b
-- Num n >>== v = Num n
-- Sum t u >>== v = Sum (t >>== v) (u >>== v)
-- Mul t u >>== v = Mul (t >>== v) (u >>== v)
-- Res t u >>== v = Res (t >>== v) (u >>== v)
-- Var a >>== v = v a

-- Sum x (Mul y z) >>== g = Sum (Var 1) (Mul (Res (Var 3) (Var 1)) (Mul (Var 2) (Var 2)))

-- g :: String -> A Int
-- g "x" = Var 1
-- g "y" = Res (Var 3) (Var 1)
-- g "z" = Mul (Var 2) (Var 2)

-- Sum x (Mul y z) >>== h = Sum (Var 1) (Res (Var 2) (Var 3))

-- No hay solución de h

-- /* Ejercicio 4 *\
-- data BT a = IfBoton (Bool -> BT a)
--           | Beep (BT a)
--           | Var a

-- beep :: Int -> BT ()
-- beep 0 = Var ()
-- beep n = Beep (beep (n-1))

-- ej :: BT a
-- ej = ejAux 0
--     where ejAux n = IfBoton (\b -> if b then beep n >>= \() -> ejAux (n+1) else ejAux n)

-- dubeep :: BT a
-- dubeep = duAux 0
--     where duAux n = IfBoton (\b -> if b then beep (mod n 2) >>= \() -> duAux (n+1) else duAux n)

-- /* Ejercicio 5 *\
-- data ES = Read (Char -> ES) | Write Char ES

-- t1 = Read (\c -> Write c (Write c t1)) Lee un caracter y lo escribe 2 veces
-- t2 = Read (\c -> Write '(' (Write c (Write ')' t2))) Lee un caracter e imprime '(' c ')'
-- t3 = Write '(' (Read (\c -> Write c (Write ')' t3))) Escribe '(' , lee un caracter, escribe c ')'
-- t4 = Read (\_ -> t4) lee caracteres y no ahce nada con ellos

-- /* Ejercicio 6 *\
-- data ES a = Read (Char -> ES a) | Write Char (ES a) | Var a

-- incC :: Char -> Char
-- incC c = let abc = zip (['a'..'z'] ++ ['\n']) [0..]
--              len = length abc
--              Just ind = lookup c abc
--              in fst $ abc !! mod (ind + 1) len

-- printES :: Show a => ES a -> String
-- printES = printES' 'a'

-- printES' :: Show a =>  Char -> ES a -> String
-- printES' c (Read f) = printES' (incC c) (f c)
-- printES' c (Write h t) = show h ++ printES' c t
-- printES' _ (Var a) = show a

-- (>>=) :: ES a -> (a -> ES b) -> ES b
-- Read k >>= v = Read (\c -> k c >>= v)
-- Write c t >>= v = Write c (t >>= v)
-- Var k >>= v = v k

-- writeChar :: Char -> ES ()
-- writeChar c = Write c (Var ())

-- readChar :: ES Char
-- readChar = Read Var

-- writeStr :: String -> ES ()
-- writeStr [] = Var ()
-- writeStr (x:xs) = writeChar x >>= \() -> writeStr xs

-- /* Ejercicio 7 *\

-- f :: ES String
-- f = readChar >>= g
--         where g '\n' = Var []
--               g c    = f >>= \xs -> Var (c:xs)

-- f lee una línea de entrada y la almacena en la variable final

-- /* Ejercicio 8 *\
-- instance Monad m => Functor m where
--     fmap f t = t >>= (return.f)

-- fmap id t =(fmap)= t >>= return.id = t >>= return =(monad.2)= t =(id)= id t
-- fmap g (fmap f t) = fmap g (t >>= return.f) = (t >>= return.f) >>= return.g =(monad.3)=
-- t >>= (\x -> return.f x >>= g)

-- /* Ejercicio 9 *\

mapM :: Monad m => (a -> m b) -> [a] -> m [b]
mapM f [] = return []
mapM f (x : xs) = do
  y <- f x
  ys <- mapM f xs
  return (y : ys)

-- mapM f (x:xs) = f x >>= \y -> mapM f xs >>= \ys -> return $ y : ys

foldM :: Monad m => (a -> b -> m a) -> a -> [b] -> m a
foldM _ e [] = return e
foldM f e (x : xs) = f e x >>= \r -> foldM f r xs

-- /* Ejercicio 10 *\
-- (m >>= \x -> h x) >>= \y -> f y >>= \z -> return (g z)
-- do x <- m
--    y <- h x
--    z <- f y
--    return (g z)

-- /* Ejercicio 11 *\
-- do x <- do z <- y
--            w <- f z
--            return (g w z)
--    y <- h x 3
--    if y then return 7
--         else do z <- h x 2
--                 return (k z)

-- (y >>= \z -> f z >>= \w -> return (g w z)) >>= \x -> h x 3 >>= \y -> if y then return 7
-- else h x 2 >>= \z -> return (k z)
-- /* Ejercicio 12 *\
-- monad.1
-- do y <- return x
--    f y

-- monad.2
-- do y <- t
--    return y

-- monad.3
-- do x <- t
--    y <- f x
--    g y

-- ===

-- do x <- t
--    (\y -> do z <- f y
--              g z) x