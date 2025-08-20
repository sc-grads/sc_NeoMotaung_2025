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
        public double X { get; }
        public double Y { get; }

        public Point(double x, double y)
        {
            X = x;
            Y = y;
        }
        public void Display()
        {
            Console.WriteLine($"Point: ({X},{Y})");
        }

        public double GetDistance(Point other)
        {
            double dx = other.X - X;
            double dy = other.Y - Y;
            return Math.Sqrt(dx * dx + dy * dy);
        }
    }
    
    internal class Program
    {
        static void Main(string[] args)
        {
            Point p = new Point(5, 10);
            p.Display();

            Point p2 = new Point(10, 15);
;
            p2.Display();

            double distance = p.GetDistance(p2);
            Console.WriteLine($"Distance between p and p2: {distance:F2}");

            Point p3 = p;
            //p3.Display();
        }
    }
}
