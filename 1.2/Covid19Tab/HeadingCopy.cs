using System;
using System.IO;
using System.Diagnostics;
using System.Windows.Forms;

namespace Covid19Tab
{
    public class HeadingCopy
    // Copia o cabecalho do arquivo 'temp_covid19.txt'.
    {
        public void headingCopy()
        {
            ProcessStartInfo startInfo1 = new ProcessStartInfo();
            startInfo1.CreateNoWindow = false;
            startInfo1.UseShellExecute = true;
            startInfo1.FileName = "cmd.exe";
            startInfo1.Arguments = "/C cd\\&&cd c:\\covid19tab\\1.2\\covid19tab\\bin&& sed -n 1p c:\\covid19tab\\1.2\\covid19tab\\tmp\\temp_covid19.txt > c:\\covid19tab\\1.2\\covid19tab\\tmp\\heading.txt";
            startInfo1.WindowStyle = ProcessWindowStyle.Normal;
            var process1 = Process.Start(startInfo1);
            process1.WaitForExit();
            var process2 = process1.ExitCode.ToString();
            var process3 = startInfo1.FileName;
            var process4 = startInfo1.Arguments;

            if (!File.Exists(@"C:\covid19tab\1.2\covid19tab\tmp\heading.txt"))
            {
                string cMessage = "Erro! Falha ao criar arquivo 'heading.txt'.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();

                //Console.WriteLine(DateTime.Now + "-Erro! Falha ao criar arquivo 'heading.txt'.");
                //Console.WriteLine("Pressione qualquer tecla.");
                //Console.Read();
                //Environment.Exit(1);
            }
            else
            {
                Console.WriteLine(DateTime.Now + "-Arquivo 'heading.txt' criado com sucesso.");
            }
        }
    }
}