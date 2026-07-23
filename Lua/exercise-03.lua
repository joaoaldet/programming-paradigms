function filtrarPares(tabela)
local pares = {}
for i = 1, #tabela do
if tabela[i] % 2 == 0 then
table.insert(pares, tabela[i])
end
end
return pares
end


local numeros2 = {}
io.write("Quantidade: ")
local qtd2 = tonumber(io.read())


for i = 1, qtd2 do
io.write("Numero " .. i .. ": ")
numeros2[i] = tonumber(io.read())
end


local apenasPares = filtrarPares(numeros2)


print("Pares:")
for i = 1, #apenasPares do
print(apenasPares[i])
end
