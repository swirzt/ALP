import qualified Data.Set as Set
import Parsing
import Data.Char
import Control.Monad
import Control.Applicative hiding (many)

type Variable = Char
data Lambda = Var Variable | App Lambda Lambda | Abs Variable Lambda 
            | Reem Lambda Lambda Variable deriving Show
data Op = Beta | Sust

fv :: Lambda -> Set.Set Variable
fv (Var s) = Set.singleton s
fv (App t1 t2) = let s1 = fv t1
                     s2 = fv t2
                 in Set.union s1 s2
fv (Abs s t1) = let s1 = fv t1
                in Set.delete s s1

abecedario = "zyxwvutsrqponmlkjihgfedcba"

varselect :: Set.Set Variable -> Maybe Variable
varselect = varselect' abecedario

varselect' :: String -> Set.Set Variable -> Maybe Variable
varselect' [] _ = Nothing
varselect' (x:xs) s = if Set.notMember x s then Just x else varselect' xs s


subs :: Lambda -> Lambda -> Variable -> Lambda
subs a@(Var y) p x | y == x = p
                   |otherwise = a
subs (App p q) n x = App (subs p n x) (subs q n x)
subs a@(Abs y p) n x | y == x = a
                     | otherwise =
                       let fvp = fv p
                           fvn = fv n
                           fvpn = Set.union fvp fvn
                       in if Set.member y fvn
                          then case varselect fvpn of
                                 Nothing -> error "Me quedé sin variables"
                                 Just z -> subs (Abs z (subs p (Var z) y)) n x
                          else Abs y (subs p n x)

alpha :: Lambda -> Variable -> Lambda
alpha (Abs y p) x = Abs x (subs p (Var x) y)
alpha x _ = x

beta :: Lambda -> Lambda
beta (App p q) = case p of
                   (Abs y t) -> beta (subs t q y)
                   (App _ _) -> let bp = beta p in case bp of
                                                     (Abs y p') -> beta (subs p' q y)
                                                     _ -> App bp (beta q)
                   _ -> App p (beta q)
beta (Reem p q x) = beta (subs p q x)
beta (Abs y p) = Abs y (beta p)
beta x = x

parseLambda :: Parser Lambda
parseLambda = do symbol "("
                 l <- parseLambda
                 do symbol ")"
                    return l
                    <|>
                    do l2 <- parseLambda
                       symbol ")"
                       return (App l l2)
              <|> 
              do symbol "$"
                 v <- token letter
                 symbol "."
                 t <- parseLambda' Nothing
                 return (Abs v t)
              <|>
              do v <- token letter
                 return (Var v)


parseLambda' :: Maybe Lambda -> Parser Lambda
parseLambda' Nothing = do t1 <- parseLambda
                          parseLambda' (Just t1)
parseLambda' (Just t) = do t1 <- parseLambda
                           parseLambda' (Just (App t t1))
                           <|>
                           return t

parseReem :: Parser Lambda
parseReem = do l <- parseLambda' Nothing
               symbol "["
               i <- parseLambda' Nothing
               symbol "/"
               v <- token letter
               symbol "]"
               return (Reem l i v)
               <|> parseLambda' Nothing

imprime :: Lambda -> String
imprime (Var c) = [c]
imprime (App v t) = "(" ++ imprime v ++ " " ++ imprime t ++ ")"
imprime (Abs v p) = "($" ++ v:[] ++ ". " ++ imprime p ++ ")"
imprime (Reem p q x) = imprime p ++ "[" ++ imprime q ++ "/" ++ x:[] ++ "]"

eval :: Op -> Lambda -> Lambda
eval Beta xs = beta xs
eval Sust (Reem p q x) = subs p q x

betaEval :: String -> String
betaEval xs = imprime $ eval Beta $ fst $ head $ parse parseReem xs

muestraLibres :: String -> Set.Set Variable
muestraLibres xs = fv $ fst $ head $ parse parseReem xs

sustitucion :: String -> String
sustitucion xs = imprime $ eval Sust $ fst $ head $ parse parseReem xs