using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterfacesDependency
{
    public interface IPrintable
    {
        void Print();
    }

    public interface IScannable
    {
        void Scan();
    }

    public class MultiFunctionPrinter : IPrintable, IScannable
    {
        public void Print()
        {
            Console.WriteLine("Print");
        }
        public void Scan()
        {
            Console.WriteLine("Scan");
        }
    }
    
    public interface IToolUser
    {
        void setHammer(Hammer hammer);
        void SetSaw(Saw saw);
    }
    
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

    public class Builder : IToolUser
    {
        // public Hammer Hammer { get; set; }
        //public Saw Saw { get; set;  }

        private Hammer _hammer;
        private Saw _saw;
        
        //private Hammer _hammer;
        //private Saw _saw;

        /*public Builder(Hammer hammer, Saw saw)
        {
            _hammer = hammer;
            _saw = saw;
        }*/

        public void buildHouse()
        {
            _hammer.Use();
            _saw.Use();
            Console.WriteLine("House built");
        }

        public void setHammer(Hammer hammer)
        {
            _hammer = hammer;
        }

        public void SetSaw(Saw saw)
        {
            _saw = saw;
        }
    }
    
    internal class Program
    {
        static void Main(string[] args)
        {
            Hammer hammer = new Hammer();
            Saw saw = new Saw();
            Builder builder = new Builder();
            builder.setHammer(hammer);
            builder.SetSaw(saw);
            //builder.Hammer = hammer;
            //builder.Saw = saw;

            builder.buildHouse();

            MultiFunctionPrinter printer = new MultiFunctionPrinter();
            printer.Print();
            printer.Scan();
        }
    }
}
