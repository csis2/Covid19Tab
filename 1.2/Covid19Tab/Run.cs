using System;
using System.Windows.Forms;
using System.Diagnostics;
using System.IO;

namespace Covid19Tab
{
    public class Run
    // Instanciando as classes que processará os arquivos.
    {        
        public void running()
        {
            Form1 frm1 = (Form1)Application.OpenForms["Form1"];

            var sw = new Stopwatch();
            sw.Start();

            frm1.label2.Text = "Excluindo arquivos auxiliares e arquivos desatualizados...";
            StartUp startUp = new StartUp();
            startUp.startUp();

            frm1.label2.Text = "Copiando arquivo selecionado pelo usuario e mudando a sua extensão....";
            CopyFile copyFile = new CopyFile();
            copyFile.copyFile();

            frm1.label2.Text = "Copiando o cabeçalho do arquivo 'temp_covid19.txt'...";
            if ( Program.nErro == 0 )
            {
                HeadingCopy headingCopy = new HeadingCopy();
                headingCopy.headingCopy();
            }

            // Roda script para gerar o arquivo "heading_ready.txt". Esse arquivo nao contem o
            // carriage return do arquivo "heading.txt".
            frm1.label2.Text = "Gerando o arquivo 'heading_ready.txt...";
            if (Program.nErro == 0)
            {
                RWText rwText = new RWText();
                rwText.rwText();
            }

            frm1.label2.Text = "Gerando o arquivo 'comp_return.prn'...";
            if (Program.nErro == 0)
            {
                CompareAnalyse compareAnalyse = new CompareAnalyse();
                compareAnalyse.compareAnalyse();
            }

            frm1.label2.Text = "Validando o resultado da comparação...";
            if (Program.nErro == 0)
            {
                Validate validate = new Validate();
                validate.validate();
            }

            frm1.label2.Text = "Recriando arquivo com o novo cabeçalho...";
            if (Program.nErro == 0)
            {
                Heading heading = new Heading();
                heading.heading();
            }

            frm1.label2.Text = "Verificando se alteração do cabeçalho foi bem sucedida...";
            if (Program.nErro == 0)
            {
                Verify verify = new Verify();
                verify.verify();
            }

            frm1.label2.Text = "Criando arquivo DBF molde...";
            if (Program.nErro == 0)
            {
                DbfFile dbfFile = new DbfFile();
                dbfFile.dbfFile();
            }

            frm1.label2.Text = "Verifica se arquivo DBF molde foi criado...";
            if (Program.nErro == 0)
            {
                DbfFileExist dbfFileExist = new DbfFileExist();
                dbfFileExist.dbfFileExist();
            }

            frm1.label2.Text = "Criando novos campos para tabulação...";
            if (Program.nErro == 0)
            {
                FieldCreation fieldCreation = new FieldCreation();
                fieldCreation.fieldCreation();
            }

            frm1.label2.Text = "Verificando se arquivo DBF com novos campos foi criado...";
            if (Program.nErro == 0)
            {
                NewDbfFileExist newDbfFileExist = new NewDbfFileExist();
                newDbfFileExist.newDbfFileExist();
            }

            frm1.label2.Text = "Criando arquivo para receber os dados da semana epidemiologica...";
            if (Program.nErro == 0)
            {
                EpiWeek epiWeek = new EpiWeek();
                epiWeek.epiWeek();
            }

            frm1.label2.Text = "Preenchendo a tabela criada com as semanas epidemiológicas...";
            if (Program.nErro == 0)
            {
                FillWeek fillWeek = new FillWeek();
                fillWeek.fillWeek("2020");
                fillWeek.fillWeek("2021");
            }

            frm1.label2.Text = "Executando procedimentos extra para arquivos do tipo MP3...";
            if (Program.nErro == 0 && Program.cModeloPadrao == "MP3" )
            {
                ProcedureToMP3 procedureToMP3 = new ProcedureToMP3();
                procedureToMP3.procedureToMP3();
            }

            frm1.label2.Text = "Transferindo os registros do arquivo CSV para DBF...";
            if (Program.nErro == 0)
            {
                Transfer transfer = new Transfer();
                transfer.transfer();
            }

            frm1.label2.Text = "Procurando por registros inconsistentes transferidos...";
            if (Program.nErro == 0)
            {
                Detect detect = new Detect();
                detect.detect();
            }

            frm1.label2.Text = "Obtendo dados transferidos do arquivo DBF...";
            if (Program.nErro == 0)
            {
                GetData getData = new GetData();
                getData.getData();
            }

            frm1.label2.Text = "Criando alguns arquivos indexados...";
            if (Program.nErro == 0)
            {
                Index index = new Index();
                index.index();
            }

            frm1.label2.Text = "Codificando os novos campos...";
            if (Program.nErro == 0)
            {
                LoadFields loadFields = new LoadFields();
                loadFields.loadFields();
            }

            frm1.label2.Text = "Limpando o diretório 'temp'...";
            if (Program.nErro == 0)
            {
                Clear clear = new Clear();
                clear.clear();
            }

            frm1.label2.Text = "Finalizando o processo...";
            if (Program.nErro == 0)
            {
                Finish finish = new Finish();
                finish.finish();
            }

            var cElapsedTimeHour = "0";
            var cElapsedTimeMinute = "0";
            var cElapsedTimeSecond = "0";

            sw.Stop();
            frm1.label2.Text = "Fim do processamento.";
            if (sw.Elapsed.Hours < 10)
            {
                cElapsedTimeHour = "0" + sw.Elapsed.Hours.ToString();
            }
            else
            {
                cElapsedTimeHour = sw.Elapsed.Hours.ToString();
            }

            if (sw.Elapsed.Minutes < 10)
            {
                cElapsedTimeMinute = "0" + sw.Elapsed.Minutes.ToString();
            }
            else
            {
                cElapsedTimeMinute = sw.Elapsed.Minutes.ToString();
            }

            if (sw.Elapsed.Seconds < 10)
            {
                cElapsedTimeSecond = "0" + sw.Elapsed.Seconds.ToString();
            }
            else
            {
                cElapsedTimeSecond = sw.Elapsed.Seconds.ToString();
            }

            string finalTime = cElapsedTimeHour + ":" + cElapsedTimeMinute + ":" + cElapsedTimeSecond;

            if (Program.nErro == 0)
            {
                string cMessage2 = "Fim do processamento." + Environment.NewLine + "Registros transferidos:"
                + Environment.NewLine + Program.cDisplayTxt + Environment.NewLine + Program.cDisplayDbf
                + Environment.NewLine + Program.cPercent + "%" + Environment.NewLine + "Arquivo gerado: \\baseDBF\\"
                + Path.GetFileName(Program.cFinalName) + Environment.NewLine + "Tempo de processamento: "
                + finalTime;
                string cTitle2 = "Covid19Tab";
                MessageBox.Show(cMessage2, cTitle2, 0, MessageBoxIcon.Information);
            }
        }
    }
}