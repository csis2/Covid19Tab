#include <hmg.ch>

declare window Main

* Monitora se a transferencia dos dados foi finalizada.

for n = 1 to ( nWaitingTime * 60 )
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Transferindo dados..." )
setProperty("Main", "List_1", "Value", (indice))
inkey (1)
cLocal := (HB_DirBase())
cCommand := '/c cd\&&cd ' + (cLocal) + '&&tasklist /nh /fi "imagename eq transfer2.exe" /fo table > process.txt'
wapi_ShellExecute( 0, 'open','cmd', (cCommand) ,0,0)

lFileTxt := HB_FileExists( (HB_DirBase()) + "\process.txt" )
if lFileTxt = .T.
cResultado := (HB_DirBase()) + "\process.txt"
cString := HB_MEMOREAD (cResultado)
result1 := at( "transfer2.exe" , cString )
if (result1) = 0
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Transferencia concluida." )
setProperty("Main", "List_1", "Value", (indice))
exit
endif
endif

endfor

Return Nil