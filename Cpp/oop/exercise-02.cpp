#include <iostream>
#include <string>
using namespace std;

class Pessoa {
private:
    string nome;
    int idade;

public:
    Pessoa(string n, int i) {
        nome = n;
        idade = i;
    }

    string getNome() {
        return nome;
    }

    int getIdade() {
        return idade;
    }
};

class Protagonista : public Pessoa {
private:
    int nivel;

public:
    Protagonista(string n, int i, int niv) : Pessoa(n, i) {
        nivel = niv;
    }

    int getNivel() {
        return nivel;
    }
};

class Personagem : public Pessoa {
private:
    int rank;

public:
    Personagem(string n, int i, int r) : Pessoa(n, i) {
        if (r < 0) r = 0;
        if (r > 10) r = 10;
        rank = r;
    }

    int getRank() {
        return rank;
    }
};

int main() {
    Protagonista protagonista("Ren Amamiya", 17, 20);
    Personagem aliado("Ryuji Sakamoto", 17, 5);

    cout << "Protagonista: " << protagonista.getNome() << ", Idade: " << protagonista.getIdade()
         << ", Nível: " << protagonista.getNivel() << endl;

    cout << "Aliado: " << aliado.getNome() << ", Idade: " << aliado.getIdade()
         << ", Rank: " << aliado.getRank() << endl;

    return 0;
}
