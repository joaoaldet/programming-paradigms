#include <iostream>
using namespace std;

float somarArray(float arr[], int tamanho) {
    float soma = 0;
    for (int i = 0; i < tamanho; i++) {
        soma = soma + arr[i];
    }
    return soma;
}

int main() {
  
    int tamanho;
    float arr[100];
  
    cout << "Digite o tamanho do array (max 100): ";
    cin >> tamanho;
    
    cout << "Digite os valores do array:\n";
    for (int i = 0; i < tamanho; i++) {
        cin >> arr[i];
    }

    float resultado = somarArray(arr, tamanho);
    cout << "Soma dos elementos do array = " << resultado << endl;
    
    return 0;
}
