using System;
using System.Windows.Forms;
using System.IO;

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

        private void button1_Click(object sender, EventArgs e)
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
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // Verificando se tudo está pronto para processar o arquivo.

            int nErro = 0;
            if (!File.Exists(Program.cPlace) && nErro == 0)
            {
                nErro = 1;
                string cMessage = "Nenhum arquivo de dados foi selecionado.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Exclamation);
            }

            int nChecked = 0;
            string cCheckItem1 = checkedListBox1.GetItemCheckState(0).ToString();
            if (cCheckItem1 == "Checked")
            {
                nChecked++;
            }
            string cCheckItem2 = checkedListBox1.GetItemCheckState(1).ToString();
            if (cCheckItem2 == "Checked")
            {
                nChecked++;
            }
            string cCheckItem3 = checkedListBox1.GetItemCheckState(2).ToString();
            if (cCheckItem3 == "Checked")
            {
                nChecked++;
            }
            if (nChecked > 1)
            {
                nErro = 1;
                string cMessage = "Só é permitido marcar um tipo de arquivo por vez.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Exclamation);
            }

            if ( nChecked == 0 && nErro == 0)
            {
                nErro = 1;
                string cMessage = "É necessário escolher o tipo de arquivo.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Exclamation);
            }        

                if (nErro == 0)
            {
                Run run = new Run();
                run.running();
            }

        }

        private void button3_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Application.Exit();
        }
    }
}