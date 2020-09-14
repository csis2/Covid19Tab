#include <hmg.ch>

declare window Main

* Roda o executavel que transfere os dados do arquivo CSV selecionado pelo usuário para o arquivo DBF
* criado pelo módulo "DBF_File".

Function transfer(x)

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Iniciando transferência de dados de CSV para DBF." )
setProperty("Main", "List_1", "Value", (indice))

cLocal := (HB_DirBase())
cCommand := '/c cd ' + (cLocal) + '&&transfer2.exe'
wapi_ShellExecute( 0, 'open','cmd', (cCommand) , 0 ,0, 0)

Return Nil