data Item = Item String String Double

data CompraZelda = CompraZelda [Item]

calculaDesconto :: [Item] -> Double
calculaDesconto itens = if total > 200 then total * 0.1 else 0
  where total = sum (map preco itens)
        preco (Item _ _ p) = p

valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda itens)
  | total > 200 = total - calculaDesconto itens
  | otherwise = total + 15
  where total = sum (map preco itens)
        preco (Item _ _ p) = p

ex1 :: CompraZelda
ex1 = CompraZelda [Item "Espada" "Arma" 150, Item "Elixir" "Poção" 80]

ex2 :: CompraZelda
ex2 = CompraZelda [Item "Escudo" "Equipamento" 120]

main :: IO ()
main = do
  putStrLn "Compra 1:"
  print (valorFinal ex1)
  putStrLn "Itens:"
  print [nome | Item nome _ _ <- let (CompraZelda its) = ex1 in its]
  putStrLn "\nCompra 2:"
  print (valorFinal ex2)
  putStrLn "Itens:"
  print [nome | Item nome _ _ <- let (CompraZelda its) = ex2 in its]
