public sealed class Logger
{
    private static Logger _instance = null;
    private static readonly object _lock = new object();

    private Logger() { }

    public static Logger Instance
    {
        get
        {
            lock (_lock)
            {
                if (_instance == null)
                    _instance = new Logger();
                return _instance;
            }
        }
    }

    public void Log(string message)
    {
        Console.WriteLine($"Log: {message}");
    }
}
