module Simplytyped
  ( conversion
  ,    -- conversion a terminos localmente sin nombre
    eval
  ,          -- evaluador
    infer
  ,         -- inferidor de tipos
    quote          -- valores -> terminos
  )
where

import           Data.List
import           Data.Maybe
import           Prelude                 hiding ( (>>=) )
import           Text.PrettyPrint.HughesPJ      ( render )
import           PrettyPrinter
import           Common

-- conversion a términos localmente sin nombres
conversion :: LamTerm -> Term
conversion = conversion' []

conversion' :: [String] -> LamTerm -> Term
conversion' b (LVar n    ) = maybe (Free (Global n)) Bound (n `elemIndex` b)
conversion' b (LApp t u  ) = conversion' b t :@: conversion' b u
conversion' b (LAbs n t u) = Lam t (conversion' (n : b) u)
conversion' b (LLet s t u) = Let (conversion' b t) (conversion' (s : b) u)
conversion' b (LAs t tt  ) = As (conversion' b t) tt
conversion' b (LUnit     ) = Unit
conversion' b (LFst t    ) = Fst (conversion' b t)
conversion' b (LSnd t    ) = Snd (conversion' b t)
conversion' b (LPair t u ) = Pair (conversion' b t) (conversion' b u)
conversion' b LZero        = Zero
conversion' b (LSuc t)     = Suc (conversion' b t)
conversion' b (LRec t u v) = Rec (conversion' b t) (conversion' b u) (conversion' b v)
-----------------------
--- eval
-----------------------

sub :: Int -> Term -> Term -> Term
sub i t (Bound j) | i == j    = t
sub _ _ (Bound j) | otherwise = Bound j
sub _ _ (Free n   )           = Free n
sub i t (u   :@: v)           = sub i t u :@: sub i t v
sub i t (Lam t'  u)           = Lam t' (sub (i + 1) t u)
sub i t (Let p u  )           = Let (sub i t p) (sub (i + 1) t u)
sub i t (As p u   )           = As (sub i t p) u 
sub _ _ (Unit     )           = Unit
sub i t (Fst p    )           = Fst (sub i t p)
sub i t (Snd p    )           = Snd (sub i t p)
sub i t (Pair p u )           = Pair (sub i t p) (sub i t u)
sub i t Zero                  = Zero
sub i t (Suc u    )           = Suc (sub i t u)
sub i t (Rec p u v)           = Rec (sub i t p) (sub i t u) (sub i t v)

-- evaluador de términos
-- type NameEnv v t = [(Name, (v, t))]
eval :: NameEnv Value Type -> Term -> Value
eval _ (Bound _             ) = error "variable ligada inesperada en eval"
eval e (Free  n             ) = fst $ fromJust $ lookup n e
eval _ (Lam      t   u      ) = VLam t u
eval e (Lam _ u  :@: Lam s v) = eval e (sub 0 (Lam s v) u)
eval e (Lam t u1 :@: u2) = let v2 = eval e u2 in eval e (sub 0 (quote v2) u1)
eval e (u        :@: v      ) = case eval e u of
  VLam t u' -> eval e (Lam t u' :@: v)
  a         -> error ("Error de tipo en run-time, verificar type checker. El tipo fue " ++ show a ++ " y evalue " ++ show u ++ " aplicado a " ++ show v)
eval e (Let t u             ) = let t' = eval e t
    in case t' of
      VLam k l -> eval e (sub 0 (Lam k l) u)
      _        -> error "Error de tipo en run-time, verificar type checker"
eval e (As t u              ) = eval e t 
eval e (Unit                ) = VUnit
eval e (Fst u               ) = case eval e u of
                                  VPair x _ -> x
                                  _ -> error "Error de tipo en run-time, verificar type checker"
eval e (Snd u               ) = case eval e u of
                                  VPair _ x -> x
                                  _ -> error "Error de tipo en run-time, verificar type checker"
eval e (Pair t u            ) = let 
                                  t' = eval e t
                                  u' = eval e u
                                in (VPair t' u')
