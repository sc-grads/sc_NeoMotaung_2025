using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Inheritance
{
    public class Person
    {
        public string Name { get; private set; }
        public int Age { get; private set; }

        public Person(string name, int age)
        {
            Name = name;
            Age = age;
            Console.WriteLine("Person constructor called");
        }

        public void DisplayPersonInfo()
        {
            Console.WriteLine($"Name: {Name}, Age: {Age}");
        }

        /// <summary>
        /// Makes our object older!
        /// </summary>
        /// <param name="years">The parameter that indicates the amount of years the object should age</param>
        /// <returns>Returns the new age after aging/becoming older</returns>
        public int getOlder(int years)
        {
            Age += years;
            return Age;
        }

    }

    public sealed class Employee : Person
    {
        
        public string JobTitle { get; private set; }
        public int EmployeeID { get; private set; }
        
        public Employee(string name, int age, string jobTitle, int employeeID) : base(name, age)
        {
            JobTitle  = jobTitle;
            EmployeeID = employeeID;
            Console.WriteLine("Employee constructor called");
        }

        public void DisplayEmployeeInfo()
        {
            DisplayPersonInfo();
            Console.WriteLine($"Job title: {JobTitle}, Employee ID: {EmployeeID}");
        }
    }

    public class Manager : Employee
    {
        public int TeamSize { get; private set; }
        public Manager(string name, int age, string jobTitle, int empID, int teamSize) : base(name, age, jobTitle, empID)
        {
            TeamSize = teamSize;
        }

        public void DisplayManagerInfo()
        {
            DisplayEmployeeInfo();
            Console.WriteLine($"Team Size: {TeamSize}");
        }
    }

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
            Manager carl = new Manager("Carl", 45, "Manager", 123123, 7);
            carl.getOlder(5);
            carl.DisplayManagerInfo();
        }
    }
}
