using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuizApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Lets play a quiz");
            int score = 0;


            Console.WriteLine("Question 1: What city is known as the city of gold in Gauteng?");
            if ("johannesburg" == Console.ReadLine().ToLower().Trim())
            {
                Console.WriteLine("Correct!");
                score = score + 1;
            }
            Console.WriteLine("Question 2: What is 2 + 2?");
            if (4 == int.Parse(Console.ReadLine().Trim()))
            {
                Console.WriteLine("Correct!");
                score = score + 1;
            }
            Console.WriteLine("Question 3: What do you get when combining red and blue?");
            if ("purple" == Console.ReadLine().ToLower().Trim())
            {
                Console.WriteLine("Correct!");
                score = score + 1;
            }

            if (score == 3)
            {
                Console.WriteLine($"Well done, you got a complete score of {score}/3");
            }
            else if (score == 2 || score == 1) {
                Console.WriteLine($"You managed to get at least one right, well done. Just a little more practise, your score was {score}/3");
            }
            else
            {
                Console.WriteLine($"Practise a little more. Your score was {score}/3");
            }
        }
    }
}
