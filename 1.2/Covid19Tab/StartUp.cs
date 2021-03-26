using System;
using System.IO;
using System.Diagnostics;
using System.Collections.Generic;
using System.Text;

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
            startInfo1.Arguments = "/C del C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\*.txt";
            startInfo1.WindowStyle = ProcessWindowStyle.Normal;
            var process1 = Process.Start(startInfo1);
            process1.WaitForExit();
            var process2 = process1.ExitCode.ToString();
            var process3 = startInfo1.FileName;
            var process4 = startInfo1.Arguments;

            ProcessStartInfo startInfo2 = new ProcessStartInfo();
            startInfo2.CreateNoWindow = false;
            startInfo2.UseShellExecute = true;
            startInfo2.FileName = "cmd.exe";
            startInfo2.Arguments = "/C del C:\\Covid19Tab\\1.2\\Covid19Tab\\bin\\sed??????";
            startInfo2.WindowStyle = ProcessWindowStyle.Normal;
            var process5 = Process.Start(startInfo2);
            process5.WaitForExit();
            var process6 = process5.ExitCode.ToString();
            var process7 = startInfo2.FileName;
            var process8 = startInfo2.Arguments;

            ProcessStartInfo startInfo3 = new ProcessStartInfo();
            startInfo3.CreateNoWindow = false;
            startInfo3.UseShellExecute = true;
            startInfo3.FileName = "cmd.exe";
            startInfo3.Arguments = "/C del C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\*.dbf";
            startInfo3.WindowStyle = ProcessWindowStyle.Normal;
            var process9 = Process.Start(startInfo3);
            process9.WaitForExit();
            var process10 = process9.ExitCode.ToString();
            var process11 = startInfo3.FileName;
            var process12 = startInfo3.Arguments;

            ProcessStartInfo startInfo4 = new ProcessStartInfo();
            startInfo4.CreateNoWindow = false;
            startInfo4.UseShellExecute = true;
            startInfo4.FileName = "cmd.exe";
            startInfo4.Arguments = "/C del C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\comp_return.prn";
            startInfo4.WindowStyle = ProcessWindowStyle.Normal;
            var process13 = Process.Start(startInfo4);
            process13.WaitForExit();
            var process14 = process13.ExitCode.ToString();
            var process15 = startInfo3.FileName;
            var process16 = startInfo3.Arguments;

        }
    }
}