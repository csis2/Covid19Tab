#include <hmg.ch>

declare window Main

* Criando arquivo dbf para receber os registros.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Criando arquivo dbf para receber os registros." )
setProperty("Main", "List_1", "Value", (indice))

* Criando e atribuindo valor às variáveis principais.

cMolde1 := ( (HB_DirBase()) + "\molde1.dbf" )
cMolde2 := ( (HB_DirBase()) + "\molde2.dbf" )
cMolde3 := ( (HB_DirBase()) + "\molde3.dbf" )
cMolde4 := ( (HB_DirBase()) + "\molde4.dbf" )

* Cria o arquivo dbf que receberá os dados do arquivo csv.
	
aStruct := { { "nu_notific","C",15,0 }, ;
			 { "uf_notific","C",20,0 }, ;
			 { "munic_not","C",28,0 }, ;
			 { "profsaude", "C", 1, 0 }, ;
			 { "tel_contat", "C", 15, 0 }, ;
			 { "etnia", "C", 20, 0 }, ;
			 { "logradouro", "C", 74, 0 }, ;
			 { "evolucao", "C", 24, 0 }, ;
			 { "tipo_teste", "C", 54, 0 }, ;
			 { "uf_reside", "C", 20, 0 }}
			 dbcreate (( cMolde1 ),aStruct )

use ( cMolde1 )
copy to ( cMolde2 )

* Acrescenta campos novos.
				use ( cMolde2 ) new
				aStruct2 := dbStruct( cMolde2 )
				AADD(aStruct2, { "numero", "C", 22, 0 })
				AADD(aStruct2, { "res_tot", "C", 1, 0 })
				AADD(aStruct2, { "dt_notific", "D", 10, 0 })
				AADD(aStruct2, { "res_iga", "C", 1, 0 })
				AADD(aStruct2, { "cbo", "C", 105, 0 })
				AADD(aStruct2, { "garganta", "C", 1, 0 })	
				AADD(aStruct2, { "dispneia", "C", 1, 0 })
				AADD(aStruct2, { "febre", "C", 1, 0 })
				AADD(aStruct2, { "tosse", "C", 1, 0 })	
				AADD(aStruct2, { "outros", "C", 1, 0 })
				AADD(aStruct2, { "dor_cabeca", "C", 1, 0 })
				AADD(aStruct2, { "gustativos", "C", 1, 0 })
				AADD(aStruct2, { "olfativos", "C", 1, 0 })
				AADD(aStruct2, { "coriza", "C", 1, 0 })
				AADD(aStruct2, { "assintomat", "C", 1, 0 })
				AADD(aStruct2, { "cep", "C", 10, 0 })
				AADD(aStruct2, { "prof_seg", "C", 1, 0 })
				AADD(aStruct2, { "res_rapido", "C", 1, 0 })
				AADD(aStruct2, { "raca_cor", "C", 8, 0 })
				AADD(aStruct2, { "t_sorolog", "C", 25, 0 })				
				AADD(aStruct2, { "sexo", "C", 1, 0 })	
				AADD(aStruct2, { "estrang", "C", 1, 0 })
				AADD(aStruct2, { "tem_cpf", "C", 1, 0 })
				AADD(aStruct2, { "res_igm", "C", 1, 0 })
				AADD(aStruct2, { "est_teste", "C", 21, 0 })
				AADD(aStruct2, { "dt_tst_sor", "D", 10, 0 })
				AADD(aStruct2, { "res_igg", "C", 1, 0 })				
				AADD(aStruct2, { "cns", "C", 20, 0 })
				AADD(aStruct2, { "d_resp", "C", 1, 0 })
				AADD(aStruct2, { "d_card", "C", 1, 0 })		
				AADD(aStruct2, { "diabetes", "C", 1, 0 })
				AADD(aStruct2, { "d_renais", "C", 1, 0 })
				AADD(aStruct2, { "imunosup", "C", 1, 0 })	
				AADD(aStruct2, { "gestante", "C", 1, 0 })
				AADD(aStruct2, { "portador", "C", 1, 0 })
				AADD(aStruct2, { "puerpera", "C", 1, 0 })	
				AADD(aStruct2, { "obesidade", "C", 1, 0 })				
				AADD(aStruct2, { "bairro", "C", 48, 0 })
				AADD(aStruct2, { "dt_tst_rap", "D", 10, 0 })
				AADD(aStruct2, { "descricao", "C", 50, 0 })
				AADD(aStruct2, { "dt_encerra", "D", 10, 0 })
				AADD(aStruct2, { "dt_nasc", "D", 10, 0 })
				AADD(aStruct2, { "classi_fin", "C", 35, 0 })
				AADD(aStruct2, { "munic_res", "C", 27, 0 })	
				AADD(aStruct2, { "noname_fld", "C", 8, 0 })					
				AADD(aStruct2, { "complement", "C", 51, 0 })
				AADD(aStruct2, { "passaporte", "C", 7, 0 })
				AADD(aStruct2, { "cpf", "C", 14, 0 })
				AADD(aStruct2, { "nome", "C", 234, 0 })
				AADD(aStruct2, { "pais", "C", 8, 0 })
				AADD(aStruct2, { "dt_sintom", "D", 10, 0 })
				AADD(aStruct2, { "nome_mae", "C", 52, 0 })	
				AADD(aStruct2, { "tel_cel", "C", 15, 0 })
				AADD(aStruct2, { "not_cnes", "C", 15, 0 })
				AADD(aStruct2, { "not_cpf", "C", 14, 0 })
				AADD(aStruct2, { "not_email", "C", 44, 0 })
				AADD(aStruct2, { "not_nome", "C", 46, 0 })
				AADD(aStruct2, { "not_cnpj", "C", 18, 0 })				
				dbCreate( (cMolde3 ) , aStruct2 )	   
close ( cMolde1 )

rename (cMolde3) to (cMolde4)

Return Nil

