PROCEDURE Main()

* CSIS Software 2021
* Cria campos extras na tabela DBF "molde4".
* ------------------------------------------------------------------------
* "Compilado no Harbour Make (hbmk2) versao 3.0.0"
* "Roda somente com argumento de entrada."
* "Exemplo: field_creation.exe run"
* "------------------------------------------------------------------------"

* Verifica se existe argumento.
if empty(HB_ArgV(1)) = .T.
set color to r+/
? "Erro! O programa precisa que voce forneca argumento de entrada."
__Quit()
endif

* Verifica se o argumento é valido.
set exact on
if (HB_ArgV(1)) <> "MP1" .and. (HB_ArgV(1)) <> "MP2" .and. (HB_ArgV(1)) <> "MP3" .and. (HB_ArgV(1)) <> "MP4" .and. (HB_ArgV(1)) <> "MP5"
set color to r+/
? "Erro! O argumento escolhido nao e valido."
__Quit()
endif

if (HB_ArgV(1)) = "MP1"
* Cria campos extras na tabela com o padrão MP1.
		   
close all
cDBFFile = "C:\Covid19Tab\2.1\Covid19Tab\tmp\molde4.dbf"
cDBFFile2 = "C:\Covid19Tab\2.1\Covid19Tab\tmp\molde5.dbf"

* Cria um novo arquivo com novos campos.
	   use ( cDBFFile ) new
	   aStruct := dbStruct( cDBFFile )
	   aAdd( aStruct, { "uf_resi", "C", 2, 0 } ) //1
	   aAdd( aStruct, { "sigla", "C", 2, 0 } ) //2
	   aAdd( aStruct, { "id_mn_resi", "C", 6, 0 } ) //3
	   aAdd( aStruct, { "nu_ano", "C", 4, 0 } ) //4
	   aAdd( aStruct, { "sem_not", "C", 6, 0 } ) //5
	   aAdd( aStruct, { "sem_pri", "C", 6, 0 } ) //6	   
	   aAdd( aStruct, { "nu_idade_n", "N", 4, 0 } ) //7	   
	   aAdd( aStruct, { "id_rg_resi", "C", 8, 0 } ) //8
	   aAdd( aStruct, { "nomeregi", "C", 70, 0 } ) //9	   
	   aAdd( aStruct, { "uf_not", "C", 2, 0 } )	//10   
	   aAdd( aStruct, { "sigla_not", "C", 2, 0 } ) //11	   
	   aAdd( aStruct, { "id_municip", "C", 6, 0 } ) //12
	   aAdd( aStruct, { "id_regiona", "C", 8, 0 } ) //13   	
	   aAdd( aStruct, { "regio_not", "C", 70, 0 } ) //14	
	   aAdd( aStruct, { "id_racacor", "C", 1, 0 } ) //15
	   aAdd( aStruct, { "id_evoluc", "C", 1, 0 } ) //16
	   aAdd( aStruct, { "id_tp_test", "C", 1, 0 } ) //17	 
	   aAdd( aStruct, { "id_esttest", "C", 1, 0 } ) //18	   
	   aAdd( aStruct, { "id_cla_fin", "C", 1, 0 } ) //19
	   aAdd( aStruct, { "id_sorolog", "C", 2, 0 } ) //20
	   aAdd( aStruct, { "cod_comuni", "C", 2, 0 } ) //21	   
	   	   
* Cria uma tabela nova a partir da estrutura da tabela selecionada como arquivo de entrada.
* A tabela nova já contém os campos criados pela aplicação.
	   dbCreate( (cDBFFile2 ) , aStruct )
	   close
	   	   
endif		   

if (HB_ArgV(1)) = "MP2"
* Cria campos extras na tabela com o padrão MP2.

close all
cDBFFile = "C:\Covid19Tab\2.1\Covid19Tab\tmp\molde4.dbf"
cDBFFile2 = "C:\Covid19Tab\2.1\Covid19Tab\tmp\molde5.dbf"

