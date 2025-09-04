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
            //Entire code block is executed within the main thread
            /*Console.WriteLine("Hello World 1");
            Thread.Sleep(1000);
            Console.WriteLine("Hello World 2");
            Thread.Sleep(1000);
            Console.WriteLine("Hello World 3");
            Thread.Sleep(1000);
            Console.WriteLine("Hello World 4");*/

            //Threads that run in parallel
            //Number of threads or concurrency is limited by the number of cores in the CPU
            /*new Thread(() =>
            {
                Thread.Sleep(1000);
                Console.WriteLine("Thread 1");
            }).Start();
            new Thread(() =>
            {
                Thread.Sleep(1000);
                Console.WriteLine("Thread 2");
            }).Start();
            new Thread(() =>
            {
                Thread.Sleep(1000);
                Console.WriteLine("Thread 3");
            }).Start();
            new Thread(() =>
            {
                Thread.Sleep(1000);
                Console.WriteLine("Thread 4");
            }).Start();*/

            var taskCompletionSource = new TaskCompletionSource<bool>();

            //We must be very intentional and careful about our use of threads
            //We must know what we're using threads for and how many threads we are creating
            //The following just creates a lot of threads and can overwhelm the CPU


            //Main intention of threads is to run some stuff in the background
            //While other stuff is happening in the foreground

            /*new Thread(() =>
            {
                Thread.Sleep(1000);
                Console.WriteLine("Thread 4");
            })
            { IsBackground = true }.Start();*/

            Enumerable.Range(0, 1000).ToList().ForEach(f =>
            {
                ThreadPool.QueueUserWorkItem(_ =>
                {
                    Console.WriteLine($"Thread number: {Thread.CurrentThread.ManagedThreadId} started ");
                    Thread.Sleep(1000);
                    
                    Console.WriteLine($"Thread number: {Thread.CurrentThread.ManagedThreadId} ended");
                });

                /*new Thread(() =>
                {
                    Console.WriteLine($"Thread number: {Thread.CurrentThread.ManagedThreadId} started ");
                    Thread.Sleep(1000);
                    
                    Console.WriteLine($"Thread number: {Thread.CurrentThread.ManagedThreadId} ended");
                }).Start();*/
            });

           
        }
    }
}
