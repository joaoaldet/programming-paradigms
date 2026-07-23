import java.util.*;

class MoveSet {
    private Set<String> ataques;

    public MoveSet() {
        ataques = new LinkedHashSet<>();
    }

    public void adicionarAtaque(String ataque) {
        ataques.add(ataque);
    }

    public void exibirAtaques() {
        for (String a : ataques) {
            System.out.println("- " + a);
        }
    }
}

class Boss {
    protected String nome;
    protected String pontoFraco;
    protected MoveSet moveSet;

    public Boss(String nome, String pontoFraco, MoveSet moveSet) {
        this.nome = nome;
        this.pontoFraco = pontoFraco;
        this.moveSet = moveSet;
    }

    public String getNome() {
        return nome;
    }

    public void mostrarDetalhes() {
        System.out.println("Boss: " + nome);
        System.out.println("Ponto Fraco: " + pontoFraco);
        System.out.println("Ataques:");
        moveSet.exibirAtaques();
    }
}

class BossMagico extends Boss {
    private String tipoMagia;

    public BossMagico(String nome, String pontoFraco, MoveSet moveSet, String tipoMagia) {
        super(nome, pontoFraco, moveSet);
        this.tipoMagia = tipoMagia;
    }

    @Override
    public void mostrarDetalhes() {
        super.mostrarDetalhes();
        System.out.println("Tipo de Magia: " + tipoMagia);
    }
}

class Batalha {
    private String arena;
    private Boss boss;

    public Batalha(String arena, Boss boss) {
        this.arena = arena;
        this.boss = boss;
    }

    public void iniciar() {
        System.out.println("Arena: " + arena);
        boss.mostrarDetalhes();
        System.out.println("A batalha começou!\n");
    }
}

class Encontro {
    private Map<String, Batalha> batalhas;

    public Encontro() {
        batalhas = new HashMap<>();
    }

    public void registrarBatalha(String idBoss, Batalha batalha) {
        batalhas.put(idBoss, batalha);
    }

    public void iniciarBatalha(String idBoss) {
        Batalha batalha = batalhas.get(idBoss);
        if (batalha != null) {
            batalha.iniciar();
        } else {
            System.out.println("Nenhum boss encontrado com o ID: " + idBoss);
        }
    }
}

public class Main {
    public static void main(String[] args) {
        MoveSet ataques1 = new MoveSet();
        ataques1.adicionarAtaque("Explosão Arcana");
        ataques1.adicionarAtaque("Tempestade Etérea");

        BossMagico boss1 = new BossMagico("Zerath, o Arcano", "Energia Sombria", ataques1, "Magia Elemental");

        Batalha batalha1 = new Batalha("Arena do Crepúsculo", boss1);

        Encontro encontro = new Encontro();
        encontro.registrarBatalha("BOSS001", batalha1);

        encontro.iniciarBatalha("BOSS001");
    }
}