* Cria um novo arquivo com novos campos.
	   use ( cDBFFile ) new
	   aStruct := dbStruct( cDBFFile )
	   aAdd( aStruct, { "id_racacor", "C", 1, 0 } ) //1
	   aAdd( aStruct, { "id_criter", "C", 1, 0 } ) //2
	   aAdd( aStruct, { "id_evoluc", "C", 1, 0 } ) //3
	   aAdd( aStruct, { "id_res_tst", "C", 1, 0 } ) //4
	   aAdd( aStruct, { "id_tp_tst", "C", 1, 0 } ) //5
	   aAdd( aStruct, { "id_est_tst", "C", 1, 0 } ) //6
	   aAdd( aStruct, { "id_fonte", "C", 1, 0 } ) //7
	   aAdd( aStruct, { "id_class", "C", 1, 0 } ) //8
	   aAdd( aStruct, { "nu_idade_n", "N", 4, 0 } ) //9
	   aAdd( aStruct, { "sem_not", "C", 6, 0 } ) //10
	   aAdd( aStruct, { "sem_pri", "C", 6, 0 } ) //11
	   aAdd( aStruct, { "cls_sivep", "C", 1, 0 } ) //12
	   aAdd( aStruct, { "sg_uf", "C", 2, 0 } ) //13 codigo numerico da UF de residencia
	   aAdd( aStruct, { "id_rg_resi", "C", 4, 0 } ) //14
	   aAdd( aStruct, { "sem_evoluc", "C", 6, 0 } ) //15
	   aAdd( aStruct, { "sem_inter", "C", 6, 0 } ) //16	   
	   aAdd( aStruct, { "sem_in_uti", "C", 6, 0 } ) //17	   	   
	   
* Cria uma tabela nova a partir da estrutura da tabela selecionada como arquivo de entrada.
* A tabela nova já contém os campos criados pela aplicação.
	   dbCreate( (cDBFFile2 ) , aStruct )
	   close
	   	   
endif		   
		   
if (HB_ArgV(1)) = "MP3"
* Cria campos extras na tabela com o padrão MP3.
		   
close all
cDBFFile = "C:\Covid19Tab\2.1\Covid19Tab\tmp\molde4.dbf"
cDBFFile2 = "C:\Covid19Tab\2.1\Covid19Tab\tmp\molde5.dbf"

* Cria um novo arquivo com novos campos.
	   use ( cDBFFile ) new
	   aStruct := dbStruct( cDBFFile )
	   aAdd( aStruct, { "idade_n", "N", 3, 0 } ) //1
	   aAdd( aStruct, { "nu_ano", "C", 4, 0 } ) //2
	   aAdd( aStruct, { "sem_not", "C", 6, 0 } ) //3
	   aAdd( aStruct, { "sem_pri", "C", 6, 0 } ) //4  
	   aAdd( aStruct, { "sem_evoluc", "C", 6, 0 } ) //5	   
	   aAdd( aStruct, { "id_racacor", "C", 1, 0 } ) //6
	   aAdd( aStruct, { "id_rg_resi", "C", 4, 0 } ) //7
	   aAdd( aStruct, { "id_uf_res", "C", 2, 0 } ) //8 codigo numerico da UF de residencia.	 
	   aAdd( aStruct, { "UF2", "C", 2, 0 } ) //9 sigla da UF de residencia
	   AADD( aStruct, { "id_class", "C", 1, 0 }) //10
	   aAdd( aStruct, { "id_criter", "C", 1, 0 } ) //11
	   aAdd( aStruct, { "id_evoluc", "C", 1, 0 } ) //12
	   aAdd( aStruct, { "id_res_tst", "C", 1, 0 } ) //13
	   aAdd( aStruct, { "id_tp_tst", "C", 1, 0 } ) //14
	   aAdd( aStruct, { "id_est_tst", "C", 1, 0 } ) //15
	   aAdd( aStruct, { "id_fonte", "C", 1, 0 } ) //16
	   
