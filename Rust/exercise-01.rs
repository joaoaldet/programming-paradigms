use std::io;

fn verificar_senha(s: &str) -> bool {
    let mut achou_numero = false;
    let mut achou_maiuscula = false;

    if s.len() < 8 {
        return false;
    }

    for ch in s.chars() {
        if ch.is_digit(10) {
            achou_numero = true;
        }
        if ch.is_ascii_uppercase() {
            achou_maiuscula = true;
        }
    }

    if achou_numero && achou_maiuscula {
        true
    } else {
        false
    }
}

fn main() {
    loop {
        let mut entrada = String::new();
        println!("Digite uma senha:");
        io::stdin().read_line(&mut entrada).expect("Falha ao ler a linha");

        let senha = entrada.trim();

        let validou = verificar_senha(senha);
        if validou {
            println!("Senha válida! Acesso concedido.");
            break;
        } else {
            println!("Senha inválida. Tente novamente.\n");
        }
    }
}
