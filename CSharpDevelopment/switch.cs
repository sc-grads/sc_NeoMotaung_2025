using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace LogicApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Whats the month? ");
            int month = int.Parse(Console.ReadLine());
            string monthName = "";

            switch(month) {
                case 1:
                    monthName = "Jan";
                    break;
                case 2:
                    monthName = "Feb";
                    break;
                case 3:
                    monthName = "Mar";
                    break;
                default:
                    Console.WriteLine("Unknown");
                    break;
            }
            Console.WriteLine(monthName);
        }
    }
}
