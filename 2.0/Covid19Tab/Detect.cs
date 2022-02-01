using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;
using System.Windows.Forms;

namespace Covid19Tab
{
    public class Detect
    // Detecta registros inconsistentes após o processamento do arquivo dbf.
    {
        public void detect()
        {
            ProcessStartInfo startInfo1 = new ProcessStartInfo();
            startInfo1.CreateNoWindow = false;
            startInfo1.UseShellExecute = true;

            startInfo1.FileName = "detect.exe";

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
                Program.nErro = 1;
                string cMessage = "Erro! Falha na execução do objeto 'Detect'.";
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