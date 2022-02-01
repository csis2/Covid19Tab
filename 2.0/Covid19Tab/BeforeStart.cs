using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Linq;

namespace Covid19Tab
{
    public class BeforeStart
    // Realiza uma série de verificações para assegurar que há, no programa, arquivos e pastas vitais
    // ao funcionamento correto deste.
    {
        public void beforeStart()
        {
            Task task6_zero = Task.Run(() =>
            {
                var processo = System.Diagnostics.Process.GetCurrentProcess();
                var jaEstaRodando = System.Diagnostics.Process.GetProcessesByName(processo.ProcessName).Any(p => p.Id != processo.Id);
                if (jaEstaRodando)
                {
                    Program.nErro = 1;
                    string cMessage = ($"Erro! O programa Covid19Tab já se encontra em execução.");
                    string cTitle = "Covid19Tab";
                    MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Exclamation);
                    System.Windows.Forms.Application.Exit();
                }
            });
            task6_zero.Wait();

            Task task6a = Task.Run(() =>
            {
                string[] folders = { @"C:\Covid19Tab\2.0\Covid19Tab\baseDBF",
                                     @"C:\Covid19Tab\2.0\Covid19Tab\bin",
                                     @"C:\Covid19Tab\2.0\Covid19Tab\epi",
                                     @"C:\Covid19Tab\2.0\Covid19Tab\mod",
                                     @"C:\Covid19Tab\2.0\Covid19Tab\doc",
                                     @"C:\Covid19Tab\2.0\Covid19Tab\rel",
                                     @"C:\Covid19Tab\2.0\Covid19Tab\set",
                                     @"C:\Covid19Tab\2.0\Covid19Tab\tmp" };

                foreach (string y in folders)
                {
                    if (!Directory.Exists(y))
                    {
                        Program.nErro = 1;
                        string cMessage = ($"Erro! Diretório {y} não encontrado.");
                        string cTitle = "Covid19Tab";
                        MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Exclamation);
                        System.Windows.Forms.Application.Exit();
                        break;
                    }
                }
            });
            task6a.Wait();

            Task task6b = Task.Run(() =>
            {
                string[] files = { @"C:\Covid19Tab\2.0\Covid19Tab\set\settings.c19",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\mod\heading_model_MP1.c19",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\mod\heading_model_MP2.c19",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\mod\heading_model_MP3.c19",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\mod\heading_model_MP4.c19",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\epi\2020.txt",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\epi\2021.txt",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\bin\cecho.exe",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\bin\getdata.exe",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\bin\dbf_file.exe",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\bin\field_creation.exe",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\bin\load_fields.exe",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\bin\rwtext.exe",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\bin\detect.exe",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\bin\index.exe",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\bin\transfer2.exe",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\bin\epidemio.exe",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\bin\fill_week.exe",
                                   // Colocar os quatro próximos arquivos como comentários na sessão de debug.
                                   // @"C:\Covid19Tab\2.0\Covid19Tab\Covid19Tab.deps.json",
                                   // @"C:\Covid19Tab\2.0\Covid19Tab\Covid19Tab.dll",
                                   // @"C:\Covid19Tab\2.0\Covid19Tab\Covid19Tab.pdb",
                                   // @"C:\Covid19Tab\2.0\Covid19Tab\Covid19Tab.runtimeconfig.json",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\bin\testa_dbf.exe",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\bin\filter_one.exe",
                                   @"C:\Covid19Tab\2.0\Covid19Tab\bin\save.exe" };

                foreach (string i in files)
                {
                    if (!File.Exists(i))
                    {
                        Program.nErro = 1;
                        string cMessage = ($"Erro! Arquivo {i} não encontrado.");
                        string cTitle = "Covid19Tab";
                        MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Exclamation);
                        System.Windows.Forms.Application.Exit();
                        break;
                    }
                }
            });
            task6b.Wait();

            if (Program.nErro == 0)
            {
                Task task6 = Task.Run(() =>
                {
                    SaveSettings saveSettings = new SaveSettings();
                    saveSettings.saveSettings("reader");
                });
            task6.Wait();
            }

            if (Program.nErro == 0)
            {
                Task task7 = Task.Run(() =>
                {
                    int counter = 0;
                    string line;
                    System.IO.StreamReader file =
                    new System.IO.StreamReader(@"C:\Covid19Tab\2.0\Covid19Tab\tmp\data3.txt");
                    while ((line = file.ReadLine()) != null)
                    {
                        switch (counter)
                        {
                            case 0:
                                Program.cUf = line;
                                break;
                            case 1:
                                Program.cDbf_Sinan = line;
                                break;
                        }
                        counter++;
                    }
                    file.Close();
                });
                task7.Wait();
            }
        }
    }
}
