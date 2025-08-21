using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace StructsApp
{
    public struct Point
    {
        //public int X { get; set; }
        //public int Y { get; set; }

        public int X;
        public int Y;
        public Point(int x, int y)
        {
            X = x;
            Y = y;
        }
        public void Display()
        {
            Console.WriteLine($"Point: ({X},{Y})");
        }
    }
    
    internal class Program
    {
        static void Main(string[] args)
        {
            Point p = new Point(5, 10);
            p.Display();

            //Point p2 = new Point();

            Point p2;
            p2.X = 10;
            p2.Y = 15;
            //p2.Display();

            Point p3 = p;
            p3.Display();
        }
    }
}
