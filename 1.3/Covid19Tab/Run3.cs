using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;

namespace Covid19Tab
{
    public class Run3
    {
        public void running3()
        {
            Form1 frm4 = (Form1)Application.OpenForms["Form1"];
            frm4.label2.BeginInvoke(
                            new Action(() =>
                            {
                                frm4.label2.Text = "Limpando o diretório 'temp'...";
                            }
                            ));

            if (Program.nErro == 0)
            {
                Clear clear = new Clear();
                clear.clear();
            }

            frm4.label2.BeginInvoke(
                            new Action(() =>
                            {
                                frm4.label2.Text = "Finalizando o processo...";
                            }
                            ));

            frm4.label2.Text = "Finalizando o processo...";
            if (Program.nErro == 0)
            {
                Finish finish = new Finish();
                finish.finish();
            }

            frm4.label2.BeginInvoke(
                            new Action(() =>
                            {
                                frm4.label2.Text = "Fim do processamento...";
                            }
                            ));

            frm4.timer1.Stop();
            Program.DiferencaDataHora = (DateTime.Now).Subtract(Program.DataHoraAbertura);

            if (Program.nErro == 0)
            {
                string cMessage2 = "Fim do processamento." + Environment.NewLine + "Registros transferidos:"
                + Environment.NewLine + Program.cDisplayTxt + Environment.NewLine + Program.cDisplayDbf
                + Environment.NewLine + Program.cPercent + "%" + Environment.NewLine + "Arquivo gerado: "
                + Program.cFinalName + Environment.NewLine + "Tempo de processamento: " + (Program.DiferencaDataHora.ToString()).Substring(1,8);
                string cTitle2 = "Covid19Tab";
                MessageBox.Show(cMessage2, cTitle2, 0, MessageBoxIcon.Information);

                frm4.button2.BeginInvoke(
                            new Action(() =>
                            {
                                frm4.button2.Enabled = true;
                            }
                            ));


                frm4.button1.BeginInvoke(                    
                            new Action(() =>
                            {
                                frm4.button1.Enabled = true;
                            }
                            ));

                frm4.checkedListBox1.BeginInvoke(
                            new Action(() =>
                            {
                                frm4.checkedListBox1.Enabled = true;
                            }
                            ));

                frm4.menuStrip1.BeginInvoke(
                            new Action(() =>
                            {
                                frm4.menuStrip1.Enabled = true;
                            }
                            ));

                BeforeStart beforeStart = new BeforeStart();
                beforeStart.beforeStart();
            }            
        }
    }
}