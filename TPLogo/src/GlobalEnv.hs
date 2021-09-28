module GlobalEnv where

import Common
import Data.Map (Map, empty)
import Graphics.Gloss
import Numeric.Natural (Natural)

data Env = Env
  { posx :: Int, -- Representa la posición x de la tortuga
    posy :: Int, -- Representa la posición y de la tortuga
    dir :: Natural, -- Representa la dirección a donde mira la tortuga, representa los grados entre 0 y 360
    marco :: [Picture], -- Lista de los comandos ya evaluados para graficar
    vars :: Map String Exp -- Almacena las definiciones de Variables en el entorno
  }

defaultEnv :: Env
defaultEnv = Env 0 0 0 [] empty