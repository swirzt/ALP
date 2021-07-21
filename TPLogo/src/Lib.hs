module Lib
  ( someFunc,
    parser,
  )
where

import Common
import Graphics.Gloss
import LogoPar

parser :: String -> [Comm]
parser = logo . lexer

someFunc :: IO ()
someFunc = undefined