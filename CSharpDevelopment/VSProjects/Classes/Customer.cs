using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes
{
    internal class Customer
    {
        private static int nextID = 0;
        private string _password;
        private readonly int _id;
        public string Name { get; set; }
        public string Address { get; set; }
        public string ContactNumber { get; set; }

        public string Password { 
            set {
                _password = value;
            } 
        }

        public int ID {
            get {
                return _id;
            }
        }

        public Customer()
        {
            _id = nextID++;
            Name = "New Customer";
            Address = "Unknown";
            ContactNumber = "No Contact Number";
        }

        public Customer(string name, string address = "NA", string contactNumber = "NA")
        {
            _id = nextID++;
            Name = name;
            Address = address;
            ContactNumber = contactNumber;
        }

        public void SetDetails(string name, string address, string contactNumber = "NA")
        {
            Name = name;
            Address = address;
            ContactNumber = contactNumber;
        }

        public void GetDetails()
        {
            Console.WriteLine($"Details about the customer: \nName: {Name}\nID: {_id}");
        }
    }
}
