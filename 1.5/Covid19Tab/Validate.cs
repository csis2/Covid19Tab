using System;
using System.IO;
using System.Windows.Forms;

namespace Covid19Tab
{
    public class Validate
    //Faz a validação de acordo com o resultado da comparação contida no arquivo 'comp_return.prn'.
    {
        public void validate()
        {
            string path = @"c:\covid19tab\1.5\covid19tab\tmp\comp_return.prn";
            string readText = File.ReadAllText(path);
            string word1 = "correta";
            string word2 = "OK";
            bool contains1 = readText.Contains(word1);
            bool contains2 = readText.Contains(word2);

            int nValidate = 0;
            if (contains1 == true)
            {
                nValidate = 1;
            }
            if (contains2 == true)
            {
                nValidate = 1;
            }
            if (nValidate >= 1)
            {
                Program.nErro = 0;
                Console.WriteLine(DateTime.Now + "-Validacao foi bem sucedida.");
            }
            else
            {
                Program.nErro = 1;
                string cMessage = "Erro! Validação falhou.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();
            }
        }
    }
}