module Untyped where

import           Control.Monad
import           Data.List
import           Data.Maybe

import           Common

----------------------------------------------
-- Seccón 2  
-- Ejercicio 2: Conversión a términos localmente sin nombres
----------------------------------------------
conversion :: LamTerm -> Term
conversion x = conversion' x 0 []

conversion' :: LamTerm -> Int -> [(String,Int)] -> Term
conversion' (LVar s) n e = case busca s e of
                            Nothing -> Free (Global s)
                            Just d -> Bound (n - d - 1) -- Acordarse porqué resto 1
conversion' (App x y) n e = conversion' x n e :@: conversion' y n e
conversion' (Abs s l) n e = Lam (conversion' l (n+1) (liga e s n))

liga :: [(String,Int)] -> String -> Int -> [(String,Int)]
liga [] s n = [(s,n)]
liga ((ss,x):xs) s n = if ss == s then (ss,n):xs else (ss,x) : liga xs s n 

busca :: String -> [(String,Int)] -> Maybe Int
busca s [] = Nothing
busca s ((ss,x):xs) = if s == ss then Just x else busca s xs
-------------------------------
-- Sección 3
-------------------------------

vapp :: Value -> Value -> Value
vapp (VLam x) z = x z
vapp (VNeutral x) z = VNeutral (NApp x z)

eval :: NameEnv Value -> Term -> Value
eval e t = eval' t (e, [])

eval' :: Term -> (NameEnv Value, [Value]) -> Value
eval' (Bound ii) (_, lEnv) = lEnv !! ii
eval' (Free n) (gEnv,_) = case getGlobal n gEnv of
                                Nothing -> error "no se"          
                                Just k -> k
eval' (t :@: t') e = vapp (eval' t e) (eval' t' e)
eval' (Lam t) (g,l) = VLam (\x-> (eval' t (g,x:l)))

getGlobal :: Name -> NameEnv v -> Maybe v
getGlobal s [] = Nothing
getGlobal s ((n,k):xs) = if s == n then Just k else getGlobal s xs 

--------------------------------
-- Sección 4 - Mostrando Valores
--------------------------------

quote :: Value -> Term
quote = quote' 0

quote' :: Int -> Value -> Term
quote' n (VLam f) = case f (VNeutral (NFree (Quote n))) of
                            VNeutral (NFree (Quote k)) -> Bound (n-k-1)
                            x -> quote' (n+1) x
quote' n (VNeutral x) = nquote x

nquote :: Neutral -> Term
nquote (NFree name) = Free name
nquote (NApp neutral value) = nquote neutral :@: quote value