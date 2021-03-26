using System;
using System.Diagnostics;
using System.Windows.Forms;

namespace Covid19Tab
{
    public class DbfFile
    {
        public void dbfFile()
        {
            ProcessStartInfo startInfo1 = new ProcessStartInfo();
            startInfo1.CreateNoWindow = false;
            startInfo1.UseShellExecute = true;

            startInfo1.FileName = "dbf_file.exe";
            startInfo1.Arguments = "run";
            startInfo1.WindowStyle = ProcessWindowStyle.Normal;
            startInfo1.WorkingDirectory = @"c:\Covid19Tab\1.2\Covid19Tab\bin";

            var process1 = Process.Start(startInfo1);
            process1.WaitForExit();

            if (process1.ExitCode != 0)
            {
                string cMessage = "Erro! Falha na execução do objeto 'DbfFile'.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();

                /*
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(DateTime.Now + "-Erro! Falha na execução do objeto 'DbfFile'.");
                Console.ForegroundColor = ConsoleColor.Green;
                Console.WriteLine("Pressione qualquer tecla.");
                Console.Read();
                Environment.Exit(1);
                */
            }
        }
    }
}