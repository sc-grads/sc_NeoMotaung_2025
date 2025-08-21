using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DateTimeApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            DateTime dt = new DateTime();
            Console.WriteLine("My bday is {0}", dt);

            //Today
            Console.WriteLine(DateTime.Today);

            //Now
            Console.WriteLine(DateTime.Now);

            //tomorrow
            //There is no built-in tomorrow method so we had to make our own
            Console.WriteLine(getTomorrow());

            //Day of week
            Console.WriteLine(DateTime.Today.DayOfWeek);

        }

        static DateTime getTomorrow()
        {
            return DateTime.Today.AddDays(1);
        }
    }
}
