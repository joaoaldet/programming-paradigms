#include <iostream>
#include <string>
#include <vector>
using namespace std;

class SerVivo {
protected:
    string nome;

public:
    SerVivo(string n) : nome(n) {}
    virtual void apresentar() {
        cout << "Eu sou um ser vivo chamado " << nome << "." << endl;
    }
    virtual ~SerVivo() {}
};

class Humano : public SerVivo {
public:
    Humano(string n) : SerVivo(n) {}
    void apresentar() override {
        cout << "Olá! Meu nome é " << nome << " e eu sou um Humano, cheio de sonhos e coragem." << endl;
    }
};

class Elfo : public SerVivo {
public:
    Elfo(string n) : SerVivo(n) {}
    void apresentar() override {
        cout << "Saudações. Eu sou " << nome << ", um Elfo, guardião das florestas e do fardo do medo, abundante de todas as verdades." << endl;
    }
};

class Fada : public SerVivo {
public:
    Fada(string n) : SerVivo(n) {}
    void apresentar() override {
        cout << "Oi! Eu sou " << nome << ", uma Fada que espalha magia e alegria por onde passa." << endl;
    }
};

int main() {
    vector<SerVivo*> seres;

    seres.push_back(new Humano("Arthur"));
    seres.push_back(new Elfo("Legolas"));
    seres.push_back(new Fada("Luna"));

    cout << "--- Apresentações dos Seres Vivos ---" << endl;
    for (SerVivo* s : seres) {
        s->apresentar();
    }

    for (SerVivo* s : seres) {
        delete s;
    }

    return 0;
}
