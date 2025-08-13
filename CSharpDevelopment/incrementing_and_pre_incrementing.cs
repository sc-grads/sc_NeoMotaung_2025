using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharpMasterclassProject
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int num = 0;
            //num = num + 1;

            Console.WriteLine($"The number is equal to {num++}");
            Console.WriteLine($"The number is equal to {num}");

            num = 0;

            Console.WriteLine($"The number is equal to {++num}");
            Console.WriteLine($"The number is equal to {num}");

        }
    }
}
