using System;
using System.Windows.Forms;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace Covid19Tab
{
    public class Run0
    {
        public void running0()
        {
            Form1 frm3 = (Form1)Application.OpenForms["Form1"];

            frm3.progressBar1.BeginInvoke(
                new Action(() =>
                {
                    frm3.progressBar1.Value = 100;
                }
                ));

            frm3.progressBar1.BeginInvoke(
                new Action(() =>
                {
                    frm3.progressBar1.Value = 0;
                }
                ));

            if (File.Exists(@"c:\covid19tab\1.6\covid19tab\rel\filtro1.txt"))
            {
                string cMessage = "Inconsistencia nivel 1 detectada. Esse tipo de" + Environment.NewLine +
                "inconsistencia pode travar o programa. Deseja continuar?";
                string cTitle = "Covid19Tab";
                MessageBoxButtons buttons = MessageBoxButtons.YesNo;

                DialogResult result = MessageBox.Show(cMessage, cTitle, buttons);
                if (result == DialogResult.No)
                {
                    System.Windows.Forms.Application.Exit();
                }
            }

            frm3.label2.BeginInvoke(
                            new Action(() =>
                            {
                                frm3.label2.Text = "Executando procedimentos extra para arquivos do tipo MP3...";
                            }
                            ));

            frm3.label3.BeginInvoke(
                            new Action(() =>
                            {
                                frm3.label3.Text = "";
                            }
                            ));

            frm3.label2.BeginInvoke(
                new Action(() =>
                {
                    frm3.label2.Text = "Transferindo os registros do arquivo CSV para DBF...";
                }
                ));
            

            if (Program.nErro == 0)
            {
                Transfer transfer = new Transfer();
                transfer.transfer();
            }
        }
    }
}