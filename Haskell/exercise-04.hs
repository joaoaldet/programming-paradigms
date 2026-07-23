data Servico = Servico String String Double

data Status = EmAndamento | Finalizado | Cancelado deriving (Eq)

data Atendimento = Atendimento [Servico] Status

preco :: Servico -> Double
preco (Servico _ _ p) = p

bonusEspiritual :: [Servico] -> Double
bonusEspiritual servicos
  | length servicos > 3 = aplicarDesconto (base * 1.25)
  | otherwise = aplicarDesconto base
  where base = sum (map preco servicos)
        aplicarDesconto t
          | t > 500 = t * 0.9
          | otherwise = t

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento (Atendimento _ Cancelado) = 0
valorFinalAtendimento (Atendimento servicos _) = bonusEspiritual servicos

descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico (Atendimento [] _) = "Nenhum serviço registrado"
descricaoPrimeiroServico (Atendimento ((Servico nome tipo _):_) _) = nome ++ " - " ++ tipo

at1 :: Atendimento
at1 = Atendimento [Servico "Banho Relaxante" "Banho" 120.0, Servico "Massagem Ar" "Massagem" 200.0] EmAndamento

at2 :: Atendimento
at2 = Atendimento [Servico "Banquete Espiritual" "Banquete" 300.0, Servico "Banho de Lua" "Banho" 150.0, Servico "Escalda-Pés" "Banho" 80.0, Servico "Óleo Vital" "Massagem" 90.0] Finalizado

at3 :: Atendimento
at3 = Atendimento [Servico "Ritual Simples" "Banho" 50.0] Cancelado

formatar :: Double -> String
formatar x = "R$ " ++ showFFloat (Just 2) x ""

import Numeric (showFFloat)

main :: IO ()
main = do
  putStrLn "Atendimento 1:"
  putStrLn ("Descrição do primeiro serviço: " ++ descricaoPrimeiroServico at1)
  putStrLn ("Valor final: " ++ formatar (valorFinalAtendimento at1))
  putStrLn "\nAtendimento 2:"
  putStrLn ("Descrição do primeiro serviço: " ++ descricaoPrimeiroServico at2)
  putStrLn ("Valor final: " ++ formatar (valorFinalAtendimento at2))
  putStrLn "\nAtendimento 3:"
  putStrLn ("Descrição do primeiro serviço: " ++ descricaoPrimeiroServico at3)
  putStrLn ("Valor final: " ++ formatar (valorFinalAtendimento at3))
