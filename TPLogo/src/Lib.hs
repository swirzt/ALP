module Lib
    ( someFunc
    , parser
    ) where

import Graphics.Gloss
import LogoPar
import Common

parser :: String -> [Comm]
parser = logo . lexer

someFunc :: IO ()
someFunc = undefined