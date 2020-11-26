module Eval3
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

-- Ejercicio 3.a: Proponer una nueva monada que lleve el costo de las 
-- operaciones efectuadas en la computacion, ademas de manejar errores y 
-- estado, y de su instancia de mónada. Llamela StateErrorCost.
newtype StateErrorCost a =
  StateErrorCost { runStateErrorCost :: Env -> Either Error (Pair a Env,Cost) }
  
-- Recuerde agregar las siguientes instancias para calmar al GHC:
instance Functor StateErrorCost where
  fmap = liftM

instance Applicative StateErrorCost where
  pure  = return
  (<*>) = ap

instance Monad StateErrorCost where
  return x = StateErrorCost (\s -> Right ((x :!: s),0))
  m >>= f = StateErrorCost (\s -> case runStateErrorCost m s of
                        Left x -> Left x
                        Right ((v:!:s'),n) -> case runStateErrorCost (f v) s' of
                                              Left x -> Left x
                                              Right ((v':!:s''),n') -> Right ((v':!:s''),n'+n))
-- Ejercicio 3.c: Dar una instancia de MonadCost para StateErrorCost.
instance MonadCost StateErrorCost where
  work i = StateErrorCost (\s -> Right ((() :!: s),i))

-- Ejercicio 3.d: Dar una instancia de MonadError para StateErrorCost.
instance MonadError StateErrorCost where
  throw e = StateErrorCost (\s -> Left e)

-- Ejercicio 3.e: Dar una instancia de MonadState para StateErrorCost.
instance MonadState StateErrorCost where
  lookfor v = StateErrorCost (\s -> case M.lookup v s of
                                      Nothing -> Left UndefVar
                                      Just x -> Right ((x :!: s),0))

  update v i = StateErrorCost (\s -> Right ((() :!:update' v i s),0)) where update' = M.insert 

-- Ejercicio 3.f: Implementar el evaluador utilizando la monada StateErrorCost.
-- Evalua un programa en el estado nulo
eval :: Comm -> Either Error (Env, Cost)
eval p = case runStateErrorCost (stepCommStar p) initEnv of
              Left e -> Left e
              Right ((_:!:s),i) -> Right (s,i)

-- Evalua multiples pasos de un comando, hasta alcanzar un Skip
stepCommStar :: (MonadState m, MonadError m, MonadCost m) => Comm -> m ()
stepCommStar Skip = return ()
stepCommStar c    = stepComm c >>= \c' -> stepCommStar c'

-- Evalua un paso de un comando
stepComm ::(MonadState m, MonadError m, MonadCost m) => Comm -> m Comm
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

                                   
evalBi :: (MonadState m, MonadError m, MonadCost m) => (a -> a -> b) -> Exp a -> Exp a -> m b
evalBi f e1 e2 = do v1 <- evalExp e1
                    v2 <- evalExp e2
                    work 1
                    return (f v1 v2)

{-
evalBi :: (MonadState m, MonadError m, MonadCost m) => (a -> a -> b) -> Exp a -> Exp a -> m b
evalBi f e1 e2 = do v1 <- evalExp e1
                    v2 <- evalExp e2
                    work (funcCost f)
                    return (f v1 v2)

funcCost :: (a -> a -> b) -> Cost
funcCost (*) = 2
funcCost _ = 1
-}

evalUn :: (MonadState m, MonadError m, MonadCost m) => (a -> a) -> Exp a -> m a
evalUn f e = do v <- evalExp e
                work 1
                return (f v)


-- Evalua una expresion 
evalExp :: (MonadState m, MonadError m, MonadCost m) => Exp a -> m a
evalExp (Const i) = return i
evalExp (Var s) = lookfor s
evalExp (UMinus e) = evalUn (\s -> - s) e
evalExp (Plus e1 e2) = evalBi (+) e1 e2
evalExp (Minus e1 e2) = evalBi (-) e1 e2
evalExp (Times e1 e2) = do v1 <- evalExp e1
                           v2 <- evalExp e2
                           work 2
                           return (v1 * v2)
evalExp (Div e1 e2) = do v1 <- evalExp e1
                         v2 <- evalExp e2
                         work 2
                         if v2 == 0 then throw DivByZero else return (div v1 v2)
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


-- No podemos hacer pattern matching a las funciones?
-- No podemos castear el tipo de Div 