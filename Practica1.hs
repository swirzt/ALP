import Control.Applicative hiding (many)
import Control.Monad
import Data.Char
import Parsing

-- 2)
expr :: Parser Int
expr = do
  t <- term
  do
    char '+'
    e <- expr
    return (t + e)
    <|> do
      char '-'
      e <- expr
      return (t - e)
    <|> return t

term :: Parser Int
term = do
  f <- factor
  do
    char '*'
    t <- term
    return (f * t)
    <|> do
      char '/'
      t <- term
      return (div f t)
    <|> return f

factor :: Parser Int
factor =
  do
    d <- digit
    return (digitToInt d)
    <|> do
      char '('
      e <- expr
      char ')'
      return e

eval :: String -> Int
eval xs = fst (head (parse expr xs))

--3)
transformador :: Parser a -> Parser a
transformador p =
  ( do
      char '('
      r <- p
      char ')'
      return r
  )
    <|> p

--4)
data Expr = Num Int | BinOp Op Expr Expr deriving (Show)

data Op = Add | Mul | Min | Div deriving (Show)

exprT :: Parser Expr
exprT = do
  t <- termT
  do
    char '+'
    e <- exprT
    return (BinOp Add t e)
    <|> do
      char '-'
      e <- exprT
      return (BinOp Min t e)
    <|> return t

termT :: Parser Expr
termT = do
  f <- factorT
  do
    char '*'
    t <- termT
    return (BinOp Mul f t)
    <|> do
      char '/'
      t <- termT
      return (BinOp Div f t)
    <|> return f

factorT :: Parser Expr
factorT =
  do
    d <- digit
    return (Num (digitToInt d))
    <|> do
      char '('
      e <- exprT
      char ')'
      return e

evalT :: String -> Expr
evalT xs = fst (head (parse exprT xs))

--5)
type Heterogeneo = Either Int Char

listar :: Parser [Heterogeneo]
listar = do
  char '['
  i <- sepBy inside (char ',')
  char ']'
  return i

inside :: Parser Heterogeneo
inside =
  do
    n <- nat
    return (Left n)
    <|> do
      char '\''
      c <- letter
      char '\''
      return (Right c)

toList :: String -> [Heterogeneo]
toList xs = fst (head (parse listar xs))

--6)
data Basetype = DInt | DChar | DFloat deriving (Show)

type Hasktype = [Basetype]

hask :: Parser Hasktype
hask = sepBy base (symbol "->")

base :: Parser Basetype
base = (string "Int" >> return DInt) <|> (string "Char" >> return DChar) <|> (string "Float" >> return DFloat)

toHaskType :: String -> Hasktype
toHaskType xs = fst (head (parse hask xs))

--7)
data Haskelltype = HInt | HChar | Fun Haskelltype Haskelltype deriving (Show)

tipoH :: Parser Haskelltype
tipoH =
  (string "Int" >> return HInt)
    <|> (string "Char" >> return HChar)

baseH :: Parser Haskelltype
baseH = do
  i <- tipoH
  do
    symbol "->"
    k <- baseH
    return (Fun i k)
    <|> return i

toHaskell :: String -> Haskelltype
toHaskell xs = fst (head (parse baseH xs))

--8)
{-
expr -> term expr'
expr' -> E | '+' term expr' | '-' term expr'

term -> factor term'
term' -> E | '*' factor term' | '/' factor term

factor -> digit | '(' expr ')'

digit -> '0' | '1' | '2' | ... | '9'
-}

exprN :: Parser Int
exprN = do
  t <- termN
  exprN' t

exprN' :: Int -> Parser Int
exprN' x =
  do
    symbol "+"
    t <- termN
    exprN' (x + t)
    <|> do
      symbol "-"
      t <- termN
      exprN' (x - t)
    <|> return x

termN :: Parser Int
termN = do
  f <- factorN
  termN' f

termN' :: Int -> Parser Int
termN' x =
  do
    symbol "*"
    f <- factorN
    termN' (x * f)
    <|> do
      symbol "/"
      f <- factorN
      termN' (div x f)
    <|> return x

factorN :: Parser Int
factorN =
  do
    d <- digit
    return (digitToInt d)
    <|> do
      char '('
      e <- expr
      char ')'
      return e

evalN :: String -> Int
evalN xs = fst (head (parse exprN xs))

--9)
data Tipo = TInt | TChar | TFloat deriving (Show)

data Declaration = Dec Tipo Valores deriving (Show)

data Valores = Array Valores Int | Pointer Valores | Ident String deriving (Show)

{-
Buscamos solucionar la recursión a izquierda en direct_declarator
redefino direct_declarator

direct_declarator -> (direct_declarator) dd' | identifier dd'
dd' -> E | [constant_Expression]dd'
-}

type_specifier :: Parser Tipo
type_specifier =
  (string "int" >> return TInt)
    <|> (string "char" >> return TChar)
    <|> (string "float" >> return TFloat)

array :: Valores -> Parser Valores
array x =
  do
    symbol "["
    n <- nat
    symbol "]"
    array (Array x n)
    <|> return x

direct_declarator :: Parser Valores
direct_declarator =
  do
    symbol "("
    dd <- declarator --direct_declarator es el correcto pero me gusta más asi
    symbol ")"
    array dd
    <|> do
      nn <- token (many alphanum)
      array (Ident nn)

declarator :: Parser Valores
declarator =
  do
    symbol "*"
    v <- declarator
    return (Pointer v)
    <|> direct_declarator

declaration :: Parser Declaration
declaration = do
  t <- type_specifier
  p <- declarator
  symbol ";"
  return (Dec t p)

leec :: String -> Declaration
leec xs = fst (head (parse declaration xs))