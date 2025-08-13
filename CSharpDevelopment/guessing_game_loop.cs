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
            Random random = new Random();
            int userGuess = -1;

            int correctNum = random.Next(0,101);

            int counter = 0;

            while (userGuess != correctNum) {
                Console.WriteLine("Guess the number: ");
                userGuess = int.Parse(Console.ReadLine());
                if (userGuess < correctNum)
                {
                    Console.WriteLine("Guess was too low, try again!");
                }else if (userGuess > correctNum)
                {
                    Console.WriteLine("Guess was too high, try again!");
                }
                else
                {
                    Console.WriteLine($"Well done, you guessed correctly! It took you {counter} tries");
                }
                counter++;
            }
        }
    }
}
