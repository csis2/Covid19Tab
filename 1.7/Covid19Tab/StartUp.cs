using System;
using System.IO;
using System.Diagnostics;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Covid19Tab
{
    public class StartUp
    // Exclui arquivos auxiliares e arquivos desatualizados.
    {
        public void startUp()
        {
            ProcessStartInfo startInfo1 = new ProcessStartInfo();
            startInfo1.CreateNoWindow = false;
            startInfo1.UseShellExecute = true;
            startInfo1.FileName = "cmd.exe";
            startInfo1.Arguments = "/C del C:\\Covid19Tab\\1.7\\Covid19Tab\\tmp\\*.txt";
            startInfo1.WindowStyle = ProcessWindowStyle.Hidden;
            var process1 = Process.Start(startInfo1);
            process1.WaitForExit();
            var process2 = process1.ExitCode.ToString();
            var process3 = startInfo1.FileName;
            var process4 = startInfo1.Arguments;

            ProcessStartInfo startInfo3 = new ProcessStartInfo();
            startInfo3.CreateNoWindow = false;
            startInfo3.UseShellExecute = true;
            startInfo3.FileName = "cmd.exe";
            startInfo3.Arguments = "/C del C:\\Covid19Tab\\1.7\\Covid19Tab\\tmp\\*.dbf";
            startInfo3.WindowStyle = ProcessWindowStyle.Hidden;
            var process9 = Process.Start(startInfo3);
            process9.WaitForExit();
            var process10 = process9.ExitCode.ToString();
            var process11 = startInfo3.FileName;
            var process12 = startInfo3.Arguments;

            ProcessStartInfo startInfo4 = new ProcessStartInfo();
            startInfo4.CreateNoWindow = false;
            startInfo4.UseShellExecute = true;
            startInfo4.FileName = "cmd.exe";
            startInfo4.Arguments = "/C del C:\\Covid19Tab\\1.7\\Covid19Tab\\tmp\\comp_return.prn";
            startInfo4.WindowStyle = ProcessWindowStyle.Hidden;
            var process13 = Process.Start(startInfo4);
            process13.WaitForExit();
            var process14 = process13.ExitCode.ToString();
            var process15 = startInfo3.FileName;
            var process16 = startInfo3.Arguments;

            ProcessStartInfo startInfo5 = new ProcessStartInfo();
            startInfo5.CreateNoWindow = false;
            startInfo5.UseShellExecute = true;
            startInfo5.FileName = "cmd.exe";
            startInfo5.Arguments = "/C del C:\\Covid19Tab\\1.7\\Covid19Tab\\rel\\*.txt";
            startInfo5.WindowStyle = ProcessWindowStyle.Hidden;
            var process17 = Process.Start(startInfo5);
            process17.WaitForExit();
            var process18 = process13.ExitCode.ToString();
            var process19 = startInfo3.FileName;
            var process20 = startInfo3.Arguments;

            Task task10 = Task.Run(() =>
            {
                static void KillProcess(string name, bool waitForExit = true)
            {
                foreach (var process in Process.GetProcessesByName(name))
                {
                    try
                    {
                        process.Kill();
                        if (waitForExit)
                        {
                            process.WaitForExit();
                        }
                    }
                    catch (Exception ex)
                    {

                    }

                }
            }

            KillProcess("getdata", true);
            KillProcess("field_creation", true);
            KillProcess("load_fields", true);
            KillProcess("dbf_file", true);
            KillProcess("rwtext", true);
            KillProcess("transfer2", true);
            KillProcess("detect", true);
            KillProcess("index", true);
            KillProcess("epidemio", true);
            KillProcess("fill_week", true);
            KillProcess("save", true);
            KillProcess("testa_dbf", true);
            KillProcess("cecho", true);
            KillProcess("filter_one", true);
            });
            task10.Wait();
        }
    }
}