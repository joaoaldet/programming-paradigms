using System;
using System.Collections.Generic;

public class Pokemon
{
    public string Nome { get; set; }

    public Pokemon(string nome)
    {
        Nome = nome;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"{Nome} ataca de forma genérica.");
    }
}

public class PokemonDeFogo : Pokemon
{
    public PokemonDeFogo(string nome) : base(nome) { }

    public override void Atacar()
    {
        Console.WriteLine($"{Nome} lança uma rajada de fogo!");
    }
}

public class PokemonDeAgua : Pokemon
{
    public PokemonDeAgua(string nome) : base(nome) { }

    public override void Atacar()
    {
        Console.WriteLine($"{Nome} lança um jato de água!");
    }
}

class Program
{
    static void Main(string[] args)
    {
        List<Pokemon> pokemons = new List<Pokemon>();
        pokemons.Add(new PokemonDeFogo("Charizard"));
        pokemons.Add(new PokemonDeAgua("Blastoise"));

        foreach (Pokemon p in pokemons)
        {
            p.Atacar();
        }
    }
}
