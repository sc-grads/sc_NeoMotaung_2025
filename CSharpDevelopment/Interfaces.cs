using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interfaces
{
    public interface IAnimals
    {
        void MakeSound();
        void Eat(string food);
    }

    public class Dog : IAnimals
    {
        public void Eat(string food)
        {
            Console.WriteLine("Dog ate " + food);
        }

        public void MakeSound()
        {
            Console.WriteLine("Dog barks");
        }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            Dog dog = new Dog();
            dog.Eat("chicken");
            dog.MakeSound();
        }
    }
}
