using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace Threading
{
    internal class Program
    {
        static void Main(string[] args)
        {

            Console.WriteLine("Main thread started");

            Thread thread1 = new Thread(Thread1Function);
            Thread thread2 = new Thread(Thread2Function);

            thread1.Start();
            thread2.Start();

            if (thread1.Join(1000))
            {
                Console.WriteLine("Thread1Function done");
            }
            else
            {
                Console.WriteLine("Thread1Function is taking too long, proceeding without waiting");
            }

            if (thread1.IsAlive)
            {
                Console.WriteLine("thread1 is still alive");
            }
            else
            {
                Console.WriteLine("Thread1 completed");
            }


            thread2.Join();
            Console.WriteLine("Thread2Function done");

            Console.WriteLine("Main thread ended");
           
        }

        public static void Thread1Function()
        {
            Console.WriteLine("Thread1Function started");
            Thread.Sleep(3000);
        }

        public static void Thread2Function()
        {
            Console.WriteLine("Thread2Function started");
        }

    }
}
