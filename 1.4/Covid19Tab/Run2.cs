using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;

namespace Covid19Tab
{
    public class Run2
    {
        public void running2()
        {
            Form1 frm3 = (Form1)Application.OpenForms["Form1"];

            frm3.progressBar1.BeginInvoke(
                            new Action(() =>
                            {
                            frm3.progressBar1.Value = 0;
                            }
                            ));

            frm3.label2.BeginInvoke(
                            new Action(() =>
                            {
                            frm3.label2.Text = "Procurando por registros inconsistentes transferidos...";
                            }
                            ));

            frm3.label3.BeginInvoke(
                            new Action(() =>
                            {
                                frm3.label3.Text = "";
                            }
                            ));

            if (Program.nErro == 0)
            {
                Detect detect = new Detect();
                detect.detect();
            }

            frm3.label2.BeginInvoke(
                            new Action(() =>
                            {
                                frm3.label2.Text = "Obtendo dados transferidos do arquivo DBF...";
                            }
                            ));

            if (Program.nErro == 0)
            {
                GetData getData = new GetData();
                getData.getData();
            }

            frm3.label2.BeginInvoke(
                            new Action(() =>
                            {
                                frm3.label2.Text = "Criando alguns arquivos indexados...";
                            }
                            ));

            if (Program.nErro == 0)
            {
                Index index = new Index();
                index.index();
            }

            frm3.label2.BeginInvoke(
                            new Action(() =>
                            {
                                frm3.label2.Text = "Codificando os novos campos...";
                            }
                            ));

            if (Program.nErro == 0)
            {
                LoadFields loadFields = new LoadFields();
                loadFields.loadFields();
            }
        }
    }
}
