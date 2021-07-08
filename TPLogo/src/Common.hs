{-# LANGUAGE GADTs #-}
module Common where

    data List = Pos | L [Either Exp List]

    data Exp where
        Num ::  Num n => n -> Exp
        XCor :: Exp
        YCor :: Exp
        Heading :: Exp
        Towards :: List -> Exp
        Var :: String -> Exp
        Sum :: Exp -> Exp -> Exp
        Difference :: Exp -> Exp -> Exp
        Multiply :: Exp -> Exp -> Exp
        Divide :: Exp -> Exp -> Exp
        First :: List -> Exp
        Last :: List -> Exp
        Item :: Exp -> List -> Exp
        RandItem :: List -> Exp
        Tail :: List -> Exp
        RTail :: List -> Exp
        Read :: Exp
    
    data Boolen = Gt Exp Exp
                | Lt Exp Exp
                | Eq Exp Exp
                | GEq Exp Exp
                | LEq Exp Exp
                | Diff Exp Exp
                | And Boolen Boolen
                | Or Boolen Boolen
                | Not Boolen

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