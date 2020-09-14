#include <hmg.ch>

declare window Main

* Exlui linhas em branco do arquivo "heading.txt".

Function del_line(x)

if alltrim( HB_ArgV( 1 )) != "--heading_model"
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Excluindo linhas em branco do arquivo 'heading.txt'." )
Main.List_1.Value:= (indice)
else
dt := dia_hora()
FWrite( nH, (dt) + "Excluindo linhas em branco do arquivo 'heading.txt'." + Chr(13) + Chr(10) )
endif

if erro = 0
wapi_ShellExecute( 0, 'open', (cScript4), (x), 0 )
endif

Return Nil