#include <hmg.ch>

declare window Main

* Calcula o tempo que demorou o processamento do arquivo.

cExtraiTempo1 := SubStr( cHoraInicio, 12, 8 )
cHoraFim := (dt)
cExtraiTempo2 := SubStr( cHoraFim, 12, 8 )
cFullTime := sectotime (( secs(cExtraiTempo2) ) - ( secs(cExtraiTempo1) ))

indice++
setProperty("Main", "List_1", "Item", (indice), (dt)+"Tempo de processamento-"+( cFullTime ) )
Main.List_1.Value:= (indice)

Return Nil