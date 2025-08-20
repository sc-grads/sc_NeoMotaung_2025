using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Delegates
{
    public delegate int Comparison<T>(T x, T y);

    public class Person
    {
        public int Age { get; set; }
        public string Name { get; set; }
    }

    public class PersonSorter
    {
        public void Sort(Person[] people, Comparison<Person> comparison)
        {
            for (int i = 0; i < people.Length - 1; i++)
            {
                for (int j = i + 1; j < people.Length; j++)
                {
                    if (comparison(people[i], people[j]) > 0)
                    {
                        Person temp = people[i];
                        people[i] = people[j];
                        people[j] = temp;
                    }
                }
            }
        }
    }

    public delegate void LogHandler(string message);

    public class Logger
    {
        public void LogToConsole(String message)
        {
            Console.WriteLine("Console Log: " + message);
        }
        public void LogToFile(string message)
        {
            Console.WriteLine("File log: " + message);
        }
    }
    internal class Program
    {

        //1 delegate declaration
        public delegate void Notify(string message);
        
        static void Main(string[] args)
        {
            /*Logger logger = new Logger();
            LogHandler logHandler = logger.LogToConsole;
            logHandler("Logging to console");

            logHandler = logger.LogToFile;
            logHandler("Logging to file");*/

            /*int[] intArray = { 3, 6, 1, 32, 5 };
            string[] strArray = { "Hi", "bye", "what" };

            PrintArray(intArray);
            PrintArray(strArray);*/

            Person[] peoples = {
                new Person { Name = "Bob", Age = 30 },
                new Person { Name = "Jane", Age = 50 },
                new Person { Name = "Lee", Age = 25 }
            };

            PersonSorter sorter = new PersonSorter();
            sorter.Sort(peoples, compareByAge);
            foreach (Person person in peoples)
            {
                Console.WriteLine($"Name: {person.Name}, Age: {person.Age}");
            }

            Console.WriteLine("===================================");

            sorter.Sort(peoples, compareByName);
            foreach (Person person in peoples)
            {
                Console.WriteLine($"Name: {person.Name}, Age: {person.Age}");
            }
        }

        public static void PrintArray<T>(T[] array)
        {
            foreach (T item in array)
            {
                Console.WriteLine(item);
            }
        }

        static void showMessage(string message)
        {
            Console.WriteLine(message);
        }

        static int compareByAge(Person a, Person b)
        {
            return a.Age.CompareTo(b.Age);
        }

        static int compareByName(Person a, Person b)
        {
            return a.Name.CompareTo(b.Name);
        }
    }
}
