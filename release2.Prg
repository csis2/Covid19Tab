#include <hmg.ch>

declare window Main

* Verifica se o arquivo "heading_ready.txt" foi gerado e está liberado para uso.

if alltrim( HB_ArgV( 1 )) != "--heading_model"
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Esperando liberação do arquivo 'heading_ready.txt' para uso." )
setProperty("Main", "List_1", "Value", (indice))
for n = 1 to ( nWaitingTime * 60 )
inkey (1)
lFile8 := HB_FileExists( (HB_DirBase()) + "\heading_ready.txt" )
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
lFile9 := HB_FileExists( (HB_DirBase()) + "\heading_ready.txt" )
if lFile9 = .F.
erro = 1
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Erro ao gerar o arquivo 'heading_ready.txt'." )
setProperty("Main", "List_1", "Value", (indice))
endif  
endif

if alltrim( HB_ArgV( 1 )) = "--heading_model"
dt := dia_hora()
FWrite( nH, (dt) + "Esperando liberação do arquivo 'heading_ready.txt' para uso." + Chr(13) + Chr(10) )
for n = 1 to 300
inkey (1)
lFile8 := HB_FileExists( (HB_DirBase()) + "\heading_ready.txt" )
if lFile8 = .T.
dt := dia_hora()
FWrite( nH, (dt) + "Arquivo liberado para processamento." + Chr(13) + Chr(10) )
erro = 0
exit
else
dt := dia_hora()
FWrite( nH, (dt) + "Aguardando liberação do arquivo.." + Chr(13) + Chr(10) )
endif
endfor  
lFile9 := HB_FileExists( (HB_DirBase()) + "\heading_ready.txt" )
if lFile9 = .F.
erro = 1
dt := dia_hora()
FWrite( nH, (dt) + "Erro ao gerar o arquivo 'heading_ready.txt'." + Chr(13) + Chr(10) )
endif  
endif

Return Nil
