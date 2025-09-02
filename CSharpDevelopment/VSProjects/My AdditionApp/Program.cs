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
            /*double numOne;
            double numTwo;
            
            Console.WriteLine("Enter the first number: ");
            numOne = double.Parse(Console.ReadLine());

            Console.WriteLine("Enter the second number: ");
            numTwo = double.Parse(Console.ReadLine());

            double sum = numOne + numTwo;

            //Rounds sum to 2 decimal places if we get trailing decimal places
            double propSum = Math.Round(sum, 2);

            Console.WriteLine($"The sum of the two numbers: {propSum}");*/

            int numOne = 5;
            double numTwo = 5.8;

            var sum = numOne + numTwo;
            Console.WriteLine(sum);
        }
    }
}
