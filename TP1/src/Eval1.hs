module Eval1
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
initState :: State
initState = M.empty

-- Busca el valor de una variable en un estado
lookfor :: Variable -> State -> Int
lookfor v s = s M.! v

-- Cambia el valor de una variable en un estado
update :: Variable -> Int -> State -> State
update = M.insert

-- Evalua un programa en el estado nulo
eval :: Comm -> State
eval p = stepCommStar p initState

-- Evalua multiples pasos de un comnado en un estado,
-- hasta alcanzar un Skip
stepCommStar :: Comm -> State -> State
stepCommStar Skip s = s
stepCommStar c    s = Data.Strict.Tuple.uncurry stepCommStar $ stepComm c s

-- Evalua un paso de un comando en un estado dado
stepComm :: Comm -> State -> Pair Comm State
stepComm (Skip) e = (Skip :!: e)
stepComm (Let x y) e = let (n :!: e') = evalExp y e in (Skip :!: update x n e')
stepComm (Seq Skip s) e = (s :!: e)
stepComm (Seq s1 s2) e = let (s' :!: e') = stepComm s1 e in (Seq s' s2 :!: e')
stepComm (IfThenElse x y z) e = case evalExp x e of
                                        (True :!: e') -> (y :!: e')
                                        (False :!: e') -> (z :!: e')
stepComm w@(While x y) e = case evalExp x e of
                                    (True :!: e') -> ((Seq y w) :!: e')
                                    (False :!: e') -> (Skip :!: e')
                        

-- Evalua una expresion
evalExp :: Exp a -> State -> Pair a State
--Int
evalExp (Const n) e = (n :!: e)
evalExp (Var n) e = (lookfor n e :!: e)
evalExp (UMinus n) e = let (v :!: e') = evalExp n e in ((-v) :!: e')
evalExp (Plus x y) e = let (v1 :!: e') = evalExp x e
                           (v2 :!: e'') = evalExp y e'
                       in (v1 + v2 :!: e'')
evalExp (Minus x y) e = let (v1 :!: e') = evalExp x e
                            (v2 :!: e'') = evalExp y e'
                        in (v1 - v2 :!: e'')
evalExp (Times x y) e = let (v1 :!: e') = evalExp x e
                            (v2 :!: e'') = evalExp y e'
                        in (v1 * v2 :!: e'')
evalExp (Div x y) e = let (v1 :!: e') = evalExp x e
                          (v2 :!: e'') = evalExp y e'
                      in (div v1 v2 :!: e'')
evalExp (EAssgn xs y) e = let (v :!: e') = evalExp y e
                          in (v :!: update xs v e')
evalExp (ESeq s1 s2) e = let (_ :!: e') = evalExp s1 e in evalExp s2 e'
-- Bool
evalExp BTrue e = (True :!: e) 
evalExp BFalse e = (False :!: e)
evalExp (Lt x y) e = let (v1 :!: e') = evalExp x e
                         (v2 :!: e'') = evalExp y e'
                     in (v1 < v2 :!: e'')
evalExp (Gt x y) e = let (v1 :!: e') = evalExp x e
                         (v2 :!: e'') = evalExp y e'
                     in (v1 > v2 :!: e'')
evalExp (Eq x y) e = let (v1 :!: e') = evalExp x e
                         (v2 :!: e'') = evalExp y e'
                     in (v1 == v2 :!: e'')
evalExp (NEq x y) e = let (v1 :!: e') = evalExp x e
                          (v2 :!: e'') = evalExp y e'
                      in (v1 /= v2 :!: e'')
evalExp (And x y) e = let (v1 :!: e') = evalExp x e
                          (v2 :!: e'') = evalExp y e'
                      in ((v1 && v2) :!: e'')
evalExp (Or x y) e = let (v1 :!: e') = evalExp x e
                         (v2 :!: e'') = evalExp y e'
                     in ((v1 || v2) :!: e'')
evalExp (Not x) e = let (v1 :!: e') = evalExp x e in (not v1 :!: e')