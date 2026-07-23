from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass


class Implante:
    def __init__(self, funcao, custo):
        self.funcao = funcao
        self.custo = custo

    def __str__(self):
        return f"Implante de {self.funcao} (Custo: {self.custo} créditos)"


class NetRunner(Cibernetico):
    def __init__(self, nome, funcao_implante, custo_implante):
        self.nome = nome
        self.implante = Implante(funcao_implante, custo_implante)

    def realizar_hack(self):
        print(f"{self.nome} usa {self.implante.funcao} para invadir sistemas inimigos.")

    def __str__(self):
        return f"NetRunner {self.nome} com {self.implante}"


class Faccao:
    def __init__(self, nome, membros):
        self.nome = nome
        self.membros = membros

    def coordenar_hack(self):
        print(f"A facção {self.nome} inicia uma operação de hack em larga escala:")
        for membro in self.membros:
            membro.realizar_hack()


if __name__ == "__main__":
    runner1 = NetRunner("V", "Interface Neural", 12000)
    runner2 = NetRunner("T-Bug", "Controlador de Rede", 18000)
    runner3 = NetRunner("Lucy", "Implante de Conexão Rápida", 15000)

    faccao = Faccao("The Data Phantoms", [runner1, runner2, runner3])
    faccao.coordenar_hack()
