using System;
using System.IO;
using System.Windows.Forms;
using System.Linq;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Collections;

namespace Covid19Tab
{
    public class Heading
    // Altera o nome dos campos do arquivo selecionado pelo usuário e cria, no mesmo script,
    // o arquivo "heading2.txt" que contém o cabeçalho do arquivo que foi alterado.
    {
        public void heading()
        {

            switch (Program.cModeloPadrao)
            {
                case "MP1":
                    
                    Task task1a = Task.Run(() =>
                    {
                        var lines2a = System.IO.File.ReadAllLines("C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19.txt");
                        System.IO.File.WriteAllLines("C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19.txt", lines2a.Skip(1).ToArray());
                    });
                    task1a.Wait();
                                        
                    Task task2a = Task.Run(() =>
                    {
                        string strTextFileName = "C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19.txt";
                        int iInsertAtLineNumber = 0;
                        string strTextToInsert = "nu_notific,uf_notific,munic_not,tipo_teste,res_rapido,evolucao,dt_tst_rap,est_teste,dt_encerra,classi_fin,res_tot,res_iga,res_igm,res_igg,t_sorolog,dt_tst_sor,tel_contat,uf_resid,sexo,tem_cpf,estrang,cpf,munic_res,cns,dt_nasc,passaporte,nome_mae,pais,tel_cel,nm_pacient,profsaude,cbo,cep,logradouro,numero,complement,bairro,raca_cor,prof_seg,etnia,email,comunidade,id_comunid,garganta,dispneia,febre,tosse,outros,dor_cabeca,gustativos,olfativos,coriza,assintomat,dt_notific,d_resp,d_card,diabetes,d_renais,imunosup,gestante,portador,puerpera,obesidade,dt_sintom,descricao,cnes_lab,not_cnes,not_cpf,not_email,not_nome,not_cnpj";
                        ArrayList lines = new ArrayList();
                        StreamReader rdr = new StreamReader(strTextFileName);
                        string line;

                        while ((line = rdr.ReadLine()) != null)
                            lines.Add(line);
                        rdr.Close();

                        if (lines.Count > iInsertAtLineNumber)
                            lines.Insert(iInsertAtLineNumber, strTextToInsert);
                        else

                            lines.Add(strTextToInsert);

                        StreamWriter wrtr = new StreamWriter(strTextFileName);
                        foreach (string strNewLine in lines)
                            wrtr.WriteLine(strNewLine);

                        wrtr.Close();
                    });
                    task2a.Wait();

                    Task task3a = Task.Run(() =>
                    {
                        File.Move("C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19.txt", "C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19alfa.txt");
                        string lineswitch = File.ReadLines("C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19alfa.txt").First();
                        using (StreamWriter sw = File.CreateText("C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\heading2.txt"))
                        {
                            sw.WriteLine(lineswitch);
                        }
                    });
                    task3a.Wait();
                    
                    break;
                    

























                case "MP2":
                    var lines = System.IO.File.ReadAllLines("c:\\hb30\\bin\\temp_covid19.txt");
                    System.IO.File.WriteAllLines("c:\\hb30\\bin\\temp_covid19.txt", lines.Skip(1).ToArray());
                    
                    MessageBox.Show("Processado!");

                    var allLines = File.ReadAllLines("c:\\hb30\\bin\\temp_covid19.txt");
                    allLines[0] = "2345";

                    File.WriteAllLines("c:\\hb30\\bin\\temp_covid19.txt", allLines);
                    MessageBox.Show("Processado 2!");
                    break;

                case "MP3":
                                        
                    Task task1 = Task.Run(() =>
                    {
                    var lines2 = System.IO.File.ReadAllLines("C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19.txt");
                    System.IO.File.WriteAllLines("C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19.txt", lines2.Skip(1).ToArray());
                    });
                    task1.Wait();

                    Task task2 = Task.Run(() =>
                    {
                    string strTextFileName = "C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19.txt";
                    int iInsertAtLineNumber = 0;
                    string strTextToInsert = "nu_notific,dt_notific,cpf,nm_pacient,sexo,raca_cor,dt_nasc,nome_mae,cbo,logradouro,bairro,cep,id_mn_resi,munic_res,region_res,macroresid,uf,munic_not,diabetes,cardio,d_resp,imunosup,dt_sin_pri,classific,criterio,evolucao,dt_evoluc,cnes_not,res_teste,tp_teste,dt_coleta,est_teste,profissio,fonte,idade";
                    ArrayList lines = new ArrayList();
                    StreamReader rdr = new StreamReader( strTextFileName );
                    string line;

                    while ((line = rdr.ReadLine()) != null)
                    lines.Add(line);
                    rdr.Close();

                    if (lines.Count > iInsertAtLineNumber)
                        lines.Insert(iInsertAtLineNumber, strTextToInsert);
                    else

                    lines.Add(strTextToInsert);

                    StreamWriter wrtr = new StreamWriter( strTextFileName);
                    foreach (string strNewLine in lines)
                    wrtr.WriteLine(strNewLine);

                    wrtr.Close();
                    });
                    task2.Wait();

                    Task task3 = Task.Run(() =>
                    {
                    File.Move("C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19.txt", "C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19alfa.txt");
                    string lineswitch = File.ReadLines("C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\temp_covid19alfa.txt").First();
                    using (StreamWriter sw = File.CreateText("C:\\Covid19Tab\\1.2\\Covid19Tab\\tmp\\heading2.txt"))
                    {
                        sw.WriteLine(lineswitch);
                    }
                    });
                    task3.Wait();

                    break;            
            }
                            
            if (!File.Exists(@"C:\covid19tab\1.2\covid19tab\tmp\heading2.txt"))
            {
                Program.nErro = 1;
                string cMessage = "Erro! Falha ao criar arquivo 'heading2.txt'.";
                string cTitle = "Covid19Tab";
                MessageBox.Show(cMessage, cTitle, 0, MessageBoxIcon.Error);
                System.Windows.Forms.Application.Exit();
            }
            else
            {
                Program.nErro = 0;
                Console.WriteLine(DateTime.Now + "-Alteração processada.");
            }
        }
    }
}