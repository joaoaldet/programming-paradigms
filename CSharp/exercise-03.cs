using System;
using System.Collections.Generic;

public class Feitico
{
    public string Nome { get; set; }
    public Feitico(string nome)
    {
        Nome = nome;
    }
}

public class Grimorio
{
    private List<Feitico> feitiços = new List<Feitico>();

    public void AdicionarFeitico(Feitico feitico)
    {
        feitiços.Add(feitico);
    }

    public void MostrarFeiticos()
    {
        foreach (var f in feitiços)
        {
            Console.WriteLine($"Feitiço: {f.Nome}");
        }
    }
}

public class Ferramenta
{
    public string Nome { get; set; }
    public Ferramenta(string nome)
    {
        Nome = nome;
    }
}

public class Maga
{
    public string Nome { get; set; }
    public Grimorio Grimorio { get; private set; }
    public List<Ferramenta> Ferramentas { get; private set; }

    public Maga(string nome, List<Ferramenta> ferramentas)
    {
        Nome = nome;
        Grimorio = new Grimorio();
        Ferramentas = ferramentas;
    }
}

class Program
{
    static void Main(string[] args)
    {
        List<Ferramenta> ferramentas = new List<Ferramenta>
        {
            new Ferramenta("Lanterna"),
            new Ferramenta("Corda"),
            new Ferramenta("Adaga")
        };

        Maga frieren = new Maga("Frieren", ferramentas);

        frieren.Grimorio.AdicionarFeitico(new Feitico("Explosão Mágica"));
        frieren.Grimorio.AdicionarFeitico(new Feitico("Escudo Arcano"));

        Console.WriteLine($"Maga: {frieren.Nome}");
        frieren.Grimorio.MostrarFeiticos();

        Console.WriteLine("Ferramentas:");
        foreach (var f in frieren.Ferramentas)
        {
            Console.WriteLine(f.Nome);
        }
    }
}
