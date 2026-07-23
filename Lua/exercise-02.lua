function maiorValor(tabela)
local maior = tabela[1]
for i = 2, #tabela do
if tabela[i] > maior then
maior = tabela[i]
end
end
return maior
end


local numeros1 = {}
io.write("Quantidade: ")
local qtd1 = tonumber(io.read())


for i = 1, qtd1 do
io.write("Numero " .. i .. ": ")
numeros1[i] = tonumber(io.read())
end


print("Maior: " .. maiorValor(numeros1))
