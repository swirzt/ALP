{-# LANGUAGE GADTs #-}

module Common where

import Graphics.Gloss

data List = Pos | L [Either List Exp]
 
data Exp where
  Num :: Float -> Exp
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

data Boolen
  = Gt Exp Exp
  | Lt Exp Exp
  | Eq Exp Exp
  | GEq Exp Exp
  | LEq Exp Exp
  | Diff Exp Exp
  | And Boolen Boolen
  | Or Boolen Boolen
  | Not Boolen

data Comm
  = Ford Exp
  | Back Exp
  | TRight Exp
  | TLeft Exp
  | Clear
  | Clean
  | PUp
  | PDown
  | HideT
  | ShowT
  | Home
  | SetX Exp
  | SetY Exp
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

rect :: Float -> Float -> Picture
rect x y = polygon $ rectanglePath x y

-- Esta tortuga mira por defecto para la derecha ya que es lo que le corresponde al angulo 0
tortuga :: Picture
tortuga =
  color green $
    pictures
      [ rect 40 30, -- cuerpo tortuga
        translate 24 0 $ rect 8 7, -- cabeza
        translate 15 18 $ rect 6 6, -- pata delantera derecha
        translate (-15) 18 $ rect 6 6, -- pata delantera izquierda
        translate 15 (-18) $ rect 6 6, -- pata trasera derecha
        translate (-15) (-18) $ rect 6 6 -- pata trasera izquierda
      ]

getTortu :: Float -> Float -> Float -> Picture
getTortu x y n = translate x y $ rotate n tortuga
