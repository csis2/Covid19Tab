using System;
using System.Diagnostics;
using System.Windows.Forms;
using System.Threading;
using System.Globalization;
using System.IO;
using System.Threading.Tasks;

namespace Covid19Tab
{
    public class Transfer
    {
        Form1 frm2 = (Form1)Application.OpenForms["Form1"];
        int valueProgressBar = 0;
        bool t = false;

        delegate void SetValueProgressBarCallback(int value);

        public void transfer()
        {
                t = true;
                Thread th = new Thread(ProgressBar_Thread);
                Thread transfer2 = new Thread(Transfer_Thread);
                
            frm2.progressBar1.BeginInvoke(
            new Action(() =>   {
            frm2.progressBar1.Value = 0;
            }
            ));

            transfer2.Start();
            th.Start(); 
        }
        private void Transfer_Thread(object obj)
        {
            var process = new Process();
            var startinfo = new ProcessStartInfo(@"C:\Covid19Tab\2.0\Covid19Tab\bin\transfer2.exe");
            switch (Program.cModeloPadrao)
            {
                case "MP1":
                    startinfo.Arguments = "MP1";
                    break;
                case "MP2":
                    startinfo.Arguments = "MP2";
                    break;
                case "MP3":
                    startinfo.Arguments = "MP3";
                    break;
                case "MP4":
                    startinfo.Arguments = "MP4";
                    break;
                case "MP5":
                    startinfo.Arguments = "MP5";
                    break;
            }
            startinfo.CreateNoWindow = true;
            startinfo.WindowStyle = ProcessWindowStyle.Hidden;
            startinfo.UseShellExecute = false;
            process.StartInfo = startinfo;
            process.Start();
            process.WaitForExit();

            if (process.ExitCode != 0)
            {
                valueProgressBar = 100;
                string cMessage = "Erro! Falha na execução do objeto 'transfer'.";
                string cTitle = "";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();
            }
            else
            {
            t = false;
            if (frm2.progressBar1.InvokeRequired)
            {
                SetValueProgressBarCallback p = new SetValueProgressBarCallback(ProgressBarValue);
                frm2.Invoke(p, new object[] { 100 });
            }
            Run2 run2 = new Run2();
            run2.running2();
            }
        }
        private void ProgressBarValue(int value)
        {
            frm2.progressBar1.Value = value;
            valueProgressBar = value;
            if (value == 100)
            {
                //button4.Enabled = true;
                t = false;
            }
        }
        private void ProgressBar_Thread()
        {
            {
                int value = 0;
                while (t)
                {
                    try
                    {
                        using (StreamReader sr = new StreamReader(@"C:\Covid19Tab\2.0\Covid19Tab\tmp\data5.txt"))
                        {
                            string[] lines = sr.ReadToEnd().Replace('\r', ' ').Split('\n');
                            if (lines.Length > 1 && lines[0] != null)
                            {
                                value = (int)float.Parse(lines[lines.Length - 2], CultureInfo.InvariantCulture);
                            }
                        }
                    }

                    catch (IOException e1)
                    {
                        Console.WriteLine(e1.Message);
                    }

                    if (frm2.progressBar1.InvokeRequired)
                    {
                        SetValueProgressBarCallback p = new SetValueProgressBarCallback(ProgressBarValue);
                        frm2.Invoke(p, new object[] { value });
                        frm2.label2.BeginInvoke(
                            new Action(() =>
                            {
                                frm2.label3.Text = value.ToString() + "%";
                            }
                            ));
                    }
                }
            }
        }
    }
}