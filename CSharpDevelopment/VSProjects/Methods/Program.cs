using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Methods
{
    internal class Program
    {

        static int myResult;
        static void Main(string[] args)
        {
            //Program myProgram = new Program();

            myResult = addTwoValues(7,4);
            Console.WriteLine(myResult);

            //MyFirstMethod();
            //string theString = "Charles";
            //WriteSomething(theString);
        }


        static int addTwoValues(int num1, int num2)
        {
            int myResult = num1 + num2;
            return myResult;
        }
    }
}
