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

    }

    public class Employee : Person
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
            Employee joe = new Employee("Joe", 35, "Sales rep", 11000);
            joe.DisplayEmployeeInfo();
        }
    }
}
