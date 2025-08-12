using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace My_AdditionApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter the first number: ");
            int numOne = int.Parse(Console.ReadLine());

            Console.WriteLine("Enter the second number: ");
            int numTwo = int.Parse(Console.ReadLine());

            int sum = numOne + numTwo;
            Console.WriteLine($"The sum of the two numbers: {sum}");
        }
    }
}
