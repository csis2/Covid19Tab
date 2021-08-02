using System;
using System.Windows.Forms;
using System.Diagnostics;
using System.IO;
using System.Threading;
using System.Globalization;

namespace Covid19Tab
{
    public class Run
    // Instanciando as classes que processará os arquivos.
    {
        public void running()
        {
            Form1 frm1 = (Form1)Application.OpenForms["Form1"];

            Program.DataHoraAbertura = DateTime.Now;
            frm1.timer1.Start();

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

            // Roda script para gerar o arquivo "heading_ready.txt". Esse arquivo nao contem o carriage return
            // do arquivo "heading.txt".
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

            frm1.label2.Text = "Rodando o pre filtro...";
            if (Program.nErro == 0)
            {
                PreFiltro preFiltro = new PreFiltro();
                preFiltro.preFiltro();
            }
        }
    }
}