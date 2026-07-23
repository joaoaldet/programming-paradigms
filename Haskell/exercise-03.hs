data Banda = Banda String String Double

data Status = Ativo | Encerrado | Cancelado deriving (Eq)

data Evento = Evento [Banda] Status

custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento _ Cancelado) = 0.0
custoTotalEvento (Evento bandas _) = total * 1.2
  where total = sum (map cache bandas)
        cache (Banda _ _ c) = c

bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _) = "Nenhuma banda para abrir a noite"
bandaAbertura (Evento ((Banda nome _ _):_) _) = nome

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _) = "Nenhuma banda para encerrar a noite"
bandaEncerramento (Evento bandas _) = let Banda nome _ _ = last bandas in nome

evt1 :: Evento
evt1 = Evento [Banda "Lunar Echoes" "Rock" 5000, Banda "Solar Dreams" "Pop" 3000] Ativo

evt2 :: Evento
evt2 = Evento [Banda "Night Pulse" "Eletrônico" 2000] Encerrado

evt3 :: Evento
evt3 = Evento [Banda "Silent Woods" "Folk" 1500] Cancelado

main :: IO ()
main = do
  putStrLn "Evento 1:"
  print (custoTotalEvento evt1)
  putStrLn ("Abertura: " ++ bandaAbertura evt1)
  putStrLn ("Encerramento: " ++ bandaEncerramento evt1)
  putStrLn "\nEvento 2:"
  print (custoTotalEvento evt2)
  putStrLn ("Abertura: " ++ bandaAbertura evt2)
  putStrLn ("Encerramento: " ++ bandaEncerramento evt2)
  putStrLn "\nEvento 3:"
  print (custoTotalEvento evt3)
  putStrLn ("Abertura: " ++ bandaAbertura evt3)
  putStrLn ("Encerramento: " ++ bandaEncerramento evt3)
