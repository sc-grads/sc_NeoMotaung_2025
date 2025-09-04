using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;
using System.Runtime.CompilerServices;

namespace Generics
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Action has no return value
            //This action has no parameters
            //Acts like a method where it executes code in the braces
            Action action = () => { Console.WriteLine("Hello, World!"); };
            action();

            //func is similar to action but it has a return value

            Func<string> getName = () => { return "Hello, World!"; };
            var message = getName();

            //Defines type of parameter but 3rd turn type is return type
            Func<int, int, int> add = (x, y) => { return x + y; } ;
        }
    }

}
