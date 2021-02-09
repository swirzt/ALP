module Common where

    data List = Pos | L [Exp] deriving Show

    data Exp = Num Float
             | XCor | YCor
             | Heading
             | Towards List
             | Var String
             | Sum Exp Exp
             | Difference Exp Exp
             | First List
             | Last List
             | Item Exp List
             | RandItem List
             | Tail List
             | RTail List
             | Read
             | List List
        deriving Show

    data Boolen = Gt Exp Exp
                | Lt Exp Exp
                | Eq Exp Exp
                | GEq Exp Exp
                | LEq Exp Exp
                | Diff Exp Exp
                | And Boolen Boolen
                | Or Boolen Boolen
                | Not Boolen
        deriving Show

    data Comm = Ford Exp
              | Back Exp
              | TRight Exp
              | TLeft Exp
              | Clear | Clean
              | PUp | PDown
              | HideT | ShowT
              | Home
              | SetX Exp | SetY Exp
              | SetXY Exp Exp
              | SetHead Exp
              | Rep Exp Comm
              | Print Exp
              | Def String [String] Comm
              | SetCo Exp
              | DefV String Exp
              | ForDelta String Exp Exp Exp Comm
              | For String Exp Exp Comm
              | If Boolen Comm
              | Fill
              | Filled Exp Comm
              | Wait Exp
              | While Comm Boolen
        deriving Show