#include <hmg.ch>

declare window Main

* Cria campos extras na tabela DBF esus_covid19.dbf.

close all
cDBFFile = HB_DirBase()+"\molde5.dbf"
cDBFFile2 = HB_DirBase()+"\tmp_covid19.dbf"

* Verifica se o arquivo "molde3.dbf" foi liberado para uso.
for n = 1 to 120
inkey (1)
use (cDBFFile)
if neterr()
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Aguardando liberação do arquivo dbf para uso." )
Main.List_1.Value:= (indice)
else
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Arquivo liberado. Criando campos..." )
Main.List_1.Value:= (indice)
close
exit
endif
endfor

* Copia a estrutura do arquivo esus_covid19.dbf e acrescenta campos novos.
	   use ( cDBFFile ) new
	   aStruct := dbStruct( cDBFFile )
	   aAdd( aStruct, { "sem_not", "C", 6, 0 } ) //1
	   aAdd( aStruct, { "nu_ano", "C", 4, 0 } ) //2
	   aAdd( aStruct, { "id_mn_resi", "C", 6, 0 } ) //3
	   aAdd( aStruct, { "id_rg_resi", "C", 8, 0 } ) //4
	   aAdd( aStruct, { "uf_resi", "C", 2, 0 } ) //5
	   aAdd( aStruct, { "nu_idade_n", "N", 4, 0 } ) //6
	   aAdd( aStruct, { "sem_pri", "C", 6, 0 } ) //7
	   aAdd( aStruct, { "nomeregi", "C", 70, 0 } ) //8
	   aAdd( aStruct, { "sigla", "C", 2, 0 } ) //9
	   aAdd( aStruct, { "id_municip", "C", 6, 0 } ) //10
	   aAdd( aStruct, { "id_regiona", "C", 8, 0 } ) //11   
	   aAdd( aStruct, { "sigla_not", "C", 2, 0 } ) //12
	   aAdd( aStruct, { "uf_not", "C", 2, 0 } )	//13
	   aAdd( aStruct, { "regio_not", "C", 70, 0 } ) //14
	   aAdd( aStruct, { "id_racacor", "C", 1, 0 } ) //15
	   aAdd( aStruct, { "id_evoluc", "C", 1, 0 } ) //16
	   aAdd( aStruct, { "id_tp_test", "C", 1, 0 } ) //17
	   aAdd( aStruct, { "id_esttest", "C", 1, 0 } ) //18
	   aAdd( aStruct, { "id_cla_fin", "C", 1, 0 } ) //19
	   aAdd( aStruct, { "id_sorolog", "C", 2, 0 } ) //20
	   	      	   	   	  	   
* Cria uma tabela nova a partir da estrutura da tabela selecionada como arquivo de entrada.
* A tabela nova já contém os campos criados pela aplicação.
	   dbCreate( (cDBFFile2 ) , aStruct )	   
	   close

* Transferindo os dados da tabela original para a tabela recem criada.
	   use ( cDBFFile2 ) new
	   append from ( cDBFFile )
	   close
	   	   
Return Nil