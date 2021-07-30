PROCEDURE Main()

* CSIS Software 2021
* Script para criar arquivos DBF.
* "------------------------------------------------------------------------"
* "Compilado no Harbour Make (hbmk2) versao 3.0.0"
* "Roda somente com argumento de entrada."
* "Exemplo: DBF_file.exe run"
* "------------------------------------------------------------------------"

* Verifica se existe argumento.
if empty(HB_ArgV(1)) = .T.
set color to r+/
? "Erro! O programa precisa que voce forneca argumento de entrada."
__Quit()
endif

* Verifica se o argumento é valido.
set exact on
if (HB_ArgV(1)) <> "MP1" .and. (HB_ArgV(1)) <> "MP2" .and. (HB_ArgV(1)) <> "MP3" .and. (HB_ArgV(1)) <> "MP4"
set color to r+/
? "Erro! O argumento escolhido nao e valido."
__Quit()
endif

if (HB_ArgV(1)) = "MP1"
* Criando e atribuindo valor às variáveis principais.

cMolde1 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde1.dbf" )
cMolde2 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde2.dbf" )
cMolde3 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde3.dbf" )
cMolde4 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde4.dbf" )

* Cria o arquivo dbf que receberá os dados do arquivo csv.
	
aStruct := { { "nu_notific","C",22,0 }, ; //1
			 { "uf_notific","C",27,0 }, ; //2
			 { "munic_not","C",35,0 }, ; //3
			 { "tipo_teste", "C", 54, 0 }, ; //4
			 { "res_rapido", "C", 1, 0 }, ; //5
			 { "evolucao", "C", 24, 0 }, ; //6
			 { "dt_tst_rap", "D", 10, 0 }, ; //7
			 { "est_teste", "C", 21, 0 }, ; //8
			 { "dt_encerra", "D", 10, 0 }, ; //9
			 { "classi_fin", "C", 35, 0 }} //10
			 dbcreate (( cMolde1 ),aStruct )

use ( cMolde1 )
copy to ( cMolde2 )

