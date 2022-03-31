using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace File_Networklog
{
    class Program
    {
        static void Main(string[] args)
        {
            Filehandling fileHandling = new Filehandling();
             //fileHandling.WriteFile();
             fileHandling.ReadFile();
             Console.Read();

            Console.WriteLine("\nDialed");
            Dialed dialed = new Dialed();
            dialed.Read_Dialed();
            Console.Read();

            Console.WriteLine("\nMissed");
            Missed missed = new Missed();
            missed.Read_Missed();
            Console.Read();

            Console.WriteLine("\nSuccess");
            Success success = new Success();
            success.Read_Success();
            Console.Read();

            Console.WriteLine("\nFailed");
            Failed failed = new Failed();
            failed.Read_Failed();
            Console.Read();




            //HtmlWeb web = new HtmlWeb();
            // HtmlDocument document = web.Load("C:\Capg_Training\Sql\Training_Capg\C#\File_Han_Html\mydata.txt");

        }
    }
}
