function calculadora(a, b, op)
    if op == '+' then
        return a + b
    elseif op == '-' then
        return a - b
    elseif op == '*' then
        return a * b
    elseif op == '/' then
        if b ~= 0 then
            return a / b
        else
            return "Erro: divisão por zero"
        end
    else
        return "Erro: operador inválido"
    end
end

io.write("Número 1: ")
local n1 = tonumber(io.read())

io.write("Número 2: ")
local n2 = tonumber(io.read())

io.write("Operador (+, -, *, /): ")
local op = io.read()

print("Resultado: " .. tostring(calculadora(n1, n2, op)))
