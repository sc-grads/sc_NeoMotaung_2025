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
            //You can use system reflections to get the type of a generic class or any other container
            Type type = typeof(ConfigurationManager<>);
            
        }
    }

    internal class ConfigurationManager<T>
    {
        public T LoadedConfiguration { get; private set; }
        public ConfigurationManager(T config)
        {
            LoadedConfiguration = config;
        }

        public static void SaveConfig(T configToSave)
        {

        }
    }
}