* Acrescenta campos novos.
				use ( cMolde2 ) new
				aStruct2 := dbStruct( cMolde2 )
				AADD(aStruct2, { "res_tot", "C", 1, 0 }) //11
				AADD(aStruct2, { "res_iga", "C", 1, 0 }) //12
				AADD(aStruct2, { "res_igm", "C", 1, 0 }) //13
				AADD(aStruct2, { "res_igg", "C", 1, 0 }) //14
				AADD(aStruct2, { "t_sorolog", "C", 27, 0 }) //15
				AADD(aStruct2, { "dt_tst_sor", "D", 10, 0 }) //16
				AADD(aStruct2, { "tel_contat", "C", 15, 0 }) //17
				AADD(aStruct2, { "uf_reside", "C", 27, 0 }) //18
				AADD(aStruct2, { "sexo", "C", 1, 0 }) //19
				AADD(aStruct2, { "tem_cpf", "C", 1, 0 }) //20
				
				AADD(aStruct2, { "estrang", "C", 1, 0 }) //21
				AADD(aStruct2, { "cpf", "C", 14, 0 }) //22
				AADD(aStruct2, { "munic_res", "C", 27, 0 }) //23
				AADD(aStruct2, { "cns", "C", 20, 0 }) //24
				AADD(aStruct2, { "dt_nasc", "D", 10, 0 }) //25
				AADD(aStruct2, { "passaporte", "C", 15, 0 }) //26
				AADD(aStruct2, { "nome_mae", "C", 70, 0 }) //27
				AADD(aStruct2, { "pais", "C", 15, 0 }) //28
				AADD(aStruct2, { "tel_cel", "C", 15, 0 }) //29
				AADD(aStruct2, { "nm_pacient", "C", 70, 0 }) //30		
				
				AADD(aStruct2, { "profsaude", "C", 1, 0 })	//31
				AADD(aStruct2, { "cbo", "C", 50, 0 }) //32
				AADD(aStruct2, { "cep", "C", 10, 0 }) //33
				AADD(aStruct2, { "logradouro", "C", 50, 0 }) //34
				AADD(aStruct2, { "numero", "C", 10, 0 }) //35
				AADD(aStruct2, { "complement", "C", 40, 0 }) //36
				AADD(aStruct2, { "bairro", "C", 30, 0 }) //37	
				AADD(aStruct2, { "raca_cor", "C", 8, 0 }) //38
				AADD(aStruct2, { "prof_seg", "C", 1, 0 }) //39
				AADD(aStruct2, { "etnia", "C", 20, 0 })	//40
				
				AADD(aStruct2, { "email", "C", 40, 0 }) //41
				AADD(aStruct2, { "comunidade", "C", 1, 0 }) //42
				AADD(aStruct2, { "id_comunid", "C", 37, 0 }) //43
				AADD(aStruct2, { "garganta", "C", 1, 0 }) //44
				AADD(aStruct2, { "dispneia", "C", 1, 0 }) //45
				AADD(aStruct2, { "febre", "C", 1, 0 }) //46	
				AADD(aStruct2, { "tosse", "C", 1, 0 }) //47		
				AADD(aStruct2, { "outros", "C", 1, 0 }) //48
				AADD(aStruct2, { "dor_cabeca", "C", 1, 0 }) //49
				AADD(aStruct2, { "gustativos", "C", 1, 0 }) //50
				
				AADD(aStruct2, { "olfativos", "C", 1, 0 }) //51
				AADD(aStruct2, { "coriza", "C", 1, 0 }) //52
				AADD(aStruct2, { "assintomat", "C", 1, 0 }) //53
				AADD(aStruct2, { "dt_notific", "D", 10, 0 })	//54
				AADD(aStruct2, { "d_resp", "C", 1, 0 }) //55
				AADD(aStruct2, { "d_card", "C", 1, 0 }) //56
				AADD(aStruct2, { "diabetes", "C", 1, 0 }) //57
				AADD(aStruct2, { "d_renais", "C", 1, 0 }) //58
				AADD(aStruct2, { "imunosup", "C", 1, 0 }) //59
				AADD(aStruct2, { "gestante", "C", 1, 0 }) //60
				
				AADD(aStruct2, { "portador", "C", 1, 0 })	//61
				AADD(aStruct2, { "puerpera", "C", 1, 0 }) //62
				AADD(aStruct2, { "obesidade", "C", 1, 0 }) //63
				AADD(aStruct2, { "dt_sintom", "D", 10, 0 }) //64
				AADD(aStruct2, { "descricao", "C", 35, 0 }) //65		
				AADD(aStruct2, { "cnes_lab", "C", 15, 0 }) //66				
				AADD(aStruct2, { "not_cnes", "C", 15, 0 }) //67		
				AADD(aStruct2, { "not_cpf", "C", 14, 0 }) //68	
				AADD(aStruct2, { "not_email", "C", 40, 0 }) //69
				AADD(aStruct2, { "not_nome", "C", 70, 0 }) //70
				
				AADD(aStruct2, { "not_cnpj", "C", 20, 0 }) //71							
				dbCreate( (cMolde3 ) , aStruct2 )	   
close ( cMolde1 )

rename (cMolde3) to (cMolde4)

endif

if (HB_ArgV(1)) = "MP2"
* Criando e atribuindo valor às variáveis principais.

cMolde1 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde1.dbf" )
cMolde2 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde2.dbf" )
cMolde3 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde3.dbf" )
cMolde4 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde4.dbf" )

* Cria o arquivo dbf que receberá os dados do arquivo csv.
	
aStruct := { { "nu_notific","C",22,0 }, ; //1
			 { "dt_notific","D",10,0 }, ; //2
			 { "cpf","C",14,0 }, ; //3
			 { "nm_pacient", "C", 50, 0 }, ; //4
			 { "sexo", "C", 1, 0 }, ; //5
			 { "raca_cor", "C", 10, 0 }, ; //6
			 { "dt_nasc", "D", 10, 0 }, ; //7
			 { "idade", "C", 5, 0 }, ; //8
			 { "cbo", "C", 50, 0 }, ; //9
			 { "id_mn_resi", "C", 6, 0 }} //10
			 dbcreate (( cMolde1 ),aStruct )

use ( cMolde1 )
copy to ( cMolde2 )

