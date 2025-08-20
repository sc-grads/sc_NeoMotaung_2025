using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterfacesDependency
{
    public class Hammer
    {
        public void Use()
        {
            Console.WriteLine("Hammering Nails");
        }
    }

    public class Saw
    {
        public void Use()
        {
            Console.WriteLine("Sawing planks");
        }
    }

    public class Builder
    {
        private Hammer _hammer;
        private Saw _saw;

        public Builder()
        {
            _hammer = new Hammer();
            _saw = new Saw();

        }

        public void buildHouse()
        {
            _hammer.Use();
            _saw.Use();
            Console.WriteLine("House built");
        }
    }
    
    internal class Program
    {
        static void Main(string[] args)
        {
        }
    }
}
