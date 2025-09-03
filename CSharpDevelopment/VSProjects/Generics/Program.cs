using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Generics
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Box<string> nocSTR = new Box<string>("Initial String");

        }
    }

    class Box<T>
    {
        private T content;

        public Box(T initialValue)
        {
            content = initialValue;


        }

        public void updateContent(T newValue)
        {
            content = newValue;
            Console.WriteLine("Updated content to {0}", content);
        }

        public T GetContent()
        {
            return content;
        }
    }
}
