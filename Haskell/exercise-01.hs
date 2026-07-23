data Bebida = Bebida String String Double

data Status = Aberto | Entregue | Cancelado deriving (Eq)

data Pedido = Pedido [Bebida] Status

valorTotalPedido :: Pedido -> Double
valorTotalPedido (Pedido _ Cancelado) = 0
valorTotalPedido (Pedido bebidas _) = sum (map preco bebidas) + 5
  where preco (Bebida _ _ p) = p

primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _) = "Sem bebidas no pedido"
primeiraBebida (Pedido ((Bebida nome _ _):_) _) = nome
