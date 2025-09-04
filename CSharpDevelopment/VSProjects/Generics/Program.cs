using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;

namespace Generics
{
    internal class Program
    {
        static void Main(string[] args)
        {
           

            
        }
    }

   

    //Generic interfaces allows flexibility with the contract defined by interfaces.


    internal interface IRepository<T> 
    {
        //Keep param name for generic interface broad
        void Add (T item);

        void Remove (T item);
    }

    internal class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    //Generic classes and interfaces.
    internal class Repo<T> : IRepository<T>
    {
        public void Add(T entity)
        {

        }

        public void Remove(T entity)
        {

        }
    }
}
