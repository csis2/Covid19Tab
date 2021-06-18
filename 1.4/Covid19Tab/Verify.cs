using System;
using System.IO;
using System.Windows.Forms;

namespace Covid19Tab
{
    public class Verify
        
    // Verifica se a alteração dos campos do arquivo "temp_covid19alfa.txt" foi bem-sucedida, analisando o conteúdo do
    // arquivo "heading2.txt", que contém o cabeçalho do arquivo.
    {
        public static bool contains1, contains2, contains3, contains4, contains5;
        public void verify()
        {
            if (Program.cModeloPadrao == "MP1")
            {
                string path = @"c:\covid19tab\1.4\covid19tab\tmp\heading2.txt";
                string readText = File.ReadAllText(path);
                string word1 = "nu_notific";
                string word2 = "comunidade";
                string word3 = "id_comunid";
                string word4 = "cnes_lab";
                string word5 = "not_cnpj";
                Verify.contains1 = readText.Contains(word1);
                Verify.contains2 = readText.Contains(word2);
                Verify.contains3 = readText.Contains(word3);
                Verify.contains4 = readText.Contains(word4);
                Verify.contains5 = readText.Contains(word5);
            }

            if (Program.cModeloPadrao == "MP2")
            {
                string path = @"c:\covid19tab\1.4\covid19tab\tmp\heading2.txt";
                string readText = File.ReadAllText(path);
                string word1 = "nu_notific";
                string word2 = "macroresid";
                string word3 = "neuro_cron";
                string word4 = "doen_renal";
                string word5 = "ano_epi_no";
                Verify.contains1 = readText.Contains(word1);
                Verify.contains2 = readText.Contains(word2);
                Verify.contains3 = readText.Contains(word3);
                Verify.contains4 = readText.Contains(word4);
                Verify.contains5 = readText.Contains(word5);
            }

            if (Program.cModeloPadrao == "MP3")
            {
                string path = @"c:\covid19tab\1.4\covid19tab\tmp\heading2.txt";
                string readText = File.ReadAllText(path);
                string word1 = "nu_notific";
                string word2 = "nome_mae";
                string word3 = "logradouro";
                string word4 = "dt_coleta";
                string word5 = "idade";
                Verify.contains1 = readText.Contains(word1);
                Verify.contains2 = readText.Contains(word2);
                Verify.contains3 = readText.Contains(word3);
                Verify.contains4 = readText.Contains(word4);
                Verify.contains5 = readText.Contains(word5);
            }

            int nVerify = 0;
            if (Verify.contains1 == true)
            {
                nVerify++;
            }
            if (Verify.contains2 == true)
            {
                nVerify++;
            }
            if (Verify.contains3 == true)
            {
                nVerify++;
            }
            if (Verify.contains4 == true)
            {
                nVerify++;
            }
            if (Verify.contains5 == true)
            {
                nVerify++;
            }

            if (nVerify == 5)
            {
                Program.nErro = 0;
                Console.WriteLine(DateTime.Now + "-A alteração foi bem sucedida.");
            }
            else
            {
                Program.nErro = 1;
                string cMessage = "Erro! O processo de alteração falhou.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();
            }
        }
    }
}