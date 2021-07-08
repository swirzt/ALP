module Main where

import Lib
import LogoPar
import System.Environment --getArgs
import Graphics.Gloss -- GUI
import Text.Read -- readMaybe

data State = S Display Color [Picture] Int Int Float 

defaultHW :: Int
defaultHW = 300

makeWindow :: Int -> Int -> Display
makeWindow h w = InWindow "LOGO" (h,w) (0,0)

main :: IO ()
main = do
        args <- getArgs
        case args of
            []  -> loop $ makeWindow defaultHW defaultHW
            [h,w] -> case readMaybe h >>= \hi -> readMaybe w >>= \wi -> return $ makeWindow hi wi of
                        Just c -> loop c
                        _ -> putStrLn "Uno o ambos argumentos son inválidos"
            _ -> putStrLn "Numero incorrecto de argumentos [0 o 2]"

loop :: Display -> IO ()
--loop screen = do display screen 
loop d = display d white $ pictures [circle 80,circle 150]