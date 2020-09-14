#include <hmg.ch>

declare window Main

* Copia a primeira linha do arquivo "temp2_covid19.txt" (cabeçalho) e copia para o arquivo "heading.txt".

Function copyline(x)

if alltrim( HB_ArgV( 1 )) != "--heading_model"
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Copiando o cabeçalho do arquivo 'temp2_covid19.txt'." )
Main.List_1.Value:= (indice)
else
dt := dia_hora()
FWrite( nH, (dt) + "Copiando o cabeçalho do arquivo 'temp2_covid19.txt'." + Chr(13) + Chr(10) )
endif

if erro = 0
wapi_ShellExecute( 0, 'open','cmd', '/c cd\&&cd ' + (x) + '&&sed -n 1p temp2_covid19.txt > heading.txt',0,0)
endif

Return Nil