* Acrescenta campos novos.
				use ( cMolde2 ) new
				aStruct2 := dbStruct( cMolde2 )
				AADD(aStruct2, { "munic_res", "C", 35, 0 }) //11
				AADD(aStruct2, { "region_res", "C", 30, 0 }) //12
				AADD(aStruct2, { "macroresid", "C", 30, 0 }) //13
				AADD(aStruct2, { "uf", "C", 2, 0 }) //14
				AADD(aStruct2, { "dt_sin_pri", "D", 10, 0 }) //15
				AADD(aStruct2, { "diabetes", "C", 1, 0 }) //16
				AADD(aStruct2, { "cardio", "C", 1, 0 }) //17
				AADD(aStruct2, { "d_resp", "C", 1, 0 }) //18
				AADD(aStruct2, { "imunosup", "C", 1, 0 }) //19
				AADD(aStruct2, { "classific", "C", 32, 0 }) //20
				
				AADD(aStruct2, { "criterio", "C", 22, 0 }) //21
				AADD(aStruct2, { "evolucao", "C", 24, 0 }) //22
				AADD(aStruct2, { "dt_evoluc", "D", 10, 0 }) //23
				AADD(aStruct2, { "cnes_not", "C", 10, 0 }) //24
				AADD(aStruct2, { "res_teste", "C", 12, 0 }) //25
				AADD(aStruct2, { "tp_teste", "C", 22, 0 }) //26
				AADD(aStruct2, { "est_teste", "C", 10, 0 }) //27
				AADD(aStruct2, { "profissio", "C", 1, 0 }) //28
				AADD(aStruct2, { "fonte", "C", 10, 0 }) //29
				AADD(aStruct2, { "clas_sivep", "C", 17, 0 }) //30		
				
				AADD(aStruct2, { "internacao", "C", 1, 0 })	//31
				AADD(aStruct2, { "dt_inter", "D", 10, 0 }) //32
				AADD(aStruct2, { "inter_uti", "C", 1, 0 }) //33
				AADD(aStruct2, { "dt_int_uti", "D", 10, 0 }) //34
				AADD(aStruct2, { "dt_sai_uti", "D", 10, 0 }) //35
				AADD(aStruct2, { "puerpera", "C", 1, 0 }) //36
				AADD(aStruct2, { "hemato", "C", 1, 0 }) //37	
				AADD(aStruct2, { "sind_down", "C", 1, 0 }) //38
				AADD(aStruct2, { "hepat_cron", "C", 1, 0 }) //39
				AADD(aStruct2, { "neuro_cron", "C", 1, 0 })	//40
				
				AADD(aStruct2, { "renal_cron", "C", 1, 0 }) //41
				AADD(aStruct2, { "obesidade", "C", 1, 0 }) //42
				AADD(aStruct2, { "gestante", "C", 1, 0 }) //43
				AADD(aStruct2, { "febre", "C", 1, 0 }) //44
				AADD(aStruct2, { "tosse", "C", 1, 0 }) //45
				AADD(aStruct2, { "dor_gargan", "C", 1, 0 }) //46	
				AADD(aStruct2, { "dispneia", "C", 1, 0 }) //47		
				AADD(aStruct2, { "desc_resp", "C", 1, 0 }) //48
				AADD(aStruct2, { "saturacao", "C", 1, 0 }) //49
				AADD(aStruct2, { "diarreia", "C", 1, 0 }) //50
				
				AADD(aStruct2, { "vomito", "C", 1, 0 }) //51
				AADD(aStruct2, { "sup_ventil", "C", 1, 0 }) //52
				AADD(aStruct2, { "out_sint2", "C", 40, 0 }) //53
				AADD(aStruct2, { "condicoes", "C", 15, 0 }) //54
				AADD(aStruct2, { "etnia_ind", "C", 15, 0 })	//55
				AADD(aStruct2, { "out_sint", "C", 1, 0 }) //56
				AADD(aStruct2, { "doen_renal", "C", 1, 0 }) //57
				AADD(aStruct2, { "doen_cromo", "C", 1, 0 }) //58
				AADD(aStruct2, { "sem_epi_si", "C", 4, 0 }) //59
				AADD(aStruct2, { "ano_epi_si", "C", 4, 0 }) //60
				
				AADD(aStruct2, { "sem_epi_ev", "C", 4, 0 }) //61				
				AADD(aStruct2, { "ano_epi_ev", "C", 4, 0 })	//62
				AADD(aStruct2, { "sem_epi_in", "C", 4, 0 }) //63
				AADD(aStruct2, { "ano_epi_in", "C", 4, 0 }) //64
				AADD(aStruct2, { "sem_epi_no", "C", 4, 0 }) //65
				AADD(aStruct2, { "ano_epi_no", "C", 4, 0 }) //66	
				AADD(aStruct2, { "sem_ep_uti", "C", 4, 0 }) //67
				AADD(aStruct2, { "ano_ep_uti", "C", 4, 0 }) //68				
				dbCreate( (cMolde3 ) , aStruct2 )	   
