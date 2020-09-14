#include <hmg.ch>

declare window Main

* Verifica se a tabela com a semana epidemiológica foi criada e preenchida.

cFileEpid := HB_DirBase()+"\epid.dbf"

lFile := HB_FileExists( cFileEpid ) 
if lFile = .T.
erro = 0
else
erro = 1
endif

use ( cFileEpid )
nRecs := reccount()
if nRecs < 49
erro = 1
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Erro na geração do calendário epidemiológico." )
Main.List_1.Value:= (indice)
else
erro = 0
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Calendário epidemiológico gerado." )
Main.List_1.Value:= (indice)
endif

Return Nil