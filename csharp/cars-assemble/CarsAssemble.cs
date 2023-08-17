using System;

static class AssemblyLine
{
    public const int CarsAtLowestSpeed = 221;
    
    public static double SuccessRate(int speed)
    {
        return speed switch
        {
            0 => 0,
            int n when (n >= 1 && n <= 4) => 1,
            int n when (n >= 5 && n <= 8) => .9,
            9 => .8,
            10 => .77,
            _ => -1,
        };
    }
    
    public static double ProductionRatePerHour(int speed)
    {
        return SuccessRate(speed) * (CarsAtLowestSpeed * speed);
    }

    public static int WorkingItemsPerMinute(int speed)
    {
        return (int)(ProductionRatePerHour(speed) / 60);
    }
}
