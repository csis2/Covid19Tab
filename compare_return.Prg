#include <hmg.ch>

declare window Main

* Verifica se o resultado da comparação (arquivo comp_return.prn) foi gerado.

if erro = 0 
for n = 1 to ( nWaitingTime * 60 )
inkey (1)
lFile4 := HB_FileExists( (HB_DirBase()) + "\comp_return.prn" )
if lFile4 = .T.
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Resultado da comparação pronto." )
Main.List_1.Value:= (indice)
erro = 0
exit
else
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Aguardando resultado da comparação..." )
Main.List_1.Value:= (indice)
endif
endfor
endif

if erro = 0
* Gera um erro se o arquivo de resultado não ter sido gerado.
if erro = 0
lFile5 := HB_FileExists( (HB_DirBase()) + "\comp_return.prn" )
if lFile5 = .F.
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Resultado da comparação não foi gerado." )
erro = 1
endif
endif
endif

Return Nil