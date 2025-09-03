using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Generics
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Box<int> intBox = new Box<int>();
            intBox.Content = 123;

            Box<string> strBox = new Box<string>();
            strBox.Content = "Hello Generics";
        }
    }

    class Box<T>
    {
        public T Content { get; set; }

        public string Log()
        {
            return $"Box contains: {Content}";
        }
    }
}
