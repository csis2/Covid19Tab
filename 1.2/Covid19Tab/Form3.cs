using System;
using System.Diagnostics;
using System.Net;
using System.Windows.Forms;
using System.Threading.Tasks;
using System.IO;
using System.Linq;
using System.Drawing;

namespace Covid19Tab
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Process cmd = new Process();
            cmd.StartInfo.FileName = "cmd.exe";
            cmd.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
            cmd.StartInfo.CreateNoWindow = true;
            cmd.StartInfo.Arguments = "/c start https://github.com/csis2/Covid19Tab";
            cmd.Start();
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            ProcessStartInfo startInfo1 = new ProcessStartInfo();
            startInfo1.CreateNoWindow = false;
            startInfo1.UseShellExecute = true;
            startInfo1.FileName = "cmd.exe";
            startInfo1.Arguments = "/C del C:\\Covid19Tab\\1.2\\Covid19Tab\\set\\version.txt";
            startInfo1.WindowStyle = ProcessWindowStyle.Hidden;
            var process1 = Process.Start(startInfo1);
            process1.WaitForExit();
            var process2 = process1.ExitCode.ToString();
            var process3 = startInfo1.FileName;
            var process4 = startInfo1.Arguments;

            Task task20 = Task.Run(() =>
            {
                WebClient wb = new WebClient();
                try
                {
                    wb.DownloadFile("https://raw.githubusercontent.com/csis2/Covid19Tab/master/covid19tab_version.txt", @"c:\covid19tab\1.2\covid19tab\set\version.txt");
                    Program.nError_task = 0;
                }
                catch
                {
                    Program.nError_task = 1;
                }
            });
            task20.Wait();

            Task task21 = Task.Run(() =>
            {
                if (Program.nError_task == 0)
                {
                    if (File.Exists(@"C:\Covid19Tab\1.2\Covid19Tab\set\version.txt"))
                    {
                        Program.nError_task = 0;
                    }
                    else
                    {
                        Program.nError_task = 1;
                    }
                }
            });
            task21.Wait();

                if (Program.nError_task == 0)
                {
                    string line1 = File.ReadLines(@"C:\Covid19Tab\1.2\Covid19Tab\set\version.txt").First();
                    if (line1 == Program.cVersion)
                    {
                    label4.ForeColor = Color.Blue;
                    label4.Text = "versão atualizada.";
                    }
                    else
                    {
                    label4.ForeColor = Color.Red;
                    label4.Text = "versão desatualizada.";
                    }
                }
        }
    }
}