close ( cMolde1 )

rename (cMolde3) to (cMolde4)

endif

if (HB_ArgV(1)) = "MP3"
* Criando e atribuindo valor às variáveis principais.

cMolde1 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde1.dbf" )
cMolde2 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde2.dbf" )
cMolde3 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde3.dbf" )
cMolde4 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde4.dbf" )

* Cria o arquivo dbf que receberá os dados do arquivo csv.
	
aStruct := { { "nu_notific","C",22,0 }, ; //1
			 { "dt_notific","D",10,0 }, ; //2
			 { "cpf","C",14,0 }, ; //3
			 { "nm_pacient", "C", 50, 0 }, ; //4
			 { "sexo", "C", 1, 0 }, ; //5
			 { "raca_cor", "C", 10, 0 }, ; //6
			 { "dt_nasc", "D", 10, 0 }, ; //7
			 { "nome_mae", "C", 50, 0 }, ; //8
			 { "cbo", "C", 50, 0 }, ; //9
			 { "logradouro", "C", 50, 0 }} //10
			 dbcreate (( cMolde1 ),aStruct )

use ( cMolde1 )
copy to ( cMolde2 )

* Acrescenta campos novos.
				use ( cMolde2 ) new
				aStruct2 := dbStruct( cMolde2 )
				AADD(aStruct2, { "bairro", "C", 20, 0 }) //11
				AADD(aStruct2, { "cep", "C", 10, 0 }) //12
				AADD(aStruct2, { "id_mn_resi", "C", 6, 0 }) //13
				AADD(aStruct2, { "munic_res", "C", 35, 0 }) //14
				AADD(aStruct2, { "region_res", "C", 30, 0 }) //15
				AADD(aStruct2, { "macroresid", "C", 30, 0 }) //16
				AADD(aStruct2, { "uf", "C", 2, 0 }) //17
				AADD(aStruct2, { "munic_not", "C", 35, 0 }) //18
				AADD(aStruct2, { "diabetes", "C", 1, 0 }) //19
				AADD(aStruct2, { "cardio", "C", 1, 0 }) //20				
				
				AADD(aStruct2, { "d_resp", "C", 1, 0 }) //21
				AADD(aStruct2, { "imunosup", "C", 1, 0 }) //22
				AADD(aStruct2, { "gestante", "C", 1, 0 }) //23
				AADD(aStruct2, { "puerpera", "C", 1, 0 }) //24
				AADD(aStruct2, { "dt_sin_pri", "D", 10, 0 }) //25
				AADD(aStruct2, { "classific", "C", 32, 0 }) //26				
				AADD(aStruct2, { "criterio", "C", 22, 0 }) //27
				AADD(aStruct2, { "evolucao", "C", 24, 0 }) //28
				AADD(aStruct2, { "dt_evoluc", "D", 10, 0 }) //29
				AADD(aStruct2, { "cnes_not", "C", 10, 0 }) //30
				
				AADD(aStruct2, { "res_teste", "C", 12, 0 }) //31
				AADD(aStruct2, { "tp_teste", "C", 22, 0 }) //32			
				AADD(aStruct2, { "dt_coleta", "D", 10, 0 }) //33
				AADD(aStruct2, { "est_teste", "C", 21, 0 }) //34
				AADD(aStruct2, { "profissio", "C", 1, 0 }) //35
				AADD(aStruct2, { "fonte", "C", 10, 0 }) //36
				AADD(aStruct2, { "idade", "C", 3, 0 }) //37			
				dbCreate( (cMolde3 ) , aStruct2 )	   
close ( cMolde1 )

rename (cMolde3) to (cMolde4)

endif

if (HB_ArgV(1)) = "MP4"
* Criando e atribuindo valor às variáveis principais.

cMolde1 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde1.dbf" )
cMolde2 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde2.dbf" )
cMolde3 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde3.dbf" )
cMolde4 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde4.dbf" )

* Cria o arquivo dbf que receberá os dados do arquivo csv.
	
