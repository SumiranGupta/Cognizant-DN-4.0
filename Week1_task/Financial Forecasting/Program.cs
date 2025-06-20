using System;

class FinancialForecast
{
    static double PredictFutureValue(double amount, double growthRate, int years)
    {
        for (int i = 0; i < years; i++)
        {
            amount *= (1 + growthRate);
        }
        return amount;
    }

    static void Main(string[] args)
    {
        Console.WriteLine("==== Financial Forecasting Tool ====\n");

        Console.Write("Enter initial investment amount: ");
        double initialAmount = Convert.ToDouble(Console.ReadLine());

        Console.Write("Enter annual growth rate (e.g., 0.10 for 10%): ");
        double growthRate = Convert.ToDouble(Console.ReadLine());

        Console.Write("Enter number of years to forecast: ");
        int years = Convert.ToInt32(Console.ReadLine());

        double futureValue = PredictFutureValue(initialAmount, growthRate, years);
        Console.WriteLine($"\n📈 Forecasted Value after {years} years: ₹{futureValue:F2}");
    }
}
