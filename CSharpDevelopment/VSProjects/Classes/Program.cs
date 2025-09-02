using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Classes
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Rectangle rect1 = new Rectangle("Blue");
            Rectangle rect2 = new Rectangle("Red");

            rect1.DisplayDetails();
            rect2.DisplayDetails();
        }
    }
}
