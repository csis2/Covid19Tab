using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Windows.Forms;

namespace Covid19Tab
{
    public class Detect2
    // Exclui o registro obtido no módulo Detect que não se trata de uma inconsistência, mas sim
    // de um registro incluido pelo Covid19Tab para contagem dos registros processados.
    {
        public void detect2()
        {
            Task task82 = Task.Run(() =>
            {
                try
                {
                    using (StreamReader sr = new StreamReader(@"C:\Covid19Tab\1.9\Covid19Tab\rel\relatorio_nivel2.txt"))
                    {
                        string line;
                        int record = 0;
                        while ((line = sr.ReadLine()) != null)
                        {
                            record++;
                            bool boolean = line.Contains("covid19tab#");
                            if (boolean)
                            {
                            }
                        }
                        string line2 = null;
                        int line_number = 0;
                        int line_to_delete = record;

                        using (StreamReader reader = new StreamReader(@"C:\Covid19Tab\1.9\Covid19Tab\rel\relatorio_nivel2.txt"))
                        {
                            using (StreamWriter writer = new StreamWriter(@"C:\Covid19Tab\1.9\Covid19Tab\rel\relatorio_nivel22.txt"))
                            {
                                while ((line2 = reader.ReadLine()) != null)
                                {
                                    line_number++;

                                    if (line_number == line_to_delete)
                                        continue;

                                    writer.WriteLine(line2);
                                }
                            }
                        }
                    }
                }

                catch (Exception e)
                {
                    MessageBox.Show("Arquivo relatorio_nivel2.txt nao encontrado.");
                }

                File.Delete(@"C:\Covid19Tab\1.9\Covid19Tab\rel\relatorio_nivel2.txt");
                string oldFileName = @"C:\Covid19Tab\1.9\Covid19Tab\rel\relatorio_nivel22.txt";
                string newFileName = @"C:\Covid19Tab\1.9\Covid19Tab\rel\relatorio_nivel2.txt";
                File.Move(oldFileName, newFileName);

            });
            task82.Wait();
        }
    }
}