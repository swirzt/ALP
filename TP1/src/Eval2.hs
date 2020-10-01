module Eval2
  ( eval
  , State
  )
where

import           AST
import qualified Data.Map.Strict               as M
import           Data.Strict.Tuple

-- Estados
type State = M.Map Variable Int

-- Estado nulo
-- Completar la definición
initState :: State
initState = M.empty

-- Busca el valor de una variable en un estado
-- Completar la definición
lookfor :: Variable -> State -> Either Error Int
lookfor v s = case M.lookup v s of
                  Just n -> Right n
                  Nothing -> Left UndefVar

-- Cambia el valor de una variable en un estado
-- Completar la definición
update :: Variable -> Int -> State -> State
update = M.insert

-- Evalua un programa en el estado nulo
eval :: Comm -> Either Error State
eval p = stepCommStar p initState

-- Evalua multiples pasos de un comnado en un estado,
-- hasta alcanzar un Skip
stepCommStar :: Comm -> State -> Either Error State
stepCommStar Skip s = return s
stepCommStar c    s = do
  (c' :!: s') <- stepComm c s
  stepCommStar c' s'

-- Evalua un paso de un comando en un estado dado
-- Completar la definición
stepComm :: Comm -> State -> Either Error (Pair Comm State)
stepComm (Skip) e = Right (Skip :!: e)
stepComm (Let x y) e = case evalExp y e of
                            Right (n :!: e') -> Right (Skip :!: update x n e')
                            Left x -> Left x
stepComm (Seq s1 s2) e = case stepComm s1 e of
                            Right (Skip :!: e') -> stepComm s2 e' 
                            Left x -> Left x
stepComm (IfThenElse x y z) e = case evalExp x e of
                                     Right (v :!: e') -> if v then stepComm y e' else stepComm z e'
                                     Left x -> Left x
stepComm w@(While x y) e = case evalExp x e of 
                                Right (v :!: e') -> if v then stepComm (Seq y w) e' else Right (Skip :!: e')
                                Left x -> Left x
                        
-- Evalua una expresion
-- Completar la definición
evalExp :: Exp a -> State -> Either Error (Pair a State)
evalExp (Const n) e = Right (n :!: e)
evalExp (Var n) e = case lookfor n e of
                         Right x -> Right (x :!: e)
                         Left x -> Left x
evalExp (UMinus n) e = case evalExp n e of
                            Right (v :!: e') -> Right ((-v) :!: e')
                            Left x -> Left x
evalExp (Plus x y) e = case evalExp x e of
                            Right (v1 :!: e') -> case evalExp y e' of
                                                      Right (v2 :!: e'') -> Right (v1 + v2 :!: e'')
                                                      Left x -> Left x
                            Left x -> Left x                     
evalExp (Minus x y) e = case evalExp x e of
                            Right (v1 :!: e') -> case evalExp y e' of
                                                      Right (v2 :!: e'') -> Right (v1 - v2 :!: e'')
                                                      Left x -> Left x
                            Left x -> Left x 
evalExp (Times x y) e = case evalExp x e of
                            Right (v1 :!: e') -> case evalExp y e' of
                                                      Right (v2 :!: e'') -> Right (v1 * v2 :!: e'')
                                                      Left x -> Left x
                            Left x -> Left x 
evalExp (Div x y) e = case evalExp x e of
                            Right (v1 :!: e') -> case evalExp y e' of
                                                      Right (v2 :!: e'') -> if v2 == 0 then Left DivByZero
                                                                                       else Right (div v1 v2 :!: e'') 
                                                      Left x -> Left x
                            Left x -> Left x  
evalExp (EAssgn xs y) e = case lookfor xs e of
                              Right _ -> case evalExp y e of 
                                             Right (v :!: e') -> Right (v :!: update xs v e')
                                             Left x -> Left x
                              Left x -> Left x
evalExp (ESeq s1 s2) e = case evalExp s1 e of 
                              Right (_ :!: e') -> evalExp s2 e'
                              Left x -> Left x    
-- Bool
evalExp BTrue e = Right (True :!: e) 
evalExp BFalse e = Right (False :!: e)
evalExp (Lt x y) e = case evalExp x e of
                      Right (v1 :!: e') -> case evalExp y e' of
                                            Right (v2 :!: e'') -> Right (v1 < v2 :!: e'')
                                            Left x -> Left x
                      Left x -> Left x
evalExp (Gt x y) e = case evalExp x e of
                      Right (v1 :!: e') -> case evalExp y e' of
                                            Right (v2 :!: e'') -> Right (v1 > v2 :!: e'')
                                            Left x -> Left x
                      Left x -> Left x
evalExp (Eq x y) e = case evalExp x e of
                      Right (v1 :!: e') -> case evalExp y e' of
                                            Right (v2 :!: e'') -> Right (v1 == v2 :!: e'')
                                            Left x -> Left x
                      Left x -> Left x
evalExp (NEq x y) e = case evalExp x e of
                      Right (v1 :!: e') -> case evalExp y e' of
                                            Right (v2 :!: e'') -> Right (v1 /= v2 :!: e'')
                                            Left x -> Left x
                      Left x -> Left x
evalExp (And x y) e = case evalExp x e of
                      Right (v1 :!: e') -> case evalExp y e' of
                                            Right (v2 :!: e'') -> Right (v1 && v2 :!: e'')
                                            Left x -> Left x
                      Left x -> Left x
evalExp (Or x y) e = case evalExp x e of
                      Right (v1 :!: e') -> case evalExp y e' of
                                            Right (v2 :!: e'') -> Right ((v1 || v2) :!: e'')
                                            Left x -> Left x
                      Left x -> Left x
evalExp (Not x) e = case evalExp x e of
                     Right (v1 :!: e') -> Right (not v1 :!: e')
                     Left x -> Left x