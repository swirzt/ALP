{
module LogoPar where
import Common
import Data.Char
}

%name logo
%tokentype { Token }
%error { parseError }

%token
      fordward          { TokenFod }
      fd                { TokenFd }
      back              { TokenBak }
      bk                { TokenBk }
      right             { TokenRit }
      rt                { TokenRt }
      left              { TokenLet }
      lt                { TokenLt }
      clearscreen       { TokenCls }
      cs                { TokenCs }
      clean             { TokenCln }
      penup             { TokenPup }
      pu                { TokenPu }
      pendown           { TokenPdn }
      pd                { TokenPd }
      hideturtle        { TokenHte }
      ht                { TokenHt }
      showturtle        { TokenSte }
      st                { TokenSt }
      home              { TokenHome }
      setx              { TokenStx }
      sety              { TokenSty }
      setxy             { TokenStxy }
      setheading        { TokenSethead }
      seth              { TokenSeth }
      repeat            { TokenRep }
      print             { TokenPrnt }
      to                { TokenTo }
      end               { TokenEnd }
      setcolor          { TokenSetCo }
      make              { TokenMk }
      for               { TokenFor }
      if                { TokenIf }
      fill              { TokenFill }
      filled            { TokenFilled }
      wait              { TokenWait }
      'do.while'        { TokenWhile }
      
      pos               { TokenPos }
      list              { TokenList }
      
      xcor              { TokenXCor }
      ycor              { TokenYCor }
      heading           { TokenHead }
      towards           { TokenTow }
      ':'               { TokenRef }
      sum               { TokenSum }
      difference        { TokenDiff }
      first             { TokenFst }
      last              { TokenLst }
      item              { TokenItem }
      pick              { TokenPick }
      butfirst          { TokenTail }
      butlast           { TokenRTail }
      readword          { TokenRead }

      var               { TokenVar $$ }
      num               { TokenNum $$ }
      '"'               { TokenStr }
      '('               { TokenPA }
      ')'               { TokenPC }
      '['               { TokenCA }
      ']'               { TokenCC }


      '>'               { TokenMayor }
      '<'               { TokenMenor }
      '='               { TokenIgual }
      '<='              { TokenMaIgual }
      '>='              { TokenMeIgual }
      '!='              { TokenNoIgual }
      '&&'              { TokenY }
      '||'              { TokenO }
      not               { TokenNo }

%left '||'
%left '&&'
%nonassoc not


%%

CommSeq :: { [Comm] }
CommSeq : Comm              { [$1] }
        | Comm CommSeq      { $1 : $2 }

Comm :: { Comm }
Comm : fordward Exp                              { Ford $2 }
     | fd Exp                                    { Ford $2 }
     | back Exp                                  { Back $2 }
     | bk Exp                                    { Back $2 }
     | right Exp                                 { TRight $2 }
     | rt Exp                                    { TRight $2 }
     | left Exp                                  { TLeft $2 }
     | lt Exp                                    { TLeft $2 }
     | clearscreen                               { Clear }
     | cs                                        { Clear }
     | clean                                     { Clean }
     | penup                                     { PUp }
     | pu                                        { PUp }
     | pendown                                   { PDown }
     | pd                                        { PDown }
     | hideturtle                                { HideT }
     | ht                                        { HideT }
     | showturtle                                { ShowT }
     | st                                        { ShowT }
     | home                                      { Home }
     | setx Exp                                  { SetX $2 }
     | sety Exp                                  { SetY $2 }
     | setxy Exp Exp                             { SetXY $2 $3 }
     | setheading Exp                            { SetHead $2 }
     | seth Exp                                  { SetHead $2 }
     | repeat Exp '[' Comm ']'                   { Rep $2 $4 }
     | print Exp                                 { Print $2 }
     | to var Args Comm end                      { Def $2 $3 $4 }
     | setcolor Exp                              { SetCo $2 }
     | make '"' var Exp                          { DefV $3 $4 }
     | for '[' var Exp Exp ']' '[' Comm ']'      { For $3 $4 $5 $8 }
     | for '[' var Exp Exp Exp ']' '[' Comm ']'  { ForDelta $3 $4 $5 $6 $9 }
     | if Bool '[' Comm ']'                      { If $2 $4 }
     | fill                                      { Fill }
     | filled Exp '[' Comm ']'                   { Filled $2 $4 }
     | wait Exp                                  { Wait $2 }
     | 'do.while' '[' Comm ']' Bool              { While $3 $5 }

