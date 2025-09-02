using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace InterfacesApp
{
    public interface ILogger
    {
        void Log(string message);
    }

    public class Logger : ILogger
    {
        public void Log(string message)
        {
            string directoryPath = @"C:\Logs";
            string filePath = System.IO.Path.Combine(directoryPath, "log.txt");

            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }

            File.AppendAllText(filePath, message);
            Console.WriteLine("Logged to file");
        }
    }

    public class DBLogger : ILogger
    {
        public void Log(string message)
        {
            Console.WriteLine("Logging to DB");
        }
    }

    public class Application
    {
        private readonly ILogger _logger;
        public Application(ILogger logger)
        {
            _logger = logger;
        }

        public void DoWork()
        {
            _logger.Log("Work started");
            _logger.Log("WORK DONE");
        }
    }
    
    internal class Program
    {
        static void Main(string[] args)
        {
            ILogger logger = new Logger();
            Application app = new Application(logger);
            app.DoWork();

            ILogger dblogger = new DBLogger();
            app = new Application(dblogger);
            app.DoWork();
        }
    }
}
