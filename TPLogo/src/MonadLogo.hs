{-# LANGUAGE FlexibleContexts #-}

module MonadLogo where

import Control.Monad.Except
import Control.Monad.State
import Control.Monad.Writer
import Graphics.Gloss
import GlobalEnv
import System.IO
import Common
import qualified Data.Map as M

class (MonadIO m, MonadState Env m, MonadError String m) => MonadLogo m

nada :: MonadLogo m => m ()
nada = return ()

failLogo :: MonadLogo m => String -> m a
failLogo str = throwError str

printLogo :: MonadLogo m => String -> m ()
printLogo = liftIO . putStrLn

printGraph :: MonadLogo m => m ()
printGraph = do
    Env x y b _ ang pics _ _ (d, c) <- get
    let tortu = getTortu x y ang
        paraPrint = if b then tortu : pics
                         else pics
    liftIO $ display d c (pictures pics)

getData :: MonadLogo m => (Env -> a) -> m a
getData f = get >>= return . f

addPicture :: MonadLogo m => Picture -> m ()
addPicture p = do
    b <- getData pen
    if b then nada
         else modify (\s -> s {pics = p : pics s})

resetPics :: MonadLogo m => m ()
resetPics = modify (\s -> s {pics = []})

setX :: MonadLogo m => Float -> m()
setX n = modify (\s -> s {posx = n})

changeX :: MonadLogo m => (Float -> Float -> Float) -> Float -> m()
changeX f n = getData posx >>= \x -> setX (f x n)

setY :: MonadLogo m => Float -> m()
setY n = modify (\s -> s {posy = n})

changeY :: MonadLogo m => (Float -> Float -> Float) -> Float -> m()
changeY f n = getData posy >>= \y -> setY (f y n)

setAng :: MonadLogo m => Float -> m()
setAng n = modify (\s -> s {dir = n})

grad2radian :: Float -> Float
grad2radian n = n / 180 * pi

radian2grad :: Float -> Float
radian2grad n = n * 180 / pi

repeatUntil :: (a -> Bool) -> (a -> a) -> a -> a
repeatUntil c f x | c x = x
                  | otherwise = repeatUntil c f (f x)

dospi :: Float
dospi = 2 * pi

-- Mantiene el ángulo entre 0 y 2pi
normalize :: Float -> Float
normalize n = if n < 0
                 then repeatUntil (0<=) (+dospi) n
                 else if n > dospi
                         then repeatUntil (dospi>=) (\x -> x - dospi) n
                         else n 


changeAng :: MonadLogo m => (Float -> Float -> Float) -> Float -> m()
changeAng f n = modify (\s -> s {dir = normalize (f (dir s) n)})

showT :: MonadLogo m => m ()
showT = modify (\s -> s {GlobalEnv.show = True})

hideT :: MonadLogo m => m ()
hideT = modify (\s -> s {GlobalEnv.show = False})

penUp :: MonadLogo m => m ()
penUp = modify (\s -> s {pen = True})

penDn :: MonadLogo m => m ()
penDn = modify (\s -> s {pen = False})

newVar :: MonadLogo m => String -> Exp -> m ()
newVar str e = do varr <- getData vars
                  if M.member str varr
                      then failLogo ("Variable: " ++ str ++ ", ya declarada.")
                      else modify (\s -> s {vars = M.insert str e varr})

delVar :: MonadLogo m => String -> m ()
delVar str = do varr <- getData vars
                if M.notMember str varr
                    then failLogo ("Variable: " ++ str ++ ", no está definida, no se puede eliminar.")
                    else modify (\s -> s {vars = M.delete str varr})

getVar :: MonadLogo m => String -> m Exp
getVar str = do varr <- getData vars
                let mv = M.lookup str varr
                case mv of
                    Nothing -> failLogo ("Variable: " ++ str ++ ", no está definida, no se puede acceder.")
                    Just e -> return e

                    
newComm :: MonadLogo m => String -> Comm -> m ()
newComm str c = do comm <- getData comms
                   if M.member str comm
                      then failLogo ("comando: " ++ str ++ ", ya declarado.")
                      else modify (\s -> s {comms = M.insert str c comm})

delComm :: MonadLogo m => String -> m ()
delComm str = do comm <- getData comms
                 if M.notMember str comm
                    then failLogo ("Comando: " ++ str ++ ", no está definido, no se puede eliminar.")
                    else modify (\s -> s {comms = M.delete str comm})

getComm :: MonadLogo m => String -> m Comm
getComm str = do comm <- getData comms
                 let mv = M.lookup str comm
                 case mv of
                      Nothing -> failLogo ("Comando: " ++ str ++ ", no está definido, no se puede acceder.")
                      Just c -> return c