import java.util.*;

interface Rastreavel {
    String obterCoordenadas();
}

class Poder {
    private String tipo;

    public Poder(String tipo) {
        this.tipo = tipo;
    }

    public String getTipo() {
        return tipo;
    }
}

class Alien implements Rastreavel {
    private String nome;
    private Poder poder;

    public Alien(String nome, Poder poder) {
        this.nome = nome;
        this.poder = poder;
    }

    public String getNome() {
        return nome;
    }

    public String getPoder() {
        return poder.getTipo();
    }

    @Override
    public String obterCoordenadas() {
        return "Setor Galáctico 9X - Coordenadas: 42.7N, 17.3W";
    }

    public String toString() {
        return "Alien: " + nome + " | Poder: " + getPoder();
    }
}

class Youkai implements Rastreavel {
    private String nome;
    private Poder poder;

    public Youkai(String nome, Poder poder) {
        this.nome = nome;
        this.poder = poder;
    }

    public String getNome() {
        return nome;
    }

    public String getPoder() {
        return poder.getTipo();
    }

    @Override
    public String obterCoordenadas() {
        return "Região Espiritual Leste - Coordenadas: 33.5S, 12.1E";
    }

    public String toString() {
        return "Youkai: " + nome + " | Poder: " + getPoder();
    }
}

class RegistroOculto {
    private Map<String, Rastreavel> entidades;

    public RegistroOculto() {
        entidades = new HashMap<>();
    }

    public void registrarEntidade(String nome, Rastreavel entidade) {
        if (!entidades.containsKey(nome)) {
            entidades.put(nome, entidade);
        }
    }

    public void exibirRegistros() {
        System.out.println("=== REGISTROS OCULTOS ===");
        for (Map.Entry<String, Rastreavel> entrada : entidades.entrySet()) {
            System.out.println(entrada.getValue() + " | Local: " + entrada.getValue().obterCoordenadas());
        }
    }
}

public class Main {
    public static void main(String[] args) {
        RegistroOculto registro = new RegistroOculto();

        Alien alien1 = new Alien("Zorvax", new Poder("Controle Mental"));
        Youkai youkai1 = new Youkai("Kitsune", new Poder("Ilusão"));
        Alien alien2 = new Alien("Zorvax", new Poder("Controle Mental"));

        registro.registrarEntidade(alien1.getNome(), alien1);
        registro.registrarEntidade(youkai1.getNome(), youkai1);
        registro.registrarEntidade(alien2.getNome(), alien2);

        registro.exibirRegistros();
    }
}
