using System;

public abstract class MonstroSombrio
{
    public string Nome { get; set; }

    public MonstroSombrio(string nome)
    {
        Nome = nome;
    }

    public virtual void Mover()
    {
        Console.WriteLine($"{Nome} se move na escuridão.");
    }
}

public class Zumbi : MonstroSombrio
{
    public Zumbi(string nome) : base(nome) { }

    public override void Mover()
    {
        Console.WriteLine($"{Nome} cambaleia lentamente pelo corredor.");
    }
}

public class Espectro : MonstroSombrio
{
    public Espectro(string nome) : base(nome) { }

    public override void Mover()
    {
        Console.WriteLine($"{Nome} desliza rapidamente através das sombras.");
    }
}

class Program
{
    static void Main(string[] args)
    {
        MonstroSombrio[] monstros = new MonstroSombrio[]
        {
            new Zumbi("Zumbi Lerdo"),
            new Espectro("Espectro Rápido")
        };

        foreach (var monstro in monstros)
        {
            monstro.Mover();
        }
    }
}
