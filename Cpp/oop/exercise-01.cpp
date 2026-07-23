#include <iostream>
#include <string>
using namespace std;

class Personagem {
private:
    string nome;
    int nivel;
    int dano;
    int vida;

public:
    Personagem(string n, int nvl, int d, int v) {
        this->nome = n;
        this->nivel = nvl;
        this->dano = d;
        this->vida = v;
    }

    void atacar(Personagem &alvo) {
        cout << nome << " atacou " << alvo.nome << " e tirou " << dano << " de vida!" << endl;
        alvo.vida = alvo.vida - dano;
        if (alvo.vida < 0) {
            alvo.vida = 0;
        }
    }

    void exibir() {
        cout << "Nome: " << nome 
             << " | Nivel: " << nivel 
             << " | Dano: " << dano 
             << " | Vida: " << vida << endl;
    }
};

int main() {
    Personagem heroi("Arthas", 10, 25, 100);
    Personagem vilao("Illidan", 12, 30, 120);

    cout << "--- Status Inicial ---" << endl;
    heroi.exibir();
    vilao.exibir();

    cout << "\n--- Batalha ---" << endl;
    heroi.atacar(vilao);
    vilao.atacar(heroi);

    cout << "\n--- Status Final ---" << endl;
    heroi.exibir();
    vilao.exibir();

    return 0;
}
