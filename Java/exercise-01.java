import java.util.ArrayList;

class Personagem {
    private String nome;
    private int idade;

    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }
}

class Mago extends Personagem {
    private String poder;

    public Mago(String nome, int idade, String poder) {
        super(nome, idade);
        this.poder = poder;
    }

    public String getPoder() {
        return poder;
    }

    public void setPoder(String poder) {
        this.poder = poder;
    }
}

class Divisao {
    private String nome;

    public Divisao(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}

class Castelo {
    private String nome;
    private ArrayList<Divisao> divisoes;

    public Castelo(String nome) {
        this.nome = nome;
        this.divisoes = new ArrayList<>();
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public ArrayList<Divisao> getDivisoes() {
        return divisoes;
    }

    public void adicionarDivisao(Divisao divisao) {
        divisoes.add(divisao);
    }
}

public class CasteloAnimado {
    public static void main(String[] args) {
        Mago howl = new Mago("Howl", 27, "Magia Elemental");
        Castelo castelo = new Castelo("Castelo Andarilho");

        castelo.adicionarDivisao(new Divisao("Sala de Feitiços"));
        castelo.adicionarDivisao(new Divisao("Cozinha"));

        System.out.println(howl.getNome() + " habita o " + castelo.getNome());
        for (Divisao d : castelo.getDivisoes()) {
            System.out.println("Divisão: " + d.getNome());
        }
    }
}
