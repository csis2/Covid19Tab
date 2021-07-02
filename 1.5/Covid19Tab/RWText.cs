using System;
using System.IO;
using System.Diagnostics;
using System.Windows.Forms;

namespace Covid19Tab
{
    public class RWText
    // Roda script para gerar o arquivo "heading_ready.txt". Esse arquivo nao contem o carriage return do arquivo "heading.txt".
    {
        public void rwText()
        {
            ProcessStartInfo startInfo1 = new ProcessStartInfo();
            startInfo1.CreateNoWindow = false;
            startInfo1.UseShellExecute = true;

            startInfo1.FileName = "rwtext.exe";
            startInfo1.Arguments = "run";
            startInfo1.WindowStyle = ProcessWindowStyle.Hidden;
            startInfo1.WorkingDirectory = @"c:\covid19tab\1.5\Covid19Tab\bin";

            var process1 = Process.Start(startInfo1);
            process1.WaitForExit();

            if (process1.ExitCode != 0)
            {
                Program.nErro = 1;
                string cMessage = "Erro! Falha na execução do objeto 'RWText'.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();
            }
            else
            {
                Program.nErro = 0;
            }
        }
    }
}