Exp :: { Exp }
Exp : num                  { Num $1 }
    | xcor                 { XCor }
    | ycor                 { YCor } 
    | heading              { Heading }                       
    | towards List         { Towards $2 }
    | ':' var              { Var $2 }
    | sum Exp Exp          { Sum $2 $3 }
    | difference Exp Exp   { Difference $2 $3 }
    | first List           { First $2 }
    | last List            { Last $2 }
    | item Exp List        { Item $2 $3 }
    | pick List            { RandItem $2 }
    | butfirst List        { Tail $2 }
    | butlast List         { RTail $2 }
    | readword             { Read }
    | '(' Exp ')'          { $2 }
    | List                 { List $1 }

List :: { List }
List : pos          { Pos }
     | list SecExp  { L $2 }
     | '(' List ')' { $2 }

SecExp :: { [Exp] }
SecExp : Exp          { [$1] }
       | Exp SecExp   { $1 : $2 }

Args :: { [String] }
Args : ':' var        { [$2] }
     | ':' var Args   { $2 : $3 }

Bool :: { Boolen }
Bool : Exp '>' Exp     { Gt $1 $3 }
     | Exp '<' Exp     { Lt $1 $3 }
     | Exp '=' Exp     { Eq $1 $3 }
     | Exp '>=' Exp    { GEq $1 $3 }
     | Exp '<=' Exp    { LEq $1 $3 }
     | Exp '!=' Exp    { Diff $1 $3 }
     | Bool '&&' Bool  { And $1 $3 }
     | Bool '||' Bool  { Or $1 $3 }
     | not Bool        { Not $2 }
     | '(' Bool ')'    { $2 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Token = TokenFod
           | TokenFd
           | TokenBak 
           | TokenBk 
           | TokenRit 
           | TokenRt 
           | TokenLet 
           | TokenLt 
           | TokenCls 
           | TokenCs 
           | TokenCln 
           | TokenPup 
           | TokenPu 
           | TokenPdn 
           | TokenPd 
           | TokenHte
           | TokenHt 
           | TokenSte 
           | TokenSt 
           | TokenHome 
           | TokenStx 
           | TokenSty 
           | TokenStxy 
           | TokenSethead 
           | TokenSeth
           | TokenRep 
           | TokenPrnt 
           | TokenTo 
           | TokenEnd 
           | TokenSetCo 
           | TokenMk  
           | TokenFor  
           | TokenIf
           | TokenFill  
           | TokenFilled
           | TokenWait 
           | TokenWhile
           | TokenPos 
           | TokenList
           | TokenXCor 
           | TokenYCor 
           | TokenHead 
           | TokenTow 
           | TokenRef 
           | TokenSum 
           | TokenDiff 
           | TokenFst 
           | TokenLst 
           | TokenItem 
           | TokenPick 
           | TokenTail 
           | TokenRTail
           | TokenRead 
           | TokenVar String
           | TokenNum Float
           | TokenStr 
           | TokenPA 
           | TokenPC 
           | TokenCA 
           | TokenCC 
           | TokenMayor 
           | TokenMenor 
           | TokenIgual 
           | TokenMaIgual
           | TokenMeIgual
           | TokenNoIgual
           | TokenY
           | TokenO
           | TokenNo

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs) 
      | isSpace c = lexer cs
      | isAlpha c = lexVar (c:cs)
      | isDigit c = lexNum (c:cs)
