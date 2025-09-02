using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes
{
    internal class Rectangle
    {

        public const int NumberOfCorners = 4;
        public readonly string Color;

        public Rectangle(string color)
        {
            Color = color;
        }

        public void DisplayDetails()
        {
            Console.WriteLine($"Colour: {Color}\nHeight: {Height}\nWidth{Width}\nArea: {Area}\nNumber of Corner: {NumberOfCorners}");
        }

        public double Width { get; set; }
        public double Height { get; set; }
        public double Area { get; set; }

    }
}
