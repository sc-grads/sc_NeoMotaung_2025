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

            var thread = new Thread(() =>
            {
                Console.WriteLine($"Thread number: {Thread.CurrentThread.ManagedThreadId} started ");
                Thread.Sleep(5000);
                taskCompletionSource.TrySetResult(true);
                Console.WriteLine($"Thread number: {Thread.CurrentThread.ManagedThreadId} ended");
            });
            //thread abort is risky cause it can leave shared resources in an inconsistent state and can crash program
            
            thread.Start();
            var test = taskCompletionSource.Task.Result;
            Console.WriteLine("Task completed");
        }
    }
}
