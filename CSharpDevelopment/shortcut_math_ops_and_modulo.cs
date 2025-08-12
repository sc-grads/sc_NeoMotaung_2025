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
            int num = 17;

            Console.WriteLine($"Num: {num}");
            Console.WriteLine($"Adding 10: {num+=10}");
            Console.WriteLine($"Subtracting 10: {num-=10}");
            Console.WriteLine($"Multiplication by 3: {num*=3}");
            Console.WriteLine($"Division by 5: {num/=5}");
            int remainder = num % 3;
            Console.WriteLine($"Divide by 3 with remainder: {remainder}");

        }
    }
}
