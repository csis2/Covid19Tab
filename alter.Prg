#include <hmg.ch>

declare window Main

* Altera o nome do arquivo e verifica se a transferencia foi bem sucedida.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Alterando nome do arquivo..." )
setProperty("Main", "List_1", "Value", (indice))

cOldFile := (HB_DirBase())+"\molde4.dbf"
cNewFile := (HB_DirBase())+"\molde5.dbf"
rename (cOldFile) to (cNewFile)

lNewFile := HB_FileExists( cNewFile )
if lNewFile = .T.
erro = 0
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Arquivo renomeado." )
setProperty("Main", "List_1", "Value", (indice))
else
erro = 1
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Erro ao renomear o arquivo." )
setProperty("Main", "List_1", "Value", (indice))
endif

* Analisa a transferência dos dados de um arquivo para outro.

if erro = 0
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Analisando transferência..." )
setProperty("Main", "List_1", "Value", (indice))

* O ultimo registro do arquivo 'molde5.dbf' contém a quantidade de linhas do arquivo 'temp_covid19beta.txt'. Cada linha
* representa um registro. O trecho seguinte extrai essa informação do arquivo 'molde5.dbf'.
use (cNewFile)
dbgobottom()
cTxtRecs := nome
cTxtRecs2 := substr(cTxtRecs,12,40)
cTxtRecs3 := rtrim(cTxtRecs2)
cTxtRecs4 := ltrim(cTxtRecs3)
nTxtRecs := val(cTxtRecs4) // quantidade de linhas do arquivo 'temp_covid19beta.txt'.

* Deleta o registro com a quantidade de linhas do arquivo temp_covid19beta.txt.
delete record (reccount())
pack
* Deleta o ultimo registro do arquivo 'molde5.dbf' que foi duplicado no processo de transferencia.
delete record (reccount())
pack

nDbfRecs := reccount() // quantidade de linhas do arquivo 'molde5.dbf'.

* Calcula o percentual de aproveitamento da transferencia.
nPercent := (nDbfRecs*100) / (nTxtRecs)

* Mostra os valores encontrados no componente List_1.
cDisplayTxt := "Total de registros do arquivo CSV:" + alltrim(cTxtRecs4) + "."
cDisplayDbf := "Total de registros do arquivo DBF:" + alltrim(str(nDbfRecs)) + "."
cPercent := "Aproveitamento:" + alltrim(str(nPercent)) + "%."

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+(cDisplayTxt) )
setProperty("Main", "List_1", "Value", (indice))

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+(cDisplayDbf ) )
setProperty("Main", "List_1", "Value", (indice))

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+(cPercent ) )
setProperty("Main", "List_1", "Value", (indice))

endif

Return Nil