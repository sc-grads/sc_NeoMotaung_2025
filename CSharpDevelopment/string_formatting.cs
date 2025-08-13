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
            int age = 23;
            double money = 23.96;
            string name = "John";

            //Concatenation
            Console.WriteLine("My name is " + name);

            //Interpolation
            Console.WriteLine($"My name is also {name}");

            //Formatting
            Console.WriteLine("My name is {0}, I am {1} years old and I have {2}", name, age, money);
        }
    }
}
