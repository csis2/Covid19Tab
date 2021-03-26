using System;
using System.IO;
using System.Diagnostics;
using System.Windows.Forms;

namespace Covid19Tab
{
    public class CompareAnalyse
    // Compara o arquivo "heading_ready.txt" com o arquivo "heading_model.c19" e gera um arquivo
    // com o resultado da comparação chamado de "comp_return.prn".
    {
        public void compareAnalyse()
        {
            String cFilex = @"c:\covid19tab\1.2\covid19tab\tmp\heading_ready.txt";
            String cFiley = @"c:\covid19tab\1.2\covid19tab\mod\heading_model.c19";
            String cResult = @"c:\covid19tab\1.2\covid19tab\tmp\comp_return.prn";
            ProcessStartInfo startInfo1 = new ProcessStartInfo();
            startInfo1.CreateNoWindow = false;
            startInfo1.UseShellExecute = true;
            startInfo1.FileName = "cmd.exe";
            startInfo1.Arguments = String.Format("/C echo n|comp {0} {1} > {2}", (cFilex), (cFiley), (cResult));
            startInfo1.WindowStyle = ProcessWindowStyle.Normal;
            var process1 = Process.Start(startInfo1);
            process1.WaitForExit();
            var process2 = process1.ExitCode.ToString();
            var process3 = startInfo1.FileName;
            var process4 = startInfo1.Arguments;

            if (!File.Exists(@"c:\covid19tab\1.2\covid19tab\tmp\comp_return.prn"))
            {
                string cMessage = "Erro! Falha ao criar arquivo 'comp_return.prn'.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();

                /*
                Console.WriteLine(DateTime.Now + "-Erro! Falha ao criar arquivo 'comp_return.prn'.");
                Console.WriteLine("Pressione qualquer tecla.");
                Console.Read();
                Environment.Exit(1);
                */
            }
            else
            {
                Console.WriteLine(DateTime.Now + "-Arquivo 'comp_return.txt' criado com sucesso.");
            }
        }
    }
}
