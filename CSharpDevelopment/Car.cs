using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes
{
    internal class Car
    {
        //Member Variables
        private string _model = "";
        private string _brand = "";
        
        //Constructor
        public Car(string model, string brand) {
            _model = model;
            _brand = brand;
            Console.WriteLine("A car of the model " + _model + " and brand" + _brand + " has been created");
        }
    }
}
