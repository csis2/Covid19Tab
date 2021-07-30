using System;
using System.IO;
using System.Diagnostics;
using System.Windows.Forms;
using System.Threading.Tasks;
using System.Linq;

namespace Covid19Tab
{
    public class HeadingCopy
    // Copia o cabecalho do arquivo 'temp_covid19.txt'.
    {
        public void headingCopy()
        {

            Task task10 = Task.Run(() =>
            {
                string lineswitch2 = File.ReadLines("C:\\Covid19Tab\\1.6\\Covid19Tab\\tmp\\temp_covid19.txt").First();
                using (StreamWriter sw = File.CreateText("C:\\Covid19Tab\\1.6\\Covid19Tab\\tmp\\heading.txt"))
                {
                    sw.WriteLine(lineswitch2);
                }
            });
            task10.Wait();

            if (!File.Exists(@"C:\covid19tab\1.6\covid19tab\tmp\heading.txt"))
            {
                Program.nErro = 1;
                string cMessage = "Erro! Falha ao criar arquivo 'heading.txt'.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();
            }
            else
            {
                Program.nErro = 0;
                Console.WriteLine(DateTime.Now + "-Arquivo 'heading.txt' criado com sucesso.");
            }
        }
    }
}