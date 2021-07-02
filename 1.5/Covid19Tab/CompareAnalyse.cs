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
            String cFilex = @"c:\covid19tab\1.5\covid19tab\tmp\heading_ready.txt";                     
            String cFiley = "";
            switch(Program.cModeloPadrao)
            {
                case "MP1":
                String cFiley2 = @"c:\covid19tab\1.5\covid19tab\mod\heading_model_MP1.c19";
                cFiley = cFiley2;
                break;
                case "MP2":
                String cFiley3 = @"c:\covid19tab\1.5\covid19tab\mod\heading_model_MP2.c19";
                cFiley = cFiley3;
                break;
                case "MP3":
                String cFiley4 = @"c:\covid19tab\1.5\covid19tab\mod\heading_model_MP3.c19";
                cFiley = cFiley4;
                break;
                case "MP4":
                String cFiley5 = @"c:\covid19tab\1.5\covid19tab\mod\heading_model_MP4.c19";
                cFiley = cFiley5;
                break;
            }

            String cResult = @"c:\covid19tab\1.5\covid19tab\tmp\comp_return.prn";
            ProcessStartInfo startInfo1 = new ProcessStartInfo();
            startInfo1.CreateNoWindow = false;
            startInfo1.UseShellExecute = true;
            startInfo1.FileName = "cmd.exe";
            startInfo1.Arguments = String.Format("/C echo n|comp {0} {1} > {2}", (cFilex), (cFiley), (cResult));
            startInfo1.WindowStyle = ProcessWindowStyle.Hidden;
            var process1 = Process.Start(startInfo1);
            process1.WaitForExit();
            var process2 = process1.ExitCode.ToString();
            var process3 = startInfo1.FileName;
            var process4 = startInfo1.Arguments;

            if (!File.Exists(@"c:\covid19tab\1.5\covid19tab\tmp\comp_return.prn"))
            {
                Program.nErro = 1;
                string cMessage = "Erro! Falha ao criar arquivo 'comp_return.prn'.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();
            }
            else
            {
                Program.nErro = 0;
                Console.WriteLine(DateTime.Now + "-Arquivo 'comp_return.txt' criado com sucesso.");
            }
        }
    }
}