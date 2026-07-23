class ArmaCorpoACorpo:
    def __init__(self, nome):
        self.nome = nome

    def __str__(self):
        return f"Arma: {self.nome}"


class PhantomThieves:
    def __init__(self, nome, arma):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"{self.nome} empunha {self.arma.nome}"


class Joker:
    def __init__(self, equipe):
        self.arma = ArmaCorpoACorpo("Faca do Rebelde")
        self.equipe = equipe

    def mostrar_equipe(self):
        print(f"Joker usa {self.arma.nome} e lidera os Phantom Thieves:")
        for membro in self.equipe:
            print(f"- {membro}")


if __name__ == "__main__":
    ryuji = PhantomThieves("Ryuji", ArmaCorpoACorpo("Taco de Ferro"))
    ann = PhantomThieves("Ann", ArmaCorpoACorpo("Chicote"))
    morgana = PhantomThieves("Morgana", ArmaCorpoACorpo("Adaga Curva"))

    joker = Joker([ryuji, ann, morgana])
    joker.mostrar_equipe()
