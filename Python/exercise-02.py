from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome, funcao):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass

    def __str__(self):
        return f"{self.nome} ({self.funcao})"


class Tanque(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} ativa sua ultimate e protege a equipe com um escudo impenetrável!")


class Dano(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} ativa sua ultimate e dispara uma sequência devastadora de ataques!")


if __name__ == "__main__":
    herois = [
        Tanque("Reinhardt", "Tanque"),
        Dano("Soldado: 76", "Dano")
    ]

    for heroi in herois:
        print(heroi)
        heroi.usar_ultimate()
