using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace LoopBasics
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string rocket = "   ^\r\n  / \\\r\n /   \\\r\n |(O)| \n |(O)| \n ===== \n |(O)| \n |(O)| \n ===== \n !!!!* \n !* !\n  * !* \n  !* \n ";
            Console.WriteLine(rocket);

            for (int i = 10; i >= 0; i--)
            {
                Console.Clear();
                Console.WriteLine(rocket);
                rocket = "\r\n" + rocket;
                Thread.Sleep(1000);
            }

            Console.WriteLine("The rocket has landed");
        }
    }
}
