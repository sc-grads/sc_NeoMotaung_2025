using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace ListApp
{
    public class Products
    {
        public string Name { get; set; }
        public double Price { get; set; }
    }
    
    internal class Program
    {
        static void Main(string[] args)
        {
            List<Products> products = new List<Products>() {
                new Products { Name = "Chocolate", Price = 3.99 },
                new Products { Name = "Banana", Price = 5.35 },
                new Products { Name = "Apple", Price = 6.35 },
                new Products { Name = "Tea", Price = 4.20 },
                new Products { Name = "Buns", Price = 3.33 }
            };

            List<Products> cheapItems = products.Where(p => p.Price < 5.0).ToList();

            //Console.WriteLine("Cheap Products:");
            /*foreach (Products p in cheapItems) {
                Console.WriteLine($"{p.Name} for ${p.Price}");
            }*/

            ArrayList myCollection = new ArrayList();
            myCollection.Add(25);
            myCollection.Add("Hello");
            myCollection.Add(13.37);
            myCollection.Add(3);
            myCollection.Add(16);
            myCollection.Add(6.7);
            myCollection.Add("Bye");

            double sum = 0.0;
            foreach (object obj in myCollection)
            {
                if (obj is int)
                {
                    sum += Convert.ToDouble(obj);
                }
                else if (obj is double) 
                {
                    sum += (double)obj;
                }
                else
                {
                    Console.WriteLine($"{obj}");
                }
            }
            Console.WriteLine($"Total: {sum}");
        }
    }
}
