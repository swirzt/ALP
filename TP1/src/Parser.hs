module Parser where

import           Text.ParserCombinators.Parsec
import           Text.Parsec.Token
import           Text.Parsec.Language           ( emptyDef )
import           AST

-----------------------
-- Funcion para facilitar el testing del parser.
totParser :: Parser a -> Parser a
totParser p = do
  whiteSpace lis
  t <- p
  eof
  return t

-- Analizador de Tokens
lis :: TokenParser u
lis = makeTokenParser
  (emptyDef
    { commentStart    = "/*"
    , commentEnd      = "*/"
    , commentLine     = "//"
    , opLetter        = char '='
    , reservedNames   = ["true", "false", "if", "else", "while", "skip"]
    , reservedOpNames = [ "+"
                        , "-"
                        , "*"
                        , "/"
                        , "<"
                        , ">"
                        , "&&"
                        , "||"
                        , "!"
                        , "="
                        , "=="
                        , "!="
                        , ";"
                        , ","
                        ]
    }
  )

(<#>) :: Parser a -> Parser a -> Parser a
x <#> y = (try x) <|> y
----------------------------------
--- Parser de expressiones enteras
-----------------------------------
intexp :: Parser (Exp Int)
intexp = chainl1 intop (reservedOp lis "," >> return ESeq)

intop :: Parser (Exp Int)
intop = do s <- identifier lis
           reservedOp lis "="
           s' <- intop
           return (EAssgn s s')
        <#> chainl1 intterm sepsum

sepsum :: Parser (Exp Int -> Exp Int -> Exp Int)
sepsum = do reservedOp lis "+"
            return Plus
         <#> do reservedOp lis "-"
                return Minus

intterm :: Parser (Exp Int)
intterm = chainl1 intval septerm

septerm :: Parser (Exp Int -> Exp Int -> Exp Int)
septerm = do reservedOp lis "*"
             return Times
          <#> do reservedOp lis "/"
                 return Div

intval :: Parser (Exp Int)
intval = parens lis intexp
         <#>
         do reservedOp lis "-"
            n <- intval
            return (UMinus n) 
            <#> do m <- natural lis
                   return (Const (fromIntegral m))      
            <#> do i <- identifier lis
                   return (Var i) 
-----------------------------------
--- Parser de expressiones booleanas
------------------------------------

boolexp :: Parser (Exp Bool)
boolexp = chainl1 booland (reservedOp lis "||" >> return (Or))

booland :: Parser (Exp Bool)
booland = chainl1 boolval (reservedOp lis "&&" >> return (And))

boolval :: Parser (Exp Bool)
boolval = parens lis boolexp
          <#>
          do reservedOp lis "!"
             r <- boolval
             return (Not r)
          <#>
          (reserved lis "true" >> return (BTrue))
          <#>
          (reserved lis "false" >> return (BFalse))
          <#>
          do n1 <- intexp
             f <- (
                (reservedOp lis "==" >> return Eq)
                <#>
                (reservedOp lis "!=" >> return NEq)
                <#>
                (reservedOp lis "<" >> return Lt)
                <#>
                (reservedOp lis ">" >> return Gt))
             n2 <- intexp
             return (f n1 n2)

-----------------------------------
--- Parser de comandos
-----------------------------------

comm :: Parser Comm
comm = chainl1 commeq (reservedOp lis ";" >> return Seq)

commeq :: Parser Comm
commeq = (reserved lis "skip" >> return Skip)
         <#>
         (do var <- identifier lis 
             reservedOp lis "="
             n <- intexp
             return (Let var n))
         <#>
         (do reserved lis "if"
             b <- boolexp
             c <- braces lis comm
             do reserved lis "else"
                c' <- braces lis comm
                return (IfThenElse b c c')
                <#>
                return (IfThen b c))
         <#>
         (do reserved lis "while"
             b <- boolexp
             c <- braces lis comm
             return (While b c))
------------------------------------
-- Función de parseo
------------------------------------
parseComm :: SourceName -> String -> Either ParseError Comm
parseComm = parse (totParser comm)
