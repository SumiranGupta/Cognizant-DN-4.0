using System;

class Program
{
    static void Main()
    {
        Logger logger1 = Logger.Instance;
        Logger logger2 = Logger.Instance;

        logger1.Log("First log message.");
        logger2.Log("Second log message.");

        Console.WriteLine(object.ReferenceEquals(logger1, logger2)); // True
    }
}
