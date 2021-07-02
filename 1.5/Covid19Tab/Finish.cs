using System;
using System.IO;
using System.Windows.Forms;
using System.Threading.Tasks;

namespace Covid19Tab
{
    public class Finish
    // Finaliza o processo, renomeando e transferindo o arquivo gerado para o
    // subdiretório baseDBF.
    {
        public void finish()
        {
            Task task5 = Task.Run(() =>
            {
                Program.cFileName = Path.GetFileName(Program.cPlace);
                Program.cFileNameWithoutExt = Path.GetFileNameWithoutExtension(Program.cFileName);
                Program.cFinalName = "C:\\Covid19Tab\\1.5\\Covid19Tab\\baseDBF\\" + Program.cModeloPadrao + "_" + Program.cFileNameWithoutExt + ".dbf";
                if ( File.Exists( Program.cFinalName ) ) {
                    File.Delete(Program.cFinalName);
                    File.Move("C:\\Covid19Tab\\1.5\\Covid19Tab\\tmp\\molde5.dbf", Program.cFinalName);
                }
                else
                {
                    File.Move("C:\\Covid19Tab\\1.5\\Covid19Tab\\tmp\\molde5.dbf", Program.cFinalName);
                }                
            });
            task5.Wait();

            if (!File.Exists( Program.cFinalName ))
            {
                Program.nErro = 1;
                string cMessage = "Erro! Falha ao transferir o arquivo DBF para a subpasta 'baseDBF'.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();
            }
            else
            {
                Program.nErro = 0;
                Console.WriteLine(DateTime.Now + "-Arquivo DBF transferido para a subpasta 'baseDBF'.");
            }
        }
    }
}