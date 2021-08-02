using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Covid19Tab
{
    static class Program
    {
        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
		
		public static string cPlace, cModeloPadrao, cFileName, cFileNameWithoutExt, cFinalName;
        public static string cDisplayTxt, cDisplayDbf, cPercent, cUf, cDbf_Sinan;
        public static int nErro, nError_task;
        public static string cVersion = "1.7";
        public static DateTime DataHoraAbertura;
        public static TimeSpan DiferencaDataHora;
		
        [STAThread]
        static void Main()
        {
            Application.SetHighDpiMode(HighDpiMode.SystemAware);
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Form1());
        }
    }
}
