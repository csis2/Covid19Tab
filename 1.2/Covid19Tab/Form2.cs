using System;
using System.Windows.Forms;

namespace Covid19Tab
{
    public partial class Form2 : Form
    {
        static string cSinan = "";
        public Form2()
        {
            InitializeComponent();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int nErro = 0;
            int nUF = comboBox1.SelectedIndex;
            int nArquivosDBF = comboBox2.SelectedIndex;

            if (nUF < 0)
            {
                nErro = 1;
                string cMessage = "Nenhuma UF foi selecionada.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Exclamation);
            }

            if (nArquivosDBF < 0 && nErro == 0)
            {
                nErro = 1;
                string cMessage = "Não foi indicado o lugar onde os arquivos do Sinan Net estão.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Exclamation);
            }

            if (nErro == 0)
            {
                String cUF = comboBox1.SelectedItem.ToString();
                Program.cUf = cUF;
                String cDbf_Sinan = comboBox2.SelectedItem.ToString();
                Program.cDbf_Sinan = cDbf_Sinan;

                SaveSettings saveSettings = new SaveSettings();
                saveSettings.saveSettings("writer");

                string cMessage = "Configuração realizada com sucesso.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Information);
                this.Dispose();
            }
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            string cSiglaUF = Program.cUf;
            switch (cSiglaUF)
            {
                case "AC":
                    comboBox1.SelectedIndex = 0;
                    break;
                case "AL":
                    comboBox1.SelectedIndex = 1;
                    break;
                case "AM":
                    comboBox1.SelectedIndex = 2;
                    break;
                case "AP":
                    comboBox1.SelectedIndex = 3;
                    break;
                case "BA":
                    comboBox1.SelectedIndex = 4;
                    break;
                case "CE":
                    comboBox1.SelectedIndex = 5;
                    break;
                case "DF":
                    comboBox1.SelectedIndex = 6;
                    break;
                case "ES":
                    comboBox1.SelectedIndex = 7;
                    break;
                case "GO":
                    comboBox1.SelectedIndex = 8;
                    break;
                case "MA":
                    comboBox1.SelectedIndex = 9;
                    break;
                case "MG":
                    comboBox1.SelectedIndex = 10;
                    break;
                case "MS":
                    comboBox1.SelectedIndex = 11;
                    break;
                case "MT":
                    comboBox1.SelectedIndex = 12;
                    break;
                case "PA":
                    comboBox1.SelectedIndex = 13;
                    break;
                case "PB":
                    comboBox1.SelectedIndex = 14;
                    break;
                case "PE":
                    comboBox1.SelectedIndex = 15;
                    break;
                case "PI":
                    comboBox1.SelectedIndex = 16;
                    break;
                case "PR":
                    comboBox1.SelectedIndex = 17;
                    break;
                case "RJ":
                    comboBox1.SelectedIndex = 18;
                    break;
                case "RN":
                    comboBox1.SelectedIndex = 19;
                    break;
                case "RO":
                    comboBox1.SelectedIndex = 20;
                    break;
                case "RR":
                    comboBox1.SelectedIndex = 21;
                    break;
                case "RS":
                    comboBox1.SelectedIndex = 22;
                    break;
                case "SC":
                    comboBox1.SelectedIndex = 23;
                    break;
                case "SE":
                    comboBox1.SelectedIndex = 24;
                    break;
                case "SP":
                    comboBox1.SelectedIndex = 25;
                    break;
                case "TO":
                    comboBox1.SelectedIndex = 26;
                    break;
                default:
                    comboBox1.SelectedIndex = -1;
                    break;
            }
            try
            {
                Form2.cSinan = Program.cDbf_Sinan.Substring(0, 1);
            }
            catch
            {
                Form2.cSinan = "";
            }
            switch (Form2.cSinan)
            {
                case "1":
                    comboBox2.SelectedIndex = 0;
                    break;
                case "2":
                    comboBox2.SelectedIndex = 1;
                    break;
                default:
                    comboBox2.SelectedIndex = -1;
                    break;
            }
        }
    }
}