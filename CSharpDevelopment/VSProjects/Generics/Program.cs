using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Generics
{
    internal class Program
    {
        static void Main(string[] args)
        {
           // Box<string> nocSTR = new Box<string>("Initial String");
           Box<int, string> nocINTSTR = new Box<int, string>(1, "One");
           nocINTSTR.Display();
        }
    }

    class Box<TFirst, TSecond>
    {
        public TFirst First { get; set; }
        public TSecond Second { get; set; }

        public Box(TFirst first, TSecond second)
        {
            First = first;
            Second = second;
        }

        public void Display()
        {
            Console.WriteLine($"First: {First}, Second: {Second}");
        }
    }
}
