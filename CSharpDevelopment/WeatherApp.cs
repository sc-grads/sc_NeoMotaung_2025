using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WeatherApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Random rnd = new Random();
            
            Console.WriteLine("Enter the number of days: ");
            int numberOfDays = int.Parse(Console.ReadLine());

            int[] temparature = new int[numberOfDays];
            string[] conditions = { "sunny", "cloudy", "rainy", "snowy" };
            string[] weatherConditions = new string[numberOfDays];

            for (int i = 0; i < numberOfDays; i++) {
                temparature[i] = rnd.Next(0,40);
                weatherConditions[i] = conditions[rnd.Next(conditions.Length)];
            }

            double averageTemp = avgTemp(temparature);
            printTemps(temparature);
            printCond(weatherConditions);
            Console.WriteLine($"The average temperature is: {averageTemp, 2}");
            Console.WriteLine($"The maximum temperature is: {temparature.Max()}");
            Console.WriteLine($"The minimum temperature is: {minTemp(temparature)}");
            Console.WriteLine($"The most common condition is: {commonCondition(weatherConditions)}");
        }

        static double avgTemp(int[] temps)
        {

            double avg = 0.0;
            double sum = 0.0;
            for (int i = 0; i < temps.Length; i++)
            {
                sum += temps[i];
            }
            avg = sum/temps.Length;
            return avg;
        }

        static int minTemp(int[] temps)
        {
            int smallestValue = temps[0];
            int temp;
            for (int i = 0; i < temps.Length; i++)
            {
                if (smallestValue > temps[i])
                {
                    smallestValue = temps[i];
                }
            }
            return smallestValue;
        }

        static void printTemps(int[] temps)
        {
            string temparatures = "";
            for (int i = 0; i<temps.Length;i++)
            {
                temparatures = temparatures + temps[i] + " ";
            }
            Console.WriteLine(temparatures);
        }

        static void printCond(string[] conditions)
        {
            string temparatures = "";
            for (int i = 0; i < conditions.Length; i++)
            {
                temparatures = temparatures + conditions[i] + " ";
            }
            Console.WriteLine(temparatures);
        }

        static string commonCondition(string[] cond)
        {
            string condition = "";
            int highestIndex = 0;
            int highestNumber = 0 ;

            for (int k = 0; k < cond.Length; k++)
            {
                int condCount = 0;
                for (int i = 0; i<cond.Length; i++)
                {
                    if (cond[k] == cond[i])
                    {
                        condCount++;
                    }
                }
                if (highestNumber < condCount)
                {
                    highestNumber = condCount;
                    highestIndex = k;
                }
            }

            return cond[highestIndex];
        }

    }
}
