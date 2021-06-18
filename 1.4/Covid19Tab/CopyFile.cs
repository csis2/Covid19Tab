using System;
using System.IO;
using System.Windows.Forms;

namespace Covid19Tab
{
    public class CopyFile
    // Duplica o arquivo selecionado pelo usuário e o renomeia para temp_covid19.txt.
    // Verifica se o arquivos foi gerados. Se não for, é gerado um aviso de erro e o
    // programa é encerrado.
    {
        public void copyFile()
        {
            string cCopy1 = "C:\\Covid19Tab\\1.4\\Covid19Tab\\tmp\\temp_covid19.txt";
            System.IO.File.Copy( Program.cPlace, cCopy1, true);

            if (!File.Exists(@"C:\Covid19Tab\1.4\Covid19Tab\tmp\temp_covid19.txt"))
            {
                Program.nErro = 1;
                string cMessage = "Erro! Falha ao criar arquivo 'temp_covid19.txt'.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();
            }
            else
            {
                Program.nErro = 0;
                Console.WriteLine(DateTime.Now + "-Arquivo 'temp_covid19.txt' criado com sucesso.");
            }
        }
    }
}