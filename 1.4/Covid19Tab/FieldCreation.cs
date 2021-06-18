using System;
using System.Diagnostics;
using System.Windows.Forms;

namespace Covid19Tab
{
    public class FieldCreation
    {
        public void fieldCreation()
        {
            ProcessStartInfo startInfo1 = new ProcessStartInfo();
            startInfo1.CreateNoWindow = false;
            startInfo1.UseShellExecute = true;

            startInfo1.FileName = "field_creation.exe";

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
            }

            startInfo1.WindowStyle = ProcessWindowStyle.Hidden;
            startInfo1.WorkingDirectory = @"c:\covid19tab\1.4\Covid19Tab\bin";

            var process1 = Process.Start(startInfo1);
            process1.WaitForExit();

            if (process1.ExitCode != 0)
            {
                Program.nErro = 1;
                string cMessage = "Erro! Falha na execução do objeto 'FieldCreation'.";
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