eval e Zero                   = VNum (NZero)        
eval e (Suc t               ) = case eval e t of
                                  VNum n -> VNum (NSuc n)
                                  _ ->  error "Error de tipo en run-time, verificar type checker"
eval e (Rec t u v           ) = case eval e v of
                                     VNum (NZero) -> eval e t
                                     VNum (NSuc n) -> let r = eval e (Rec t u (quote (VNum n))) in eval e ((u :@: quote r) :@: quote (VNum n))
                                     _ ->  error "Error de tipo en run-time, verificar type checker"
                                     
-- Función definida por Wirzt porque es un capo de la optimización O(n)
-- Gurvich quiere hacerlo O(n!)
-- funRec :: Value -> Value -> NumVal -> Value
-- funRec t f NZero = t
-- funRec t f (Suc (n)) = f (funRec t f n) n                   

-----------------------
--- quoting
-----------------------

quote :: Value -> Term
quote (VLam t f ) = Lam t f
quote (VUnit    ) = Unit
quote (VPair t u) = Pair (quote t) (quote u)
quote (VNum  n  ) = case n of
                      NZero  -> Zero
                      NSuc x -> Suc (quote (VNum x)) 
----------------------
--- type checker
-----------------------

-- type checker
infer :: NameEnv Value Type -> Term -> Either String Type
infer = infer' []

-- definiciones auxiliares
ret :: Type -> Either String Type
ret = Right

err :: String -> Either String Type
err = Left

(>>=)
  :: Either String Type -> (Type -> Either String Type) -> Either String Type
(>>=) v f = either Left f v
-- fcs. de error

matchError :: Type -> Type -> Either String Type
matchError t1 t2 =
  err
    $  "se esperaba "
    ++ render (printType t1)
    ++ ", pero "
    ++ render (printType t2)
    ++ " fue inferido."

noPairError :: Type -> Either String Type
noPairError t =
  err
    $ "se esperaba PairT a b, pero "
    ++ render (printType t)
    ++ " fue inferido."

notfunError :: Type -> Either String Type
notfunError t1 = err $ render (printType t1) ++ " no puede ser aplicado."

notfoundError :: Name -> Either String Type
notfoundError n = err $ show n ++ " no está definida."

infer' :: Context -> NameEnv Value Type -> Term -> Either String Type
infer' c _ (Bound i) = ret (c !! i)
infer' _ e (Free  n) = case lookup n e of
  Nothing     -> notfoundError n
  Just (_, t) -> ret t
infer' c e (t :@: u) = infer' c e t >>= \tt -> infer' c e u >>= \tu ->
  case tt of
    FunT t1 t2 -> if (tu == t1) then ret t2 else matchError t1 tu
    _          -> notfunError tt
infer' c e (Lam t u) = infer' (t : c) e u >>= \tu -> ret $ FunT t tu
infer' c e (Let v u) = infer' c e v >>= \tv -> infer' (tv:c) e u
infer' c e (As  t u) = infer' c e t >>= \tt -> if tt == u then ret u else matchError tt u
infer' c e Unit      = ret UnitT
infer' c e (Fst t  ) = infer' c e t >>= \tt -> 
    case tt of
      PairT x _ -> ret x
      u         -> noPairError u
infer' c e (Snd t  ) = infer' c e t >>= \tt -> 
    case tt of
      PairT _ x -> ret x
      u         -> noPairError u
infer' c e (Pair t u) = infer' c e t >>= \tt -> infer' c e u >>= \tu -> ret (PairT tt tu)
infer' c e Zero = ret NatT
infer' c e (Suc n) = infer' c e n >>= \tn -> if tn == NatT then ret tn else matchError NatT tn
infer' c e (Rec t1 t2 t3) = infer' c e t1 >>= \tt1 -> infer' c e t2 >>= \tt2 -> 
  case tt2 of
    FunT tn1 (FunT NatT tn2) -> if (tn1 == tt1 && tn2 == tt1) then infer' c e t3 >>= \tt3 -> if tt3 == NatT then ret tt1 else matchError NatT tt3 else matchError (FunT  tt1 (FunT NatT tt1)) (FunT tn1 (FunT NatT tn2))
    x -> matchError (FunT tt1 (FunT NatT tt1)) x
