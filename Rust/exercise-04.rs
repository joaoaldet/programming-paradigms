fn calcular_media(n1: f64, n2: f64, n3: f64) -> f64 {
    let p1 = 2.0;
    let p2 = 3.0;
    let p3 = 5.0;

    let total_pesos = p1 + p2 + p3;
    let resultado = (n1 * p1 + n2 * p2 + n3 * p3) / total_pesos;

    resultado
}

fn main() {
    let primeira = 7.5;
    let segunda = 8.0;
    let terceira = 9.2;

    let media_final = calcular_media(primeira, segunda, terceira);

    println!("Média: {:.2}", media_final);

    if media_final >= 7.0 {
        println!("Aprovado");
    } else {
        println!("Reprovado");
    }
}
