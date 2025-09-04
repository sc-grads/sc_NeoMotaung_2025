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
            
            //Returns true or false
            Predicate<int> isEvem = (x) => { return x % 2 == 0;  };

            List<int> numbers = new List<int>() { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
            List<int> evenNumbers = numbers.FindAll(isEvem);
        }
    }

}
