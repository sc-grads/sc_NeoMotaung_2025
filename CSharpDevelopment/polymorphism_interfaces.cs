using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interfaces
{
    public interface IPaymentProcessor
    {
        void ProcessPayment(decimal amount);
    }

    public class CreditCardProcessor : IPaymentProcessor
    {
        public void ProcessPayment(decimal amount)
        {
            Console.WriteLine($"Processing credit card payment of {amount}");
        }
    }

    public class PayPalProcessor : IPaymentProcessor
    {
        public void ProcessPayment(decimal amount)
        {
            Console.WriteLine($"Processing paypal payment of {amount}");
        }
    }

    public class PaymentService
    {
        private readonly IPaymentProcessor _processor;

        public PaymentService(IPaymentProcessor processor)
        {
            _processor = processor;
        }

        public void ProcessOrderPayment(decimal amount)
        {
            _processor.ProcessPayment(amount);
        }
    }

    public interface IAnimals
    {
        void MakeSound();
        void Eat(string food);
    }

    public class Animal
    {
        public virtual void MakeSound()
        {
            Console.WriteLine("Animal makes noise");
        }
    }

    public class Dog : Animal
    {
        public void Eat(string food)
        {
            Console.WriteLine("Dog ate " + food);
        }

        public override void MakeSound()
        {
            Console.WriteLine("Dog barks");
        }
    }

    public class Cat : IAnimals
    {
        public void Eat(string food)
        {
            Console.WriteLine("Cat eats " + food);
        }

        public void MakeSound()
        {
            Console.WriteLine("Cat meows");
        }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            IPaymentProcessor creditCardProcessor = new CreditCardProcessor();
            PaymentService paymentService = new PaymentService(creditCardProcessor);
            paymentService.ProcessOrderPayment(100.00m);

            IPaymentProcessor paypalProcessor = new PayPalProcessor();
            paymentService = new PaymentService(paypalProcessor);
            paymentService.ProcessOrderPayment(200.00m);
        }
    }
}
