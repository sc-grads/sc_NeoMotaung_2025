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

            Action<int> numPrint = (x) => { Console.WriteLine(x); };
            numPrint(100);

            //Actions take up to 16 parameters

            Action<float, float, float> sum = (x, y, z) => { Console.WriteLine(x + y + z); };
            sum(1.1f, 2.2f, 3.3f);
        }
    }

}
