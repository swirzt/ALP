tablero :: [Int]
tablero = [5,4,3,2,1]

main :: IO ()
main = juego tablero True

juego :: [Int] -> Bool -> IO ()
juego t b = do imprimeTablero 1 t
               imprimeTurno b
               putStrLn "Ingrese una jugada l - c"
               i <- getLine
               bt <- jugar t i
               if fst bt then if revisaTablero (snd bt) then imprimeGanador b
                                                        else juego (snd bt) (not b)
                         else do putStrLn "Juagada incorrecta, vuelva a intentar"
                                 juego t b
               
mulChar :: Char -> Int -> String
mulChar c 0 = []
mulChar c n = c : mulChar c (n - 1)

imprimeTablero :: Int -> [Int] -> IO ()
imprimeTablero fn [] = return ()
imprimeTablero fn (x:xs) = do putStrLn (show fn ++ " : " ++ mulChar '*' x)
                              imprimeTablero (fn + 1) xs

imprimeTurno :: Bool -> IO ()
imprimeTurno True = putStrLn "Es el turno del jugador 1"
imprimeTurno False = putStrLn "Es el turno del jugador 2"

imprimeGanador :: Bool -> IO ()
imprimeGanador True = putStrLn "Gana el jugador 1"
imprimeGanador False = putStrLn "Gana el jugador 2"

splitt :: String -> Char -> (String,String)
splitt [] c = ([],[])
splitt (' ':xs) c = splitt xs c
splitt (x:xs) c = if x == c then ([],xs)
                            else let (y,z) = splitt xs c in (x:y,z)

replaceN :: [Int] -> Int -> Int -> [Int]
replaceN t 0 v = v : tail t
replaceN t n v = head t : replaceN (tail t) (n - 1) v

jugar :: [Int] -> String -> IO (Bool,[Int])
jugar t xs = let (fs,cs) = splitt xs '-'
                 f = read fs - 1
                 c = read cs
                 cb = t !! f - c
                 in if cb < 0 then return (False,t)
                              else return (True,replaceN t f cb)

revisaTablero :: [Int] -> Bool
revisaTablero = foldr (\x->(&&) (x==0)) True
-- revisaTablero [] = True
-- revisaTablero (x:xs) = x == 0 && revisaTablero xs