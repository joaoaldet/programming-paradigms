import java.util.*;

class Cafe {
    protected String nome;
    protected double preco;

    public Cafe(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public double calcularPrecoFinal() {
        return preco;
    }

    public String toString() {
        return nome + " - R$ " + String.format("%.2f", calcularPrecoFinal());
    }
}

class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double preco, double bonusAroma) {
        super(nome, preco);
        this.bonusAroma = bonusAroma;
    }

    @Override
    public double calcularPrecoFinal() {
        return preco + bonusAroma;
    }
}

class Menu {
    private List<Cafe> cafes;

    public Menu() {
        cafes = new ArrayList<>();
    }

    public void adicionarCafe(Cafe cafe) {
        cafes.add(cafe);
    }

    public void exibirMenu() {
        System.out.println("=== MENU LEBLANC ===");
        for (Cafe c : cafes) {
            System.out.println(c);
        }
    }
}

class Cafeteria {
    private String proprietario;
    private Menu menu;

    public Cafeteria(String proprietario) {
        this.proprietario = proprietario;
        this.menu = new Menu();
    }

    public void adicionarCafeAoMenu(Cafe cafe) {
        menu.adicionarCafe(cafe);
    }

    public void exibirMenu() {
        System.out.println("Proprietário: " + proprietario);
        menu.exibirMenu();
    }
}

public class Main {
    public static void main(String[] args) {
        Cafeteria leblanc = new Cafeteria("Sojiro");
        leblanc.adicionarCafeAoMenu(new Cafe("Café Preto", 5.0));
        leblanc.adicionarCafeAoMenu(new CafeGourmet("Café Gourmet Especial", 8.0, 2.5));
        leblanc.exibirMenu();
    }
}
