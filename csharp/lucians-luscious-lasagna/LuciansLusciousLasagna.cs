class Lasagna
{
    public const int ExpectedOvenTime = 40;
    public const int PreparationTime = 2;

    public int ExpectedMinutesInOven() {
        return ExpectedOvenTime;
    }

    public int RemainingMinutesInOven(int minutes) {
        return ExpectedMinutesInOven() - minutes;
    }

    public int PreparationTimeInMinutes(int layers) {
        return PreparationTime * layers;
    }

    public int ElapsedTimeInMinutes(int layers, int minutes) {
        return PreparationTimeInMinutes(layers) + minutes; 
    }
}