lexer ('"':cs) = TokenStr : lexer cs
lexer (':':cs) = TokenRef : lexer cs
lexer ('>':'=':cs) = TokenMaIgual : lexer cs
lexer ('<':'=':cs) = TokenMeIgual : lexer cs
lexer ('!':'=':cs) = TokenNoIgual : lexer cs
lexer ('>':cs) = TokenMayor : lexer cs
lexer ('<':cs) = TokenMenor : lexer cs
lexer ('=':cs) = TokenIgual : lexer cs
lexer ('(':cs) = TokenPA : lexer cs
lexer (')':cs) = TokenPC : lexer cs
lexer ('[':cs) = TokenCA : lexer cs
lexer (']':cs) = TokenCC : lexer cs

lexNum cs = TokenNum (read num) : lexer rest
      where (num,rest) = span (\d -> isDigit d || d == '.') cs

lexVar cs =
  case span isAlpha cs of
      ("fordward",rest) -> TokenFod : lexer rest
      ("fd",rest) -> TokenFd : lexer rest
      ("back",rest) -> TokenBak : lexer rest
      ("bk",rest) -> TokenBk : lexer rest
      ("right",rest) -> TokenRit : lexer rest
      ("rt",rest) -> TokenRt : lexer rest
      ("left",rest) -> TokenLet : lexer rest
      ("lt",rest) -> TokenLt : lexer rest
      ("clearscreen",rest) -> TokenCls : lexer rest
      ("cs",rest) -> TokenCs : lexer rest
      ("clean",rest) -> TokenCln : lexer rest
      ("penup",rest) -> TokenPup : lexer rest
      ("pu",rest) -> TokenPu : lexer rest
      ("pendown",rest) -> TokenPdn : lexer rest
      ("pd",rest) -> TokenPd : lexer rest
      ("hideturtle",rest) -> TokenHte : lexer rest
      ("ht",rest) -> TokenHt : lexer rest
      ("showturtle",rest) -> TokenSte : lexer rest
      ("st",rest) -> TokenSt : lexer rest
      ("home",rest) -> TokenHome : lexer rest
      ("setx",rest) -> TokenStx : lexer rest
      ("sety",rest) -> TokenSty : lexer rest
      ("setxy",rest) -> TokenStxy : lexer rest
      ("setheading",rest) -> TokenSethead : lexer rest
      ("seth",rest) -> TokenSeth : lexer rest
      ("repeat",rest) -> TokenRep : lexer rest
      ("print",rest) -> TokenPrnt : lexer rest
      ("to",rest) -> TokenTo : lexer rest
      ("end",rest) -> TokenEnd : lexer rest
      ("setcolor",rest) -> TokenSetCo : lexer rest
      ("make",rest) -> TokenMk : lexer rest
      ("for",rest) -> TokenFor : lexer rest
      ("if",rest) -> TokenIf : lexer rest
      ("fill",rest) -> TokenFill : lexer rest
      ("filled",rest) -> TokenFilled : lexer rest
      ("wait",rest) -> TokenWait : lexer rest
      ("do.while",rest) -> TokenWhile : lexer rest
      ("pos",rest) -> TokenPos : lexer rest
      ("list",rest) -> TokenList : lexer rest
      ("xcor",rest) -> TokenXCor : lexer rest
      ("ycor",rest) -> TokenYCor : lexer rest
      ("heading",rest) -> TokenHead : lexer rest
      ("towards",rest) -> TokenTow : lexer rest
      ("sum",rest) -> TokenSum : lexer rest
      ("difference",rest) -> TokenDiff : lexer rest
      ("first",rest) -> TokenFst : lexer rest
      ("last",rest) -> TokenLst : lexer rest
      ("item",rest) -> TokenItem : lexer rest
      ("pick",rest) -> TokenPick : lexer rest
      ("butfirst",rest) -> TokenTail : lexer rest
      ("butlast",rest) -> TokenRTail : lexer rest
      ("readword",rest) -> TokenRead : lexer rest
      ("not",rest) -> TokenNo : lexer rest
      (var,rest)   -> TokenVar var : lexer rest


}