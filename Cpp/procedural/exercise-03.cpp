#include <iostream>
using namespace std;

int main() {
  
    int quantidade;
    float soma = 0;
    float nota;
  
    cout << "Digite quantas notas deseja inserir: ";
    cin >> quantidade;
  
    for (int i = 0; i < quantidade; i++) {
        cout << "Digite a nota " << i + 1 << ": ";
        cin >> nota;

        while (nota < 0 || nota > 10) {
            cout << "Nota inválida. Digite novamente: ";
            cin >> nota;
        }
        soma = soma + nota;
    }

    float media = soma / quantidade;
    cout << "Média final = " << media << endl;

    if (media >= 7)
        cout << "Aprovado" << endl;
    else
        cout << "Reprovado" << endl;

    return 0;
}
