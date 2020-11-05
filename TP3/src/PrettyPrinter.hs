module PrettyPrinter
  ( printTerm
  ,     -- pretty printer para terminos
    printType     -- pretty printer para tipos
  )
where

import           Common
import           Text.PrettyPrint.HughesPJ
import           Prelude                 hiding ( (<>) )
-- lista de posibles nombres para variables
vars :: [String]
vars =
  [ c : n
  | n <- "" : map show [(1 :: Integer) ..]
  , c <- ['x', 'y', 'z'] ++ ['a' .. 'w']
  ]

parensIf :: Bool -> Doc -> Doc
parensIf True  = parens
parensIf False = id

-- pretty-printer de términos

pp :: Int -> [String] -> Term -> Doc
pp ii vs (Bound k         ) = text (vs !! (ii - k - 1))
pp _  _  (Free  (Global s)) = text s

pp ii vs (i :@: c         ) = sep
  [ parensIf (isLam i) (pp ii vs i)
  , nest 1 (parensIf (isLam c || isApp c) (pp ii vs c))
  ]

pp ii vs (Lam t c) =
  text "\\"
    <> text (vs !! ii)
    <> text ":"
    <> printType t
    <> text ". "
    <> pp (ii + 1) vs c
 
pp ii vs (Let t u) =
  text "let "
    <> text (vs !! ii)
    <> text " = "
    <> pp ii vs t
    <> text " in "
    <> pp (ii+1) vs u

pp ii vs (As t u) = 
  pp ii vs t
    <> text " as "
    <> printType u

pp ii vs Unit = text "unit"

pp ii vs (Pair t u) =
  text "( "
    <> pp ii vs t
    <> text " , "
    <> pp ii vs u
    <> text " )"

isLam :: Term -> Bool
isLam (Lam _ _) = True
isLam _         = False

isApp :: Term -> Bool
isApp (_ :@: _) = True
isApp _         = False

isLet :: Term -> Bool
isLet (Let _ _) = True
isLet _         = False

isAs :: Term -> Bool
isAs (As _ _) = True
isAs _        = False 

isUnit :: Term -> Bool
isUnit Unit = True
inUnit _    = False

isFst :: Term -> Bool
isFst (Fst _) = True
isFst _       = False

isSnd :: Term -> Bool
isSnd (Snd _) = True
isSnd _       = False

isPair :: Term -> Bool
isPair (Pair _ _) = True
isPair _          = False

-- pretty-printer de tipos
printType :: Type -> Doc
printType EmptyT = text "E"
printType (FunT t1 t2) =
  sep [parensIf (isFun t1) (printType t1), text "->", printType t2]
printType UnitT = text "Unit"
printType (PairT a b) = sep ["(", printType a, ",", printType b, ")"]


isFun :: Type -> Bool
isFun (FunT _ _) = True
isFun _          = False

fv :: Term -> [String]
fv (Bound _         ) = []
fv (Free  (Global n)) = [n]
fv (t   :@: u       ) = fv t ++ fv u
fv (Lam _   u       ) = fv u
fv (Let t   u       ) = fv t ++ fv u
fv (As  t   u       ) = fv t
fv Unit               = []
fv (Fst (Pair t u)  ) = fv t
fv (Snd (Pair t u)  ) = fv u
fv (Pair t u        ) = fv u ++ fv t
---
printTerm :: Term -> Doc
printTerm t = pp 0 (filter (\v -> not $ elem v (fv t)) vars) t

