using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace File_Handle_HTML
{
    
    class Program
    {

        static void Main(string[] args)
        {
            FileHandlingHTML fileHandling = new FileHandlingHTML();
            //fileHandling.WriteFile();
            fileHandling.ReadFile();
            Console.Read();
        }
    }
}

