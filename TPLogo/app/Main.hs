module Main where

--getArgs
import Graphics.Gloss -- GUI
import Lib
import LogoPar
import System.Environment
import Text.Read -- readMaybe

data State = S Display Color [Picture] Int Int Float

defaultHW :: Int
defaultHW = 300

makeWindow :: Int -> Int -> Display
makeWindow h w = InWindow "LOGO" (h, w) (0, 0)

defaultWindow :: Display
defaultWindow = makeWindow defaultHW defaultHW

main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> loop defaultWindow
    (h : w : args) -> case readMaybe h >>= \hi -> readMaybe w >>= \wi -> return $ makeWindow hi wi of
      Just d -> loop d
      Nothing -> do
        putStrLn "Uno o ambos argumentos son inválidos\nUtilizando las medidas default"
        loop defaultWindow
    _ -> putStrLn "Numero incorrecto de argumentos"

inp :: String
inp = ">> "

loop :: Display -> IO ()
loop d = display d white Blank

-- loop :: MonadLogo m => Display -> InputT m ()
-- --loop screen = do display screen
-- -- loop d = display d white $ pictures [circle 80,circle 150]
-- loop d = do
--   input <- getInputLine inp
--   case input of
--     Nothing -> return ()
--     Just "" -> loop d
--     Just x -> do c <- liftIO $ parser x