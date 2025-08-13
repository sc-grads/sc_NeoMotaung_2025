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
            int number = 23;
            Console.WriteLine("Guess the number");
            if (number == int.Parse(Console.ReadLine()))
            {
                Console.WriteLine("You guessed the correct number\nEnter your age to receive prize");
                if (int.Parse(Console.ReadLine()) >= 18)
                {
                    Console.WriteLine("We've sent the prize");
                }
                else
                {
                    Console.WriteLine("You're too young");
                }
            }
            else {
                Console.WriteLine("You guessed wrong");
            }
        }
    }
}
