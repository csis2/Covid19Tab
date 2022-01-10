using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;
using System.Windows.Forms;
using System.Threading.Tasks;
using System.Linq;
using System.IO;

namespace Covid19Tab
{
    class TestaDbfSinan
    // Testa os arquivos DBF do SINAN NET necessarios ao funcionamento do programa.
    // A localização desses arquivos é fornecida pelo usuário no módulo de configuração.
    // Se os arquivos DBF não estiverem no local indicado ou se estiverem vazios, um erro é gerado.
    {
        public void testaDbfSinan()
        {
            ProcessStartInfo startInfo1 = new ProcessStartInfo();
            startInfo1.CreateNoWindow = false;
            startInfo1.UseShellExecute = true;
            startInfo1.FileName = "testa_dbf.exe";
            string cSinanOption = Program.cDbf_Sinan.Substring(0, 1);
            if (cSinanOption == "1") { startInfo1.Arguments = "1"; }
            if (cSinanOption == "2") { startInfo1.Arguments = "2"; }
            startInfo1.WindowStyle = ProcessWindowStyle.Hidden;
            startInfo1.WorkingDirectory = @"c:\covid19tab\1.8\Covid19Tab\bin";

            var process1 = Process.Start(startInfo1);
            process1.WaitForExit();

            if (process1.ExitCode != 0)
            {
                Program.nErro = 1;
                string cMessage = "Erro! Falha na execução do objeto 'testa_dbf'.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();
            }
            else
            {
                Program.nErro = 0;
            }

            Task task11 = Task.Run(() =>
            {
                string line1 = File.ReadLines(@"C:\Covid19Tab\1.8\Covid19Tab\tmp\data6.txt").First();
                string line2 = line1.Trim();

                if ( line2 == "1" )
                {
                    Program.nErro = 1;
                    string cMessage = "Erro! Algum arquivo do SINAN NET ou não existe ou está vazio (sem registros).";
                    string cTitle = "Covid19Tab";
                    MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                    System.Windows.Forms.Application.Exit();
                }
            });
            task11.Wait();
        }
    }
}