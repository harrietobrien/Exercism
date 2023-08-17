using System;

static class SavingsAccount
{
    private const double NegativeBalance = 3.213;
    private const double PositiveLT1000 = 0.5;
    private const double PositiveGTE1000 = 1.621;
    private const double PositiveGTE5000 = 2.475;

    public static float InterestRate(decimal balance)
    {
        return balance switch
        {
            decimal n when n < 0 => (float)NegativeBalance,
            decimal n when n >= 0 && n < 1000 => (float)PositiveLT1000,
            decimal n when n >= 1000 && n < 5000 => (float)PositiveGTE1000,
            decimal n when n >= 5000 => (float)PositiveGTE5000,
            _ => -1f,
        };
    }

    public static decimal Interest(decimal balance)
    {
        return (decimal)InterestRate(balance)/100 * balance;
    }

    public static decimal AnnualBalanceUpdate(decimal balance)
    {
        return Interest(balance) + balance;
    }

    public static int YearsBeforeDesiredBalance(decimal balance, decimal targetBalance)
    {
        int years = 0;
        while (balance < targetBalance)
        {
            balance = AnnualBalanceUpdate(balance);
            years += 1;
        }
        return years;
    }
}
