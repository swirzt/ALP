secret :: Int
secret = 42

main :: IO ()
main = do
  putStrLn "Ingerese un número"
  xs <- getLine
  let x = read xs
  if secret == x
    then putStrLn "Adivinaste!"
    else
      if x < secret
        then do
          putStrLn "El número secreto es mayor"
          main
        else do
          putStrLn "El número secreto es menor"
          main