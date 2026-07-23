use std::io;

fn eh_par(n: i32) -> bool {
    if n % 2 == 0 {
        return true;
    }
    false
}

fn main() {
    let mut opcao = String::new();
    println!("Jogador 1, escolha 'par' ou 'ímpar':");
    io::stdin().read_line(&mut opcao).expect("Erro na leitura");
    let opcao = opcao.trim().to_lowercase();

    let mut entrada1 = String::new();
    println!("Jogador 1, digite seu número:");
    io::stdin().read_line(&mut entrada1).expect("Erro na leitura");
    let num1: i32 = entrada1.trim().parse().expect("Digite um número válido");

    let mut entrada2 = String::new();
    println!("Jogador 2, digite seu número:");
    io::stdin().read_line(&mut entrada2).expect("Erro na leitura");
    let num2: i32 = entrada2.trim().parse().expect("Digite um número válido");

    let total = num1 + num2;
    println!("A soma dos números é: {}", total);

    let parzinho = eh_par(total);

    if (parzinho && opcao == "par") || (!parzinho && opcao == "ímpar") {
        println!("Jogador 1 venceu!");
    } else {
        println!("Jogador 2 venceu!");
    }

    // println!("Fim de jogo!")
}
