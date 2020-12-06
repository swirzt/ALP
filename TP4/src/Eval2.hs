module Eval2
  ( eval
  , Env
  )
where

import           AST
import           Monads
import qualified Data.Map.Strict               as M
import           Data.Maybe
import           Data.Strict.Tuple
import           Control.Monad                  ( liftM
                                                , ap
                                                )

-- Entornos
type Env = M.Map Variable Int

-- Entorno nulo
initEnv :: Env
initEnv = M.empty

-- Mónada estado, con manejo de errores
newtype StateError a =
  StateError { runStateError :: Env -> Either Error ( Pair a Env) }


-- Para calmar al GHC
instance Functor StateError where
  fmap = liftM

instance Applicative StateError where
  pure  = return
  (<*>) = ap

-- Ejercicio 2.a: Dar una instancia de Monad para StateError:
instance Monad StateError where
  return x = StateError (\s -> Right (x :!: s))
  m >>= f = StateError (\s -> runStateError m s >>=
                              \(v :!: s') -> runStateError (f v) s')

-- Ejercicio 2.b: Dar una instancia de MonadError para StateError:
instance MonadError StateError where
  throw e = StateError (\s -> Left e)

-- Ejercicio 2.c: Dar una instancia de MonadState para StateError:
instance MonadState StateError where
  lookfor v = StateError (\s -> case M.lookup v s of 
                            Nothing -> Left UndefVar
                            Just x -> Right (x :!: s))
  update v i = StateError (\s -> Right (() :!: update' v i s)) where update' = M.insert

-- Ejercicio 2.d: Implementar el evaluador utilizando la monada StateError.
-- Evalua un programa en el estado nulo
eval :: Comm -> Either Error Env
eval p = runStateError (stepCommStar p) initEnv >>= \(_:!:s) -> return s

-- Evalua multiples pasos de un comando, hasta alcanzar un Skip
stepCommStar :: (MonadState m, MonadError m) => Comm -> m ()
stepCommStar Skip = return ()
stepCommStar c    = stepComm c >>= \c' -> stepCommStar c'

-- Evalua un paso de un comando
stepComm :: (MonadState m, MonadError m) => Comm -> m Comm
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


evalBi :: (MonadState m, MonadError m) => (a -> a -> b) -> Exp a -> Exp a -> m b
evalBi f e1 e2 = do v1 <- evalExp e1
                    v2 <- evalExp e2
                    return (f v1 v2)

evalUn :: (MonadState m, MonadError m) => (a -> a) -> Exp a -> m a
evalUn f e = do v <- evalExp e
                return (f v)

-- Evalua una expresion
evalExp :: (MonadState m, MonadError m) => Exp a -> m a
evalExp (Const i) = return i
evalExp (Var s) = lookfor s
evalExp (UMinus e) = evalUn (\s -> - s) e
evalExp (Plus e1 e2) = evalBi (+) e1 e2
evalExp (Minus e1 e2) = evalBi (-) e1 e2
evalExp (Times e1 e2) = evalBi (*) e1 e2
evalExp (Div e1 e2) = do v1 <- evalExp e1
                         v2 <- evalExp e2
                         if v2 == 0 then throw DivByZero
                                    else return (div v1 v2)
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




