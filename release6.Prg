#include <hmg.ch>

* Verifica se o arquivo dbf foi criado e se está pronto para uso.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Verificando se o arquivo foi criado." )
setProperty("Main", "List_1", "Value", (indice))
for n = 1 to ( nWaitingTime * 60 )
inkey (1)
lFile8 := HB_FileExists( (HB_DirBase()) + "\molde4.dbf" )
if lFile8 = .T.
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Arquivo criado e liberado para processamento." )
setProperty("Main", "List_1", "Value", (indice))
erro = 0
exit
else
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Aguardando criação e liberação do arquivo.." )
setProperty("Main", "List_1", "Value", (indice))
endif
endfor  
lFile9 := HB_FileExists( (HB_DirBase()) + "\molde4.dbf" )
if lFile9 = .F.
erro = 1
indice++  
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Erro ao criar o arquivo 'molde4.dbf'." )
setProperty("Main", "List_1", "Value", (indice))
endif  

Return Nil