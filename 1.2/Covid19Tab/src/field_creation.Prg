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
if (HB_ArgV(1)) <> "run"
set color to r+/
? "Erro! O argumento escolhido nao e valido."
__Quit()
endif

* Cria campos extras na tabela DBF esus_covid19.dbf.

close all
cDBFFile = "C:\Covid19Tab\1.2\Covid19Tab\tmp\molde4.dbf"
cDBFFile2 = "C:\Covid19Tab\1.2\Covid19Tab\tmp\molde5.dbf"

* Cria um novo arquivo com novos campos.
	   use ( cDBFFile ) new
	   aStruct := dbStruct( cDBFFile )
	   aAdd( aStruct, { "id_racacor", "C", 1, 0 } ) //1
	   aAdd( aStruct, { "id_criter", "C", 1, 0 } ) //2
	   aAdd( aStruct, { "id_evoluc", "C", 1, 0 } ) //3
	   aAdd( aStruct, { "id_res_tst", "C", 1, 0 } ) //4
	   aAdd( aStruct, { "id_tp_tst", "C", 2, 0 } ) //5
	   aAdd( aStruct, { "id_est_tst", "C", 1, 0 } ) //6
	   aAdd( aStruct, { "id_fonte", "C", 1, 0 } ) //7
	   aAdd( aStruct, { "id_class", "C", 1, 0 } ) //8
	   aAdd( aStruct, { "nu_idade_c", "C", 8, 0 } ) //9
	   aAdd( aStruct, { "nu_idade_n", "N", 4, 0 } ) //10
	   aAdd( aStruct, { "sem_not", "C", 6, 0 } ) //11
	   aAdd( aStruct, { "sem_pri", "C", 6, 0 } ) //12
	   aAdd( aStruct, { "cls_sivep", "C", 1, 0 } ) //13
	   aAdd( aStruct, { "sg_uf", "C", 2, 0 } ) //14 codigo numerico da UF de residencia
	   aAdd( aStruct, { "id_rg_resi", "C", 4, 0 } ) //15
	   aAdd( aStruct, { "sem_evoluc", "C", 6, 0 } ) //16
	   aAdd( aStruct, { "sem_inter", "C", 6, 0 } ) //17	   
	   
* Cria uma tabela nova a partir da estrutura da tabela selecionada como arquivo de entrada.
* A tabela nova já contém os campos criados pela aplicação.
	   dbCreate( (cDBFFile2 ) , aStruct )
	   close
	   	   
Return Nil