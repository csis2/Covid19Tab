#include <hmg.ch>

declare window Main

* Verifica se a alteração dos campos do arquivo "temp_covid19alfa.txt" foi bem-sucedida, analisando o conteúdo do
* arquivo "heading2.txt", que contém o cabeçalho do arquivo.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Verificando se a alteracao foi bem-sucedida." )
setProperty("Main", "List_1", "Value", (indice))
cFile7 := (HB_DirBase()) + "heading2.txt"
wapi_ShellExecute( 0, 'open', (cScript3) , (cFile7) ,0 )

for n = 1 to ( nWaitingTime * 60 )
inkey (1)
lFile8 := HB_FileExists( (HB_DirBase()) + "\temp_covid19beta.txt" )
if lFile8 = .T.
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Alteracao bem-sucedida." )
setProperty("Main", "List_1", "Value", (indice))
erro = 0
exit
else
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Aguardando verificação..." )
setProperty("Main", "List_1", "Value", (indice))
endif
endfor  
lFile9 := HB_FileExists( (HB_DirBase()) + "\temp_covid19beta.txt" )
if lFile9 = .F.
erro = 1
indice++  
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Erro na alteracao dos campos." )
setProperty("Main", "List_1", "Value", (indice))
endif  

Return Nil