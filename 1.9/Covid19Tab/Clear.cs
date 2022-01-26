using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Diagnostics;
using System.Threading.Tasks;

namespace Covid19Tab
{
    public class Clear
    {
        public void clear()
        {               
            ProcessStartInfo startInfo1 = new ProcessStartInfo();
            startInfo1.CreateNoWindow = false;
            startInfo1.UseShellExecute = true;
            startInfo1.FileName = "cmd.exe";
            startInfo1.Arguments = "/C del C:\\Covid19Tab\\1.9\\Covid19Tab\\tmp\\*.txt";
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
            startInfo3.Arguments = "/C del C:\\Covid19Tab\\1.9\\Covid19Tab\\tmp\\*.ntx";
            startInfo3.WindowStyle = ProcessWindowStyle.Hidden;
            var process9 = Process.Start(startInfo3);
            process9.WaitForExit();
            var process10 = process9.ExitCode.ToString();
            var process11 = startInfo3.FileName;
            var process12 = startInfo3.Arguments;

            Task task10 = Task.Run(() =>
            {
                File.Delete(@"C:\Covid19Tab\1.9\Covid19Tab\tmp\molde1.dbf");
                File.Delete(@"C:\Covid19Tab\1.9\Covid19Tab\tmp\molde2.dbf");
                File.Delete(@"C:\Covid19Tab\1.9\Covid19Tab\tmp\molde4.dbf");
                File.Delete(@"C:\Covid19Tab\1.9\Covid19Tab\tmp\weeks_table.dbf");
                File.Delete(@"C:\Covid19Tab\1.9\Covid19Tab\tmp\comp_return.prn");
            });
            task10.Wait();            
        }
    }
}
