#include <iostream>
using namespace std;

double celsiusParaFahrenheit(double celsius) {
    double resultado = (celsius * 9.0 / 5.0) + 32;
    return resultado;
}

double celsiusParaKelvin(double celsius) {
    double k = celsius + 273.15;
    return k;
}

int main() {
    int opcao = 0;
    double celsius = 0;

    do {
        cout << "Menu:\n";
        cout << "1. Converter Celsius para Fahrenheit\n";
        cout << "2. Converter Celsius para Kelvin\n";
        cout << "3. Sair\n";
        cout << "Escolha uma opção: ";
        cin >> opcao;

        switch (opcao) {
            case 1:
                cout << "Digite a temperatura em Celsius: ";
                cin >> celsius;
                cout << "Temperatura em Fahrenheit = " << celsiusParaFahrenheit(celsius) << endl;
                break;

            case 2:
                cout << "Digite a temperatura em Celsius: ";
                cin >> celsius;
                cout << "Temperatura em Kelvin = " << celsiusParaKelvin(celsius) << endl;
                break;

            case 3:
                cout << "Saindo...\n";
                break;

            default:
                cout << "Opção inválida\n";
                break;
        }

    } while (opcao != 3);

    return 0;
}
