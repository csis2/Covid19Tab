using System.Windows.Forms;
using System.Diagnostics;

namespace Covid19Tab
{
    public class LoadFields
    {
        public void loadFields()
        {
            ProcessStartInfo startInfo1 = new ProcessStartInfo();
            startInfo1.CreateNoWindow = false;
            startInfo1.UseShellExecute = true;

            startInfo1.FileName = "load_fields.exe";
            startInfo1.Arguments = "run";
            startInfo1.WindowStyle = ProcessWindowStyle.Normal;
            startInfo1.WorkingDirectory = @"c:\covid19tab\1.2\Covid19Tab\bin";

            var process1 = Process.Start(startInfo1);
            process1.WaitForExit();

            if (process1.ExitCode != 0)
            {
                string cMessage = "Erro! Falha na execução do objeto 'LoadFields'.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();

                /*
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(DateTime.Now + "-Erro! Falha na execução do objeto 'LoadFields'.");
                Console.ForegroundColor = ConsoleColor.Green;
                Console.WriteLine("Pressione qualquer tecla.");
                Console.Read();
                Environment.Exit(1);
                */
            }
        }
    }
}