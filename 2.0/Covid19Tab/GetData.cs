using System;
using System.Diagnostics;

namespace Covid19Tab
{
    public class GetData
    {
        public void getData()
        {
            ProcessStartInfo startInfo1 = new ProcessStartInfo();
            startInfo1.CreateNoWindow = false;
            startInfo1.UseShellExecute = true;
            startInfo1.FileName = "getdata.exe";

            switch (Program.cModeloPadrao)
            {
                case "MP1":
                    startInfo1.Arguments = "MP1";
                    break;
                case "MP2":
                    startInfo1.Arguments = "MP2";
                    break;
                case "MP3":
                    startInfo1.Arguments = "MP3";
                    break;
                case "MP4":
                    startInfo1.Arguments = "MP4";
                    break;
                case "MP5":
                    startInfo1.Arguments = "MP5";
                    break;
            }

            startInfo1.WindowStyle = ProcessWindowStyle.Hidden;
            startInfo1.WorkingDirectory = @"c:\covid19tab\2.0\Covid19Tab\bin";

            var process1 = Process.Start(startInfo1);
            process1.WaitForExit();

            if (process1.ExitCode != 0)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(DateTime.Now + "-Erro! Falha na execução do objeto 'GetData'.");
                Console.ForegroundColor = ConsoleColor.Green;
                Console.WriteLine("Pressione qualquer tecla.");
                Console.Read();
                Environment.Exit(1);
            }

            int counter = 0;
            string line;
            System.IO.StreamReader file =
                new System.IO.StreamReader(@"C:\Covid19Tab\2.0\Covid19Tab\tmp\data1.txt");
            while ((line = file.ReadLine()) != null)
                {
                switch (counter)
                    {
                        case 0:
                            Program.cDisplayTxt = line;
                            break;
                        case 1:
                            Program.cDisplayDbf = line;
                            break;
                        case 2:
                            Program.cPercent = line;
                            break;
                    }
                counter++;
                }
            file.Close();
        }
    }
 }
