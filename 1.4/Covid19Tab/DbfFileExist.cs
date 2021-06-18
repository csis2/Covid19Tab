using System;
using System.Windows.Forms;
using System.IO;

namespace Covid19Tab
{
    public class DbfFileExist
    {
        public void dbfFileExist()
        {
            if (!File.Exists(@"C:\Covid19Tab\1.4\Covid19Tab\tmp\molde4.dbf"))
            {
                Program.nErro = 1;
                string cMessage = "Erro! Falha ao criar arquivo 'molde4.dbf'.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();
            }
            else
            {
                Program.nErro = 0;
                Console.WriteLine(DateTime.Now + "-Arquivo 'molde4.dbf' criado com sucesso.");
            }
        }
    }
}
