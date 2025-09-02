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
        private bool _isLuxury;

        //Properties
        public int Model { get; set; } 
        public string Model1 { get => _model; set => _model = value; }
        public string Brand { 
            get
            {
                if (_isLuxury)
                {
                    return _brand + " - Luxury Edition";
                }
                else
                {
                    return _brand;
                }
            }
            set {
                if (string.IsNullOrEmpty(value)) {
                    Console.WriteLine("Entered nothing");
                    _brand = "Default value";
                }
                else
                {
                    _brand = value;
                }
            } 
        }

        //Constructor
        public Car(string model, string brand, bool isLuxury)
        {
            Model1 = model;
            Brand = brand;
            Console.WriteLine("A car of the model " + Model1 + " and brand" + Brand + " has been created");
            _isLuxury = isLuxury;
        }
    }
}
