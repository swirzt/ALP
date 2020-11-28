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
return x >>= f = St (\s -> (x,s)) >>= f = St (\t -> let (y,t') = (\s -> (x,s)) t in runState (f y) t'))
= St (\t -> let (y,t') = (x,t) in runState (f y) t'))
= St (\t -> runState (f x) t))
= St (runState (f x))
= f x

monad.2
St h >>= return
=
St (\s -> let (x,s') = runState (St h) s in runState (return x) s')
=
St (\s -> let (x,s') = h s in runState (return x) s')
=
St (\s -> let (x,s') = h s in runState (St (\t -> (x,t))) s')
=
St (\s -> let (x,s') = h s in (\t -> (x,t)) s')
=
St (\s -> let (x,s') = h s in (x,s'))
=
St (\s -> h s)
=
St h

monad.3
(State a >>= f) >>= g
<=> def de >>= f
(State (\s -> let (v,s′) = runState (State a) s in runState (f v) s′)) >>= g
<=> def de runState
(State (\s -> let (v, s′) = a s in runState (f v) s′)) >>= g
<=> def de >>= g
State (\t -> let (u, t′) = runState (State (\s -> let (v,s′) = a s in runState (f v) s′)) t in runState (g u) t′)
<=> def de runState
State (\t -> let (u, t′) = (\s -> let (v,s′) = a s in runState (f v) s′) t in runState (g u) t′)
<=> B-Redex
State (\t -> let (u, t′) = let (v,s′) = a t in runState (f v) s′ in runState (g u) t′)

State a >>= (\x -> f x >>= g)
<=> def >>=
State (\s -> let (v, s') = runState (State a) s in runState ((\x->f x >>= g) v) s')
<=>def runState
State (\s -> let (v, s') = a s in runState ((\x->f x >>= g) v) s')
<=> B-Redex
State (\s -> let (v, s') = a s in runState (f v >>= g) s')
<=> def >>=
State (\s -> let (v, s') = a s in runState (State (\t -> let (u, t') = runState (f v) t in runState (g u) t')) s')
<=> def runState
State (\s -> let (v, s') = a s in (\t -> let (u, t') = runState (f v) t in runState (g u) t') s')
<=> B-Redex
State (\s -> let (v, s') = a s in let (u, t') = runState (f v) s' in runState (g u) t')

--- Dem let let in in == let in let in -----
let v1 = (let v2 = f s in g v2) in h v1 -> let v1 = (g (f s)) in h v1 -> h (g (f s))
let v2 = f s in let v1 = g v2 in h v1 -> let v1 = g (f s) in h v1 -> h (g (f s))

----- Cambiar nombre de las funciones en la demostración para poder dar valores para el caso específico
-------------------------

Ahora con f = a
v1 = (u, t')
v2 = (v, s')
g = (\(x,y) -> runState (f x) y)
h = (\(x,y) -> runState (g x) y)

-}

set :: s -> State s ()
set e = St (\_ -> ((),e))

get :: State s s
get = St (\s -> (s,s))

-- /* Ejercicio 4 *\
data Tree a = Leaf a | Branch (Tree a) (Tree a) deriving Show

instance Functor Tree where
    fmap f (Leaf a) = Leaf (f a)
    fmap f (Branch l r) = Branch (fmap f l) (fmap f r)

numTree :: Tree a -> Tree Int
numTree t = fst (mapTreeNro update t 0)
    where update a n = (n, n + 1)

mapTreeNro :: (a -> Int -> (b, Int)) -> Tree a -> Int -> (Tree b, Int)
mapTreeNro f (Leaf x) n = let (x', y) = f x n in (Leaf x', y)
mapTreeNro f (Branch l r) n = let (l',m) = mapTreeNro f l n
                                  (r',p) = mapTreeNro f r m
                                  in (Branch l' r', p)

mapTreeM :: (a -> State s b) -> Tree a -> State s (Tree b)
mapTreeM f (Leaf x) = do y <- f x
                         return (Leaf y)
mapTreeM f (Branch l r) = do l' <- mapTreeM f l
                             r' <- mapTreeM f r
                             return (Branch l' r')

-- /* Ejercicio 5 *\
-- class Monoid m where
--     mempty :: m
--     mappend :: m -> m -> m

{-
Un string es un Monoid si tomamos:
mempty = ""
mappend = (++)
-}

newtype Output w a = Out (a,w) deriving Show

instance Monoid a => Functor (Output a) where
    fmap = liftM

instance Monoid a => Applicative (Output a) where
    pure = return
    (<*>) = ap

instance Monoid a => Monad (Output a) where
    return x = Out (x, mempty)
    Out (x, n) >>= f = let Out (y,m) = f x in Out (y,mappend n m)

-- instance Monoid a => Monad (Output a) where
--     return x = Out (x, mempty)
--     Out (x, n) >>= f = let Out (y,m) = f x in Out (y,mappend m n)

write :: Monoid w => w -> Output w ()
write w = Out ((),w)

data Exp = Const Int
          | Plus Exp Exp
          | Div Exp Exp
          deriving Show

termino :: Exp -> Int -> String
termino e n = "El termino " ++ show e ++ " tiene valor " ++ show n ++ "\n"

evalM :: Exp -> Output String Int
evalM c@(Const n) = do write (termino c n)
                       return n
evalM c@(Plus t u) = do m <- evalM t
                        n <- evalM u
                        let mn = m + n
                        write (termino c mn)
                        return mn
evalM c@(Div t u) = do m <- evalM t
                       n <- evalM u
                       let mn = div m n
                       write (termino c mn)
                       return mn

eval :: Exp -> IO ()
eval e = let Out (n,s) = evalM e in do putStr s
                                       print n

-- /* Ejercicio 6 *\
-- M a >> M b = M a >>= (\_ -> M b)
-- M a >>= f = NO SE PUEDE porque necesita datos del primer argumento

-- /* Ejercicio 7 *\
sequences :: Monad m => [m a] -> m [a]
sequences [] = return []
sequences (x:xs) = do y <- x
                      ys <- sequences xs
                      return (y : ys)

liftM1 :: Monad m => (a -> b) -> m a -> m b
liftM1 f mx = do x <- mx
                 return (f x)

liftM2 :: Monad m => (a -> b -> c) -> m a -> m b -> m c
liftM2 f mx my = do x <- mx
                    y <- my
                    return (f x y)

sequencef :: Monad m => [m a] -> m [a]
sequencef = foldr (liftM2 (:)) (return [])
-- sequencef [] = return []
-- sequencef (x:xs) = liftM2 (:) x (sequencef ys)

data Error er a = Raise er | Return a deriving Show

instance Functor (Error er) where
    fmap = liftM

instance Applicative (Error er) where
    pure = return
    (<*>) = ap

instance Monad (Error er) where 
  return = Return
  Return x >>= f = f x
  Raise e >>= f = Raise e

{-
monad.1
return x >>= f
= def return
Return x >>= f
= def >>=
f x

monad.2
Return x >>= return
= def >>=
return x
= def return
Return x

Raise e >>= return
= def >>=
Raise e

monad.3
(Return x >>= f) >>= g
= def >>=
f x >>= g
= B redux
(\y -> f y >>= g) x
= def >>=
Return x >>= (\y -> f y >>= g)

(Raise e >>= f) >>= g
= def >>=
Raise e >>= g
= def >>=
Raise e
= def >>=
Raise e >>= (\x -> f x >>= g)
-}
throwe :: String -> Error String a
throwe = Raise

headE :: [a] -> Error String a
headE [] = throwe "Se intento hacer head a la lista vacia"
headE (x:_) = return x

tailE :: [a] -> Error String [a]
tailE [] = throwe "Se intento hacer tail a la lista vacia"
tailE (_:xs) = return xs

push :: a -> [a] -> Error String [a]
push x xs = return (x:xs)

pop :: [a] -> Error String [a]
pop [] = throwe "Se intento hacer pop a la pila vacia"
pop (_:xs) = return xs

-- /* Ejercicio 9 *\
data T = Con Int | Divv T T

newtype M s e a = M {runM :: s -> Error e (a,s)}

evalT :: T -> M Int String Int
evalT (Con n) = return n
evalT (Divv t1 t2) = do v1 <- evalT t1
                        v2 <- evalT t2
                        if v2 == 0 then raise "Error: Division por cero."
                                   else do modify (+1)
                                           return (div v1 v2)

doEval :: T -> Error String (Int,Int)
doEval t = runM (evalT t) 0

instance Functor (M s e) where
    fmap = liftM

instance Applicative (M s e) where
    pure = return
    (<*>) = ap

instance Monad (M s e) where
  return x = M (\s -> return (x,s))
  M h >>= f = M (\s -> case h s of
                        Raise ss -> Raise ss
                        Return (x,n) -> case runM (f x) n of
                                          Raise s2 -> Raise s2
                                          Return (y,m) -> return (y,m))

raise :: String -> M s String a
raise ss = M (\_ -> throwe ss)

modify :: (s -> s) -> M s e ()
modify f = M (\s -> return ((),f s))

evalNOM :: T -> (Int -> (Int,Int))
evalNOM (Con n) = \i -> (n,i)
evalNOM (Divv t1 t2) = \i -> let (n,u) = evalNOM t1 i
                                 (m,v) = evalNOM t2 u
                                 in (div n m, v + 1)

-- /* Ejercicio 10 *\
newtype Cont r a = Cont ((a -> r) -> r)

runCont :: Cont r a -> ((a -> r) -> r)
runCont (Cont h) = h

instance Functor (Cont r) where
    fmap = liftM

instance Applicative (Cont r) where
    pure = return
    (<*>) = ap

instance Monad (Cont r) where
  return x = Cont (\f -> f x)
  -- Cont ((a -> r) -> r) -> (a -> Cont ((b -> r) -> r)) -> Cont ((b -> r) -> r)
  Cont h >>= f = Cont (\g -> h (\x -> runCont (f x) g))

{-
monad.1
return x >>= f
= def return
Cont (\g -> g x) >>= f
= def >>=
Cont (\h -> (\g -> g x) (\y -> runCont (f y) h))
= Beta redex
Cont (\h -> (\y -> runCont (f y) h) x)
= Beta redex
Cont (\h -> runCont (f x) h)
= Eta redex
Cont (runCont (f x))
= Cont runCont = id
f x

monad.2
Cont h >>= return
= def >>=
Cont (\g -> h (\x -> runCont (return x) g))
= def return
Cont (\g -> h (\x -> runCont (Cont (\f -> f x)) g))
= def runCont
Cont (\g -> h (\x -> (\f -> f x) g))
= Beta redex
Cont (\g -> h (\x -> g x))
= Eta redex
Cont (\g -> h g)
= Eta redex
Cont h

 Cont h >>= f = Cont (\g -> h (\x -> runCont (f x) g))

monad.3
(Cont h >>= f) >>= g
= def >>=
(Cont (\a -> h (\x -> runCont (f x) a))) >>= g
= def >>=
Cont (\b -> (\a -> h (\x -> runCont (f x) a)) (\y -> runCont (g y) b))
= Beta redex
Cont (\b -> h (\x -> runCont (f x) (\y -> runCont (g y) b)))
=================
Cont (\b -> h (\x -> runCont (f x) (\y -> runCont (g y) b)))
= Beta redex
Cont (\b -> h (\x -> (\a -> runCont (f x) (\y -> runCont (g y) a)) b))
= def runCont
Cont (\b -> h (\x -> runCont (Cont (\a -> runCont (f x) (\y -> runCont (g y) a))) b))
= def >>=
Cont (\b -> h (\x -> runCont (f x >>= g) b))
= Beta redex
Cont (\b -> h (\x -> runCont ((\c -> f c >>= g) x) b))
= def >>=
Cont h >>= (\c -> f c >>= g)
-}

newtype Mk m a = Mk (m (Maybe a))

instance Monad m => Functor (Mk m) where
    fmap = liftM

instance Monad m => Applicative (Mk m) where
    pure = return
    (<*>) = ap

instance Monad m => Monad (Mk m) where
  return x = Mk $ return $ return x
-- Mk (m (Maybe a)) -> (a -> Mk (m (Maybe b))) -> Mk (m (Maybe b))
-- Just . f :: a -> Maybe (Mk m b)
  Mk ma >>= f = Mk (ma >>= \x -> case x >>= Just . f of
                                    Nothing -> return Nothing
                                    Just (Mk sd) -> sd)

{-
monad.1
return x >>= f
= def return Mk
Mk $ return $ return x >>= f
= def >>= Mk
Mk (return $ return x >>= \y -> case y >>= Just . f of
                                  Nothing -> return Nothing
                                  Just (Mk sd) -> sd)
= monad.1 para m
Mk (\y -> case y >>= Just.f of
            Nothing -> return Nothing
            Just (Mk sd) -> sd) (return x)
= Beta redex
Mk (case return x >>= Just . f of
        Nothing -> Nothing
        Just (Mk sd) -> sd)
= monad.1 para Maybe
Mk (case Just.f x of
      Nothing -> return Nothing
      Just (Mk sd) -> sd)
= f x :: Mk m a -> f x = Mk sd
Mk sd
= anterior
f x

monad.2
Mk ms >>= return
= def >>= Mk
Mk (ms >>= \x -> case x >>= Just.return of
                    Nothing -> return Nothing
                    Just (Mk sd) -> sd)
---- si x = Nothing
Mk (ms >>= \x -> case Nothing >>= Just.return of
                    Nothing -> return Nothing
                    Just (Mk sd) -> sd)
= def >>= Maybe
Mk (ms >>= \x -> case Nothing of
                    Nothing -> return Nothing
                    Just (Mk sd) -> sd)
= def case
Mk (ms >>= \x -> return Nothing)
= x = Nothing
Mk (ms >>= \x -> return x)
= Eta redex
Mk (ms >>= return)
= monad.2 m
Mk ms

---- si x = Just y
Mk (ms >>= \x -> case Just y >>= Just.return of
                    Nothing -> return Nothing
                    Just (Mk sd) -> sd)
= def >>= Maybe
Mk (ms >>= \x -> case Just.return y of
                    Nothing -> return Nothing
                    Just (Mk sd) -> sd)
= def return Mk
Mk (ms >>= \x -> case Just (Mk $ return $ return y) of
                    Nothing -> return Nothing
                    Just (Mk sd) -> sd)
= def return Maybe
Mk (ms >>= \x -> case Just (Mk $ return $ Just y) of
                    Nothing -> return Nothing
                    Just (Mk sd) -> sd)
= return $ Just y matchea con sd
Mk (ms >>= \x -> return $ Just y)
= x = Just y
Mk (ms >>= \x -> return x)
= Eta redex
Mk (ms >>= return)
= monad.2 m
Mk ms

monad.3

-}

throw :: Monad m => Mk m a
throw = Mk $ return Nothing

newtype StInt a = StI (Int -> (a,Int))
type N a = Mk StInt a

runStInt :: StInt a -> (Int -> (a,Int))
runStInt (StI h) = h

instance Functor StInt where
    fmap = liftM

instance Applicative StInt where
    pure = return
    (<*>) = ap

instance Monad StInt where
  return x = StI (\s -> (x,s))
  StI h >>= f = StI (\s -> let (n,s') = h s in runStInt (f n) s')

getN :: N Int
getN = Mk (StI (\s -> (return s,s)))

put :: Int -> N ()
put n = Mk (StI (\_ -> (return (),n)))

data Expr = Var
          | Cons Int
          | Let Expr Expr
          | Add Expr Expr
          | Divi Expr Expr
          deriving Show

evalExpr :: Expr -> N Int
evalExpr Var = getN
evalExpr (Cons n) = return n
evalExpr (Let t1 t2) = do v1 <- evalExpr t1
                          put v1
                          evalExpr t2
evalExpr (Add t1 t2) = do v1 <- evalExpr t1
                          v2 <- evalExpr t2
                          return (v1 + v2)
evalExpr (Divi t1 t2) = do v1 <- evalExpr t1
                           v2 <- evalExpr t2
                           if v2 == 0 then throw
                                      else return (div v1 v2)

runMk :: Mk m a -> m (Maybe a)
runMk (Mk s) = s

runN :: N a -> (Int -> (Maybe a,Int))
runN n = runStInt $ runMk n

retEval :: Expr -> Maybe Int
retEval e = fst $ runN (evalExpr e) 0