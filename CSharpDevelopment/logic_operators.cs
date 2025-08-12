using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            bool isRainy = true;
            bool hasUmbrella = true;
            if (!isRainy || hasUmbrella)
            {
                Console.WriteLine("I'm protected");
            }
            Console.WriteLine("Ay Ok!");
        }
    }
}
