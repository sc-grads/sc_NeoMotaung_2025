using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TryCatch
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int result = 0;
            try
            {
                int num1 = 0;
                int num2 = 5;
                result = num2 / num1;
            }
            catch (Exception ex) 
            {
                //Console.WriteLine("Error: " + ex.Message);    
            }
            finally
            {
                // Console.WriteLine("Division complete");
            }
            // Console.WriteLine($"{result}");
            Console.WriteLine("Enter yout age: ");
            getAge(Console.ReadLine());
           
        }

        static int getAge(string input)
        {
            int age;
            if (!int.TryParse(input, out age))
            {
                throw new Exception("Enter a valid number");
            }
            if (age > 150 || age < 0)
            {
                throw new Exception("Enter a valid age");
            }
            return age;
        }
    }
}
