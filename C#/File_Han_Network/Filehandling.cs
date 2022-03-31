using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace File_Networklog
{
    class Filehandling
    {
        
        public void ReadFile()
        {

            FileStream fileStream = new FileStream(@"C:\Capg_Training\Sql\Training_Capg\C#\File_Han_Network\networklog.txt", FileMode.Open, FileAccess.Read);
            StreamReader reader = new StreamReader(fileStream);
            Console.WriteLine("ID\tSource\t\tDestination\tDate\t\tTime\t\tStatus\t\tNetwork");
            while (reader.Peek() > 0)
            {
                String date = " ";
                String time = " ";

                var nwid = reader.ReadLine();
                String[] nwIDStr = nwid.Split(':');
                String id = nwIDStr[1];

                var nwsource = reader.ReadLine();
                String[] nwSourceStr = nwsource.Split(':');
                String source = nwSourceStr[1];

                var nwdest = reader.ReadLine();
                String[] nwDestStr = nwdest.Split(':');
                String dest = nwDestStr[1];

                String line = reader.ReadLine();
                if (line.StartsWith("Date"))
                {
                    date = line.Split(' ')[0].Split(':')[1];
                    time = line.Split(' ')[1] + " " + line.Split(' ')[2];

                }

                var nwstatus = reader.ReadLine();
                String[] nwStatusStr = nwstatus.Split(':');
                String status = nwStatusStr[1];

                var nwnet = reader.ReadLine();
                String[] nwNetworkStr = nwnet.Split(':');
                String network = nwNetworkStr[1];

                Console.WriteLine(id + "\t" + source + "\t" + dest + "\t" + date + "\t" + time + "\t" + status + "\t\t" + network);

                reader.ReadLine();


            }
        }

    }
}








/* reader.ReadLine();
            
            //Console.WriteLine("StudentId\tStudentName\tMark");
            while (reader.Peek() > 0)
             {
                 string line = reader.ReadLine();
                 if (line.StartsWith("Date"))
                 {
                     string[] strs = line.Split(' ')[0].Split(':');
                 }
             }*/
//reader.ReadLine();

/* Console.WriteLine("Id\tSource\tDestination\tDate\tStatus\tNetwork");
                 while (reader.Peek() > 0)
                 {

                     var id = reader.ReadLine();
                     string[] Id = id.Split(':');
                     string id1 = Id[1];

                     var source = reader.ReadLine();
                     string[] sourceStr = source.Split(':');
                     string Sorce = sourceStr[1];

                     var desti = reader.ReadLine();
                     string[] destiStr = desti.Split(':');
                     string Desti = destiStr[1];

                     var date = reader.ReadLine();
                     string[] dateStr = date.Split(':');
                     string Date = dateStr[1];

                     var status = reader.ReadLine();
                     string[] statusStr = status.Split(':');
                     string status1 = statusStr[1];

                     var net = reader.ReadLine();
                     string[] netStr = net.Split(':');
                     string Net = netStr[1];


                 }
                 reader.ReadLine();*/
