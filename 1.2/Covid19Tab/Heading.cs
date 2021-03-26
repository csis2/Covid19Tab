using System;
using System.IO;
using System.Diagnostics;
using System.Windows.Forms;

namespace Covid19Tab
{
    public class Heading
    // Altera o nome dos campos do arquivo selecionado pelo usuário e cria, no mesmo script,
    // o arquivo "heading2.txt" que contém o cabeçalho do arquivo que foi alterado.
    {
        public void heading()
        {
            ProcessStartInfo startInfo1 = new ProcessStartInfo();
            startInfo1.CreateNoWindow = false;
            startInfo1.UseShellExecute = true;
            startInfo1.FileName = "cmd.exe";
            startInfo1.Arguments = "/C cd\\&&cd C:\\covid19tab\\1.2\\covid19tab\\bin &&sed 1d C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19.txt > C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19alfa.txt&&sed -i 1i\\nu_notific;dt_notific;cpf;nm_pacient;sexo;raca_cor;dt_nasc;nu_idade_n;cbo;id_mn_resi;munic_res;regio_res;macroresid;uf;dt_sin_pri;diabetes;cardio;d_resp;imunosup;classific;criterio;evolucao;dt_evoluc;cnes_not;res_teste;tp_teste;est_teste;profissio;fonte;classivep;internacao;dt_inter;inter_uti;dt_int_uti;dt_sai_uti;puerpera;hemato;sind_down;hepat_cron;neuro_cron;renal_cron;obesidade;gestante;febre;tosse;dor_gargan;dispneia;desc_resp;saturacao;diarreia;vomito;out_sint2;condicoes;etnia_ind;out_sint;doen_renal;doen_cromo;sem_epi_si;ano_epi_si;sem_epi_ev;ano_epi_ev;sem_epi_in;ano_epi_in;sem_epi_no;ano_epi_no C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19alfa.txt&&sed -n 1p C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19alfa.txt > C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\heading2.txt";
            startInfo1.WindowStyle = ProcessWindowStyle.Normal;
            var process1 = Process.Start(startInfo1);
            process1.WaitForExit();
            var process2 = process1.ExitCode.ToString();
            var process3 = startInfo1.FileName;
            var process4 = startInfo1.Arguments;

            if (!File.Exists(@"C:\covid19tab\1.2\covid19tab\tmp\heading2.txt"))
            {
                string cMessage = "Erro! Falha ao criar arquivo 'heading2.txt'.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();

                /*
                Console.WriteLine(DateTime.Now + "-Erro! Falha ao criar arquivo 'heading2.txt'.");
                Console.WriteLine("Pressione qualquer tecla.");
                Console.Read();
                Environment.Exit(1);
                */
            }
            else
            {
                Console.WriteLine(DateTime.Now + "-Alteração processada.");
            }

        }
    }
}