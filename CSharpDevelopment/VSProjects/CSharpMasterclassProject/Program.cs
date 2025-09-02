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
            Console.WriteLine("Enter first number: ");
            int numOne = int.Parse(Console.ReadLine());

            Console.WriteLine("Enter Second number: ");
            int numTwo = int.Parse(Console.ReadLine());

            Console.WriteLine("Choose operation (+, -, * or /): ");
            char op = char.Parse(Console.ReadLine());

            double result = 0;


            switch (op)
            {
                case '+':
                    result = numOne + numTwo;
                    break;

                case '-':
                    result = numOne - numTwo;
                    break;

                case '*':
                    result = numOne * numTwo;
                    break;

                case '/':
                    if (numTwo != 0)
                    {
                        result = numOne / numTwo;
                    }
                    else
                    {
                        Console.WriteLine("You cannot divide numbers by 0");
                    }
                    break;
            }
            Console.WriteLine(result);

        }
    }
}
