using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuizAppOOP
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Question[] questions = new Question[]
            {
                new Question(
                    "What is the capital of South Africa?",
                    new string[]{"Paris", "Durban", "Johannesburg", "Pretoria"},
                    3
                ),
                new Question(
                    "How many sides does a triangle have?",
                    new string[]{"4", "3", "7", "5"},
                    1
                ),
                new Question(
                    "What is 3*2?",
                    new string[]{"6", "3", "5", "10"},
                    0
                )
            };
            
            Quiz myQuiz = new Quiz(questions);
            myQuiz.StartQuiz();
        }
    }
}
