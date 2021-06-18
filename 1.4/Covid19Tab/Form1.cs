using System;
using System.Windows.Forms;
using System.Linq;
using System.IO;
using System.Diagnostics;
using System.Threading.Tasks;
using System.Threading;
using System.Globalization;

namespace Covid19Tab
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            SelectFile selectFile = new SelectFile();
            selectFile.selectFile();
            label1.Text = Program.cPlace;
        }

        private void checkedListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*
            string cCheckItemTeste2 = checkedListBox1.GetItemCheckState(2).ToString();
            if (cCheckItemTeste2 == "Checked")
            {
                MessageBox.Show("Tipo de arquivo ainda não disponível nessa versão.");
                checkedListBox1.SetItemChecked(2, false);
            }
            */
        }
        private void button2_Click(object sender, EventArgs e)
        {
            // Verificando se tudo está pronto para processar o arquivo.

            progressBar1.Value = 0;
            label3.Text = "";
            int nError = 0;
            if (!File.Exists(Program.cPlace) && nError == 0)
            {
                nError = 1;
                string cMessage = "Nenhum arquivo de dados foi selecionado.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Exclamation);
            }

            int nChecked = 0;
            string cCheckItem1 = checkedListBox1.GetItemCheckState(0).ToString();
            if (cCheckItem1 == "Checked")
            {
                nChecked++;
                Program.cModeloPadrao = "MP1";
            }
            string cCheckItem2 = checkedListBox1.GetItemCheckState(1).ToString();
            if (cCheckItem2 == "Checked")
            {
                nChecked++;
                Program.cModeloPadrao = "MP2";
            }
            string cCheckItem3 = checkedListBox1.GetItemCheckState(2).ToString();
            if (cCheckItem3 == "Checked")
            {
                nChecked++;
                Program.cModeloPadrao = "MP3";
            }
            if (nChecked > 1)
            {
                nError = 1;
                string cMessage = "Só é permitido marcar um tipo de arquivo por vez.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Exclamation);
            }

            if (nChecked == 0 && nError == 0)
            {
                nError = 1;
                string cMessage = "É necessário escolher o tipo de arquivo.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Exclamation);
            }

            if (nError == 0)
            {
                if (Program.cUf == String.Empty)
                {
                    nError = 1;
                    string cMessage = "O programa não está configurado. Acessar a" + Environment.NewLine + "janela principal -> Menu -> Configuração";
                    string cTitle = "Covid19Tab";
                    MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Exclamation);
                }
            }

            if (nError == 0)
            {
                if (Program.cDbf_Sinan == String.Empty)
                {
                    nError = 1;
                    string cMessage = "O programa não está configurado. Acessar a" + Environment.NewLine + "janela principal -> Menu -> Configurações";
                    string cTitle = "Covid19Tab";
                    MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Exclamation);
                }
            }

            if (nError == 0)
            {
                TestaDbfSinan testaDbfSinan = new TestaDbfSinan();
                testaDbfSinan.testaDbfSinan();
            }

            if (nError == 0 && Program.nErro == 0)
            {
                button2.Enabled = false;
                button1.Enabled = false;
                checkedListBox1.Enabled = false;
                menuStrip1.Enabled = false;

                Run run = new Run();
                run.running();
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Application.Exit();
        }

        public void Form1_Load(object sender, EventArgs e)
        {
            BeforeStart beforeStart = new BeforeStart();
            beforeStart.beforeStart();
        }

        private void toolStripMenuItem3_Click(object sender, EventArgs e)
        {
            Form2 OutroForm = new Form2();
            OutroForm.ShowDialog();
        }

        private void menuStrip1_ItemClicked_1(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void toolStripMenuItem2_Click(object sender, EventArgs e)
        {
            Form3 OutroForm = new Form3();
            OutroForm.ShowDialog();
        }

        private void toolStripMenuItem4_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Application.Exit();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            Program.DiferencaDataHora = (DateTime.Now).Subtract(Program.DataHoraAbertura);
        }
    }
}