module Eval1
  ( eval
  , Env
  )
where

import           AST
import           Monads
import qualified Data.Map.Strict               as M
import           Data.Maybe
import           Prelude                 hiding ( fst
                                                , snd
                                                )
import           Data.Strict.Tuple
import           Control.Monad                  ( liftM
                                                , ap
                                                )

-- Entornos
type Env = M.Map Variable Int

-- Entorno nulo
initEnv :: Env
initEnv = M.empty

-- Mónada estado
newtype State a = State { runState :: Env -> Pair a Env }

instance Monad State where
  return x = State (\s -> (x :!: s))
  m >>= f = State (\s -> let (v :!: s') = runState m s in runState (f v) s')

-- Para calmar al GHC
instance Functor State where
  fmap = liftM

instance Applicative State where
  pure  = return
  (<*>) = ap

instance MonadState State where
  lookfor v = State (\s -> (lookfor' v s :!: s))
    where lookfor' v s = fromJust $ M.lookup v s
  update v i = State (\s -> (() :!: update' v i s)) where update' = M.insert

-- Ejercicio 1.b: Implementar el evaluador utilizando la monada State

-- Evalua un programa en el estado nulo
eval :: Comm -> Env
eval p = snd (runState (stepCommStar p) initEnv)

-- Evalua multiples pasos de un comando, hasta alcanzar un Skip
stepCommStar :: MonadState m => Comm -> m ()
stepCommStar Skip = return ()
stepCommStar c    = stepComm c >>= \c' -> stepCommStar c'

-- Evalua un paso de un comando
stepComm :: MonadState m => Comm -> m Comm
stepComm Skip = return Skip
stepComm (Let s ei) = do eval <- evalExp ei
                         update s eval
                         return Skip
stepComm (Seq s1 s2) = case s1 of
                            Skip -> stepComm s2
                            _ -> do evalS1 <- stepComm s1
                                    stepComm (Seq evalS1 s2)
stepComm (IfThenElse b t1 t2) = do bv <- evalExp b
                                   if bv then stepComm t1
                                         else stepComm t2
stepComm e@(While b s1) = do bv <- evalExp b
                             if bv then stepComm (Seq s1 e)
                                   else stepComm Skip

evalBi :: MonadState m => (a -> a -> b) -> Exp a -> Exp a -> m b
evalBi f e1 e2 = do v1 <- evalExp e1
                    v2 <- evalExp e2
                    return (f v1 v2)

evalUn :: MonadState m => (a -> a) -> Exp a -> m a
evalUn f e = do v <- evalExp e
                return (f v)

-- Evalua una expresion
evalExp :: MonadState m => Exp a -> m a
evalExp (Const i) = return i
evalExp (Var s) = lookfor s
evalExp (UMinus e) = evalUn (\s -> - s) e
evalExp (Plus e1 e2) = evalBi (+) e1 e2
evalExp (Minus e1 e2) = evalBi (-) e1 e2
evalExp (Times e1 e2) = evalBi (*) e1 e2
evalExp (Div e1 e2) = evalBi div e1 e2
evalExp BTrue = return True
evalExp BFalse = return False
evalExp (Lt e1 e2) = evalBi (<) e1 e2
evalExp (Gt e1 e2) = evalBi (>) e1 e2
evalExp (And e1 e2) = evalBi (&&) e1 e2
evalExp (Or e1 e2) = evalBi (||) e1 e2 
evalExp (Not e) = evalUn not e
evalExp (Eq e1 e2) = evalBi (==) e1 e2 
evalExp (NEq e1 e2) = evalBi (/=) e1 e2
evalExp (EAssgn s e) = do v <- evalExp e
                          update s v
                          return v
evalExp (ESeq e1 e2) = do evalExp e1
                          evalExp e2

