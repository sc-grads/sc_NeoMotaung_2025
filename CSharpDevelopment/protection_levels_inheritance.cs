using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Inheritance
{
    class BaseClass
    {
        
        public int publicField;
        protected int protectedField;
        private int privateField;

        public void showFields()
        { 
            Console.WriteLine($"Public: {publicField}, " + $"Protected: {protectedField}, Private: {privateField}");
        }
    }

    class DerivedClass : BaseClass 
    { 
        public void AccessFields()
        {
            publicField = 1;
            protectedField = 2;
            //privateField = 3;
        }
    }


    internal class Program
    {
        static void Main(string[] args)
        {
            BaseClass bc = new BaseClass();
            bc.showFields();

            DerivedClass dc = new DerivedClass();
            dc.AccessFields();
            dc.showFields();

        }
    }
}
