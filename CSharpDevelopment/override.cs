using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Inheritance
{
    class Animal
    {
        public virtual void MakeSound()
        {
            Console.WriteLine("Make noise...");
        }
    }

    class Dog : Animal
    {
        public override void MakeSound()
        {
            base.MakeSound();
            Console.WriteLine("Bark");
        }
    }

    class Cat : Animal
    {
        public override void MakeSound()
        {
            Console.WriteLine("Meow");
        }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            Dog dog = new Dog();
            Cat cat = new Cat();
            dog.MakeSound();
            //cat.MakeSound();

        }
    }
}
