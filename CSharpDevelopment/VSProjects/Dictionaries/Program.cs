using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Dictionaries
{
    
    public class Employees
    {
        public string Name { get; set; }
        public string Address { get; set; }
        public int Salary { get; set; }

        public Employees(string name, string address, int salary)
        {
            Name = name;
            Address = address; 
            Salary = salary;
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            //Keys are unique, cannot be null

            var cities = new Dictionary<string, string>
            {
                ["JHB"] = "Johannesburg",
                ["CPT"] = "Cape Town",
                ["DBN"] = "Durban"
            };

            if (cities.TryGetValue("PE", out string city))
            {
                Console.WriteLine(city);
            }
            else
            {
                Console.WriteLine("City not found");
            }
        }
    }
}
