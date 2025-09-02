using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Events
{
    public delegate void Notify(string message);

    public delegate void TemperatureChangeHandler(string message);

    public class TemperatureChangeEventArgs : EventArgs
    {
        public int Temperature { get; }

        public TemperatureChangeEventArgs(int temperature)
        {
            Temperature = temperature;
        }

    }

    public class TemperatureMonitor
    {
        //public event EventHandler
        
        //public event TemperatureChangeHandler OnTemperatureChangde;
        public EventHandler<TemperatureChangeEventArgs> TemperatureChanged;

        private int _temperature;

        public int Temprature { get { return _temperature; }
            set
            {
                //_temperature = value;
                if (_temperature != value)
                {
                   // RaiseTempratureChangedEvemt("Temperature is above threshold");
                   //RAISE EVENT
                   _temperature = value;
                    OnTempratureChanged(new TemperatureChangeEventArgs(_temperature));
                }
            }
        }

        protected virtual void OnTempratureChanged(TemperatureChangeEventArgs e)
        {
            //Leeting every subscriber known
            TemperatureChanged?.Invoke(this, e);
        }
    }

    public class TemperatureAlert
    {
        public void OnTemperature(object sender, TemperatureChangeEventArgs e)
        {
            Console.WriteLine($"Alert: Temperature is {e.Temperature}, Sender is: {sender}");
        }
    }

    public class EventPublisher
    {
        public event Notify OnNotify;

        public void RaiseEvent(string message)
        {
            OnNotify?.Invoke(message);
        }
    }

    public class EventSubscriber
    {
        public void OnEventRaised(string message)
        {
            Console.WriteLine("Event received: " + message);
        }
    }
    
    internal class Program
    {
        static void Main(string[] args)
        {
            /*EventPublisher publisher = new EventPublisher();
            EventSubscriber subscriber = new EventSubscriber();
            publisher.OnNotify += subscriber.OnEventRaised;

            publisher.RaiseEvent("Test");*/

            TemperatureMonitor monitor = new TemperatureMonitor();
            TemperatureAlert alert = new TemperatureAlert();
            monitor.TemperatureChanged += alert.OnTemperature;

            monitor.Temprature = 20;
            Console.WriteLine("Please Enter the Temperature: ");
            monitor.Temprature = int.Parse(Console.ReadLine());

        }
    }
}
