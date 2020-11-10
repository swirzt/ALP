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
  [ parensIf (isLam i || isLet i || isR i || isFst i || isSnd i) (pp ii vs i)
  , nest 1 (parensIf (isLam c || isApp c || isLet c || isAs c || isR c || isFst i || isSnd i) (pp ii vs c))
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
    <> text ","
    <> pp ii vs u
    <> text " )"

pp ii vs (Fst t) =
  text "fst "
    <> parensIf (notValue t) (pp ii vs t)
    
pp ii vs (Snd t) = 
  text "snd "
    <> parensIf (notValue t) (pp ii vs t)

pp ii vs Zero = text "0"

pp ii vs (Suc n) =
  text "suc "
    <> parensIf (notValue n) (pp ii vs n)

pp ii vs (Rec t1 t2 t3) = sep [text "R", parensIf (notValue t1) (pp ii vs t1), parensIf (notValue t2) (pp ii vs t2), parensIf (notValue t3) (pp ii vs t3)]


isZero :: Term -> Bool
isZero Zero = True
isZero _ = False

isVar :: Term -> Bool
isVar (Bound _) = True
isVar (Free _)  = True
isVar _         = False

notValue :: Term -> Bool
notValue x = not (isUnit x || isVar x || isZero x)

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
isUnit _    = False

isFst :: Term -> Bool
isFst (Fst _) = True
isFst _       = False

isSnd :: Term -> Bool
isSnd (Snd _) = True
isSnd _       = False

isPair :: Term -> Bool
isPair (Pair _ _) = True
isPair _          = False

isR :: Term -> Bool
isR (Rec _ _ _) = True
isR _ = False

-- pretty-printer de tipos
printType :: Type -> Doc
printType EmptyT = text "E"
printType (FunT t1 t2) =
  sep [parensIf (isFun t1) (printType t1), text "->", printType t2]
printType UnitT = text "Unit"
printType (PairT a b) = sep [text "(", printType a,text ",", printType b, text ")"]
printType NatT = text "Nat"


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
fv (Fst t           ) = fv t
fv (Snd t           ) = fv t
fv (Pair t u        ) = fv u ++ fv t
fv Zero               = []
fv (Suc n          ) = fv n
fv (Rec t1 t2 t3      ) = fv t1 ++ fv t2 ++ fv t3
---
printTerm :: Term -> Doc
printTerm t = pp 0 (filter (\v -> not $ elem v (fv t)) vars) t

