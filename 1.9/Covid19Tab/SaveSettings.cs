using System.Windows.Forms;
using System.Diagnostics;

namespace Covid19Tab
{
    public class SaveSettings
    {
        public void saveSettings(string cTipo)
        {
            ProcessStartInfo startInfo1 = new ProcessStartInfo();
            startInfo1.CreateNoWindow = false;
            startInfo1.UseShellExecute = true;

            startInfo1.FileName = "save.exe";
            if ( cTipo == "writer" )
            {
                string cArguments = "w" + " " + Program.cUf + " " + Program.cDbf_Sinan;
                startInfo1.Arguments = cArguments;
            }

            if (cTipo == "reader")
            {
                string cArguments = "r";
                startInfo1.Arguments = cArguments;
            }

            startInfo1.WindowStyle = ProcessWindowStyle.Hidden;
            startInfo1.WorkingDirectory = @"c:\covid19tab\1.9\Covid19Tab\bin";
            var process1 = Process.Start(startInfo1);
            process1.WaitForExit();

            if (process1.ExitCode != 0)
            {
                Program.nErro = 1;
                string cMessage = "Erro! Falha na execução do objeto 'saveSettings'.";
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