* Cria uma tabela nova a partir da estrutura da tabela selecionada como arquivo de entrada.
* A tabela nova já contém os campos criados pela aplicação.
	   dbCreate( (cDBFFile2 ) , aStruct )
	   close
	   	   
endif		   
		   
if (HB_ArgV(1)) = "MP4"
* Cria campos extras na tabela com o padrão MP4.
		   
close all
cDBFFile = "C:\Covid19Tab\2.1\Covid19Tab\tmp\molde4.dbf"
cDBFFile2 = "C:\Covid19Tab\2.1\Covid19Tab\tmp\molde5.dbf"

* Cria um novo arquivo com novos campos.
	   use ( cDBFFile ) new
	   aStruct := dbStruct( cDBFFile )
	   aAdd( aStruct, { "id_rg_resi", "C", 4, 0 } ) //1
	   aAdd( aStruct, { "nu_ano", "C", 4, 0 } ) //2
	   aAdd( aStruct, { "sem_contat", "C", 6, 0 } ) //3
	   aAdd( aStruct, { "id_relacao", "C", 1, 0 } ) //4  
	   aAdd( aStruct, { "nomeregi", "C", 50, 0 } ) //5
	   aAdd( aStruct, { "uf_resi", "C", 2, 0 } ) //6	   
	   
* Cria uma tabela nova a partir da estrutura da tabela selecionada como arquivo de entrada.
* A tabela nova já contém os campos criados pela aplicação.
	   dbCreate( (cDBFFile2 ) , aStruct )
	   close
	   	   
endif		   	

if (HB_ArgV(1)) = "MP5"
* Cria campos extras na tabela com o padrão MP5.
		   
close all
cDBFFile = "C:\Covid19Tab\2.1\Covid19Tab\tmp\molde4.dbf"
cDBFFile2 = "C:\Covid19Tab\2.1\Covid19Tab\tmp\molde5.dbf"

* Cria um novo arquivo com novos campos.
	   use ( cDBFFile ) new
	   aStruct := dbStruct( cDBFFile )
	   aAdd( aStruct, { "idade_n", "N", 3, 0 } ) //1
	   aAdd( aStruct, { "nu_ano", "C", 4, 0 } ) //2
	   aAdd( aStruct, { "sem_not", "C", 6, 0 } ) //3
	   aAdd( aStruct, { "sem_pri", "C", 6, 0 } ) //4  
	   aAdd( aStruct, { "sem_evoluc", "C", 6, 0 } ) //5	   
	   aAdd( aStruct, { "id_racacor", "C", 1, 0 } ) //6
	   aAdd( aStruct, { "id_rg_resi", "C", 4, 0 } ) //7
	   aAdd( aStruct, { "id_uf_res", "C", 2, 0 } ) //8 codigo numerico da UF de residencia.	 
	   aAdd( aStruct, { "UF2", "C", 2, 0 } ) //9 sigla da UF de residencia
	   AADD( aStruct, { "id_class", "C", 1, 0 }) //10
	   aAdd( aStruct, { "id_criter", "C", 1, 0 } ) //11
	   aAdd( aStruct, { "id_evoluc", "C", 1, 0 } ) //12
	   aAdd( aStruct, { "id_res_tst", "C", 1, 0 } ) //13
	   aAdd( aStruct, { "id_tp_tst", "C", 1, 0 } ) //14
	   aAdd( aStruct, { "id_est_tst", "C", 1, 0 } ) //15
	   aAdd( aStruct, { "id_fonte", "C", 1, 0 } ) //16
	   
* Cria uma tabela nova a partir da estrutura da tabela selecionada como arquivo de entrada.
* A tabela nova já contém os campos criados pela aplicação.
	   dbCreate( (cDBFFile2 ) , aStruct )
	   close
	   	   
endif		   	   
		   
Return Nil