aStruct := { { "num_contat","C",25,0 }, ; //1
			 { "nu_notific","C",22,0 }, ; //2
			 { "nm_contato","C",70,0 }, ; //3
			 { "uf_reside", "C", 27, 0 }, ; //4
			 { "munic_res", "C", 27, 0 }, ; //5
			 { "id_mn_resi", "C", 6, 0 }, ; //6
			 { "cpf", "C", 14, 0 }, ; //7
			 { "tel_cel", "C", 15, 0 }, ; //8
			 { "telefone", "C", 15, 0 }, ; //9
			 { "relacao", "C", 6, 0 }} //10
			 dbcreate (( cMolde1 ),aStruct )

use ( cMolde1 )
copy to ( cMolde2 )

* Acrescenta campos novos.
				use ( cMolde2 ) new
				aStruct2 := dbStruct( cMolde2 )
				AADD(aStruct2, { "rel_outros", "C", 20, 0 }) //11
				AADD(aStruct2, { "dt_contato", "D", 10, 0 }) //12
				AADD(aStruct2, { "status", "C", 1, 0 }) //13
				AADD(aStruct2, { "resultado", "C", 25, 0 }) //14
				AADD(aStruct2, { "dia1_data", "D", 10, 0 }) //15
				AADD(aStruct2, { "dia1_stat", "C", 20, 0 }) //16
				AADD(aStruct2, { "dia2_data", "D", 10, 0 }) //17
				AADD(aStruct2, { "dia2_stat", "C", 20, 0 }) //18
				AADD(aStruct2, { "dia3_data", "D", 10, 0 }) //19
				AADD(aStruct2, { "dia3_stat", "C", 20, 0 }) //20

				AADD(aStruct2, { "dia4_data", "D", 10, 0 }) //21				
				AADD(aStruct2, { "dia4_stat", "C", 20, 0 }) //22
				AADD(aStruct2, { "dia5_data", "D", 10, 0 }) //23
				AADD(aStruct2, { "dia5_stat", "C", 20, 0 }) //24
				AADD(aStruct2, { "dia6_data", "D", 10, 0 }) //25				
				AADD(aStruct2, { "dia6_stat", "C", 20, 0 }) //26
				AADD(aStruct2, { "dia7_data", "D", 10, 0 }) //27
				AADD(aStruct2, { "dia7_stat", "C", 20, 0 }) //28
				AADD(aStruct2, { "dia8_data", "D", 10, 0 }) //29
				AADD(aStruct2, { "dia8_stat", "C", 20, 0 }) //30

				AADD(aStruct2, { "dia9_data", "D", 10, 0 }) //31				
				AADD(aStruct2, { "dia9_stat", "C", 20, 0 }) //32
				AADD(aStruct2, { "dia10_data", "D", 10, 0 }) //33
				AADD(aStruct2, { "dia10_stat", "C", 20, 0 }) //34
				AADD(aStruct2, { "dia11_data", "D", 10, 0 }) //35
				AADD(aStruct2, { "dia11_stat", "C", 20, 0 }) //36
				AADD(aStruct2, { "dia12_data", "D", 10, 0 }) //37
				AADD(aStruct2, { "dia12_stat", "C", 20, 0 }) //38
				AADD(aStruct2, { "dia13_data", "D", 10, 0 }) //39
				AADD(aStruct2, { "dia13_stat", "C", 20, 0 }) //40
				
				AADD(aStruct2, { "dia14_data", "D", 10, 0 }) //41				
				AADD(aStruct2, { "dia14_stat", "C", 20, 0 }) //42
				AADD(aStruct2, { "dia15_data", "D", 10, 0 }) //43
				AADD(aStruct2, { "dia15_stat", "C", 20, 0 }) //44
				AADD(aStruct2, { "not_cnes", "C", 15, 0 }) //45
				AADD(aStruct2, { "not_cpf", "C", 14, 0 }) //46
				AADD(aStruct2, { "not_email", "C", 40, 0 }) //47
				AADD(aStruct2, { "not_nome", "C", 70, 0 }) //48
				AADD(aStruct2, { "not_cnpj", "C", 20, 0 }) //49

				dbCreate( (cMolde3 ) , aStruct2 )	   
close ( cMolde1 )

rename (cMolde3) to (cMolde4)

endif

Return Nil