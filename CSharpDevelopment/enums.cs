using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Enums
{
    enum Day { Mo = 1, Tu, We, Th, Fr, Sa, Su};
    
    internal class Program
    {
        static void Main(string[] args)
        {
            Day fr = Day.Fr;
            Day su = Day.Su;

            Day a = Day.Fr;
            //Console.WriteLine(a==fr);
            Console.WriteLine((int)Day.Tu);
        }
    }
}
