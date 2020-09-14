#include <hmg.ch>

declare window Main

* Verifica se o arquivo "temp_covid19alfa.txt" foi gerado e está liberado para uso.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Esperando liberação do arquivo 'temp_covid19alfa.txt' para uso." )
setProperty("Main", "List_1", "Value", (indice))
for n = 1 to ( nWaitingTime * 60 )
inkey (1)
lFile8 := HB_FileExists( (HB_DirBase()) + "\temp_covid19alfa.txt" )
if lFile8 = .T.
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Arquivo liberado para processamento." )
setProperty("Main", "List_1", "Value", (indice))
erro = 0
exit
else
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Aguardando liberação do arquivo.." )
setProperty("Main", "List_1", "Value", (indice))
endif
endfor  
lFile9 := HB_FileExists( (HB_DirBase()) + "\temp_covid19alfa.txt" )
if lFile9 = .F.
erro = 1
indice++  
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Erro ao gerar o arquivo 'temp_covid19alfa.txt'." )
setProperty("Main", "List_1", "Value", (indice))
endif  

Return Nil