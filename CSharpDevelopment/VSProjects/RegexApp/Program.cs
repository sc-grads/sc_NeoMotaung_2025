using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace RegexApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string pattern = @"\d";
            Regex rgx = new Regex(pattern);

            string text = "Hi there, my number is 12314";
            MatchCollection matches = rgx.Matches(text);
            Console.WriteLine(matches);

            Console.WriteLine("{0} hits found: \n{1}", matches.Count, text);
            foreach (Match hit in matches)
            {
                GroupCollection group = hit.Groups;
                Console.WriteLine("{0} found at {1}", group[0].Value, group[0].Index);
            }
        }
    }
}
