using System;
using System.Collections.Generic;
using System.Text;

namespace Covid19Tab
{
    public class Run
    // Instanciando as classes que processará os arquivos.
    {        
        public void running()
        {
            // Exclui arquivos auxiliares e arquivos desatualizados.
            StartUp startUp = new StartUp();
            startUp.startUp();

            // Copiando arquivo selecionado pelo usuario e mudando a sua extensão....
            CopyFile copyFile = new CopyFile();
            copyFile.copyFile();

            // Copia o cabecalho do arquivo 'temp_covid19.txt'.
            HeadingCopy headingCopy = new HeadingCopy();
            headingCopy.headingCopy();

            // Roda script para gerar o arquivo "heading_ready.txt". Esse arquivo nao contem o
            // carriage return do arquivo "heading.txt".
            RWText rwText = new RWText();
            rwText.rwText();

            // Gerando o arquivo 'comp_return.prn'...
            CompareAnalyse compareAnalyse = new CompareAnalyse();
            compareAnalyse.compareAnalyse();

            // Validando o resultado da comparação...
            Validate validate = new Validate();
            validate.validate();

            // Recriando arquivo com o novo cabeçalho...
            Heading heading = new Heading();
            heading.heading();

            // Verificando se alteração do cabeçalho foi bem sucedida...
            Verify verify = new Verify();
            verify.verify();

            // Criando arquivo DBF molde...
            DbfFile dbfFile = new DbfFile();
            dbfFile.dbfFile();

            // Cria novos campos para tabulação...
            FieldCreation fieldCreation = new FieldCreation();
            fieldCreation.fieldCreation();

            // Transferindo os regitros do arquivo CSV para DBF...
            Transfer transfer = new Transfer();
            transfer.transfer();

            // Obtendo dados transferidos do arquivo DBF...
            GetData getData = new GetData();
            getData.getData();

            // Codificando os novos campos...
            LoadFields loadFields = new LoadFields();
            loadFields.loadFields();
        }
    }
}