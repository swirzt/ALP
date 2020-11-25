import System.Environment
import System.IO
import Data.Char

main :: IO ()
main = getArgs >>= programa

programa :: [String] -> IO ()
programa [e,s] = do entrada <- openFile e ReadMode
                    contenido <- hGetContents entrada
                    let mayus = map toUpper contenido
                    salida <- openFile s WriteMode
                    hPutStr salida mayus
                    hClose entrada
                    hClose salida
programa xs = do putStrLn "Argumentos inválidos"
                 return ()