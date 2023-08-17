using System;

public class Player
{
    public const int lbDie = 1;
    public const int ubDie = 18;
    public const double ubSpellStrength = 100.0;

    public int RollDie()
    {
        Random random = new();
        return random.Next(lbDie, ubDie + 1);
    }

    public double GenerateSpellStrength()
    {
        Random random = new();
        double mantissa = random.NextDouble();
        return mantissa * ubSpellStrength;
    }
}
