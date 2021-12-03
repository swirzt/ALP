module Main where

--getArgs
import MonadLogo
import Graphics.Gloss -- GUI
import Lib
import LogoPar
import Control.Monad
import Control.Monad.IO.Class

import Control.Monad.Catch(MonadMask)
import System.Environment
import Text.Read -- readMaybe
import System.Console.Haskeline (InputT, defaultSettings, getInputLine, runInputT)
import Common
import Eval

defaultHW :: Int
defaultHW = 300

makeWindow :: Int -> Int -> Display
makeWindow h w = InWindow "LOGO" (h, w) (0, 0)

defaultWindow :: Display
defaultWindow = makeWindow defaultHW defaultHW

run :: Display -> IO ()
run d = runLogo d white (runInputT defaultSettings (repl)) >> return ()

main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> run defaultWindow
    (h : w : args) -> case readMaybe h >>= \hi -> readMaybe w >>= \wi -> return $ makeWindow hi wi of
      Just d -> run d
      Nothing -> do
        putStrLn "Uno o ambos argumentos son inválidos\nUtilizando las medidas default"
        run defaultWindow
    _ -> putStrLn "Numero incorrecto de argumentos"

inp :: String
inp = ">> "

repl :: (MonadLogo m, MonadMask m) => InputT m ()
repl = do
  minput <- getInputLine inp
  case minput of
    Nothing -> return ()
    Just "" -> repl
    Just x -> do let cms = parser x
                 liftIO $ putStrLn $ show cms
                --  printLogo $ show cms
                 repl
      -- lift $ lift $ catchErrors $ evalinteractivo $ parser x
              -- >> repl


evalinteractivo :: MonadLogo m => [Comm] -> m ()
evalinteractivo [] = printGraph >> return ()
evalinteractivo (x:xs) = printGraph >> eval x >> evalinteractivo xs
