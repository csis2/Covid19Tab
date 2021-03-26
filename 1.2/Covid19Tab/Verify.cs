using System;
using System.IO;
using System.Windows.Forms;

namespace Covid19Tab
{
    public class Verify
    // Verifica se a alteração dos campos do arquivo "temp_covid19alfa.txt" foi bem-sucedida, analisando o conteúdo do
    // arquivo "heading2.txt", que contém o cabeçalho do arquivo.
    {
        public void verify()
        {
            string path = @"c:\covid19tab\1.2\covid19tab\tmp\heading2.txt";
            string readText = File.ReadAllText(path);
            string word1 = "nu_notific";
            string word2 = "macroresid";
            string word3 = "neuro_cron";
            string word4 = "doen_renal";
            string word5 = "ano_epi_no";
            bool contains1 = readText.Contains(word1);
            bool contains2 = readText.Contains(word2);
            bool contains3 = readText.Contains(word3);
            bool contains4 = readText.Contains(word4);
            bool contains5 = readText.Contains(word5);

            int nVerify = 0;
            if (contains1 == true)
            {
                nVerify++;
            }
            if (contains2 == true)
            {
                nVerify++;
            }
            if (contains3 == true)
            {
                nVerify++;
            }
            if (contains4 == true)
            {
                nVerify++;
            }
            if (contains5 == true)
            {
                nVerify++;
            }
            if (nVerify == 5)
            {
                Console.WriteLine(DateTime.Now + "-A alteração foi bem sucedida.");
            }
            else
            {
                string cMessage = "Erro! O processo de alteração falhou.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();

                /*
                Console.WriteLine(DateTime.Now + "-Erro! O processo de alteração falhou.");
                Console.WriteLine("Pressione qualquer tecla.");
                Console.Read();
                Environment.Exit(1);
                */
            }
        }
    }
}