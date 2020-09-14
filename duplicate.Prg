#include "hmg.ch"

declare window Main

* Duplica o arquivo selecionado pelo usuário e o renomeia para temp_covid19.txt e temp2_covid19.txt.
* Verifica se os arquivos foram gerados. Se ambos ou um dos arquivos não for duplicado, é gerado um aviso de erro.

Function duplicate()

if alltrim( HB_ArgV( 1 )) != "--heading_model"
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Copiando arquivo selecionado..." )
Main.List_1.Value:= (indice)
else
dt := dia_hora()
FWrite( nH, (dt) + "Copiando arquivo indicado..." + Chr(13) + Chr(10) )
endif

copy file (cFile) to (cFileDuplicate1)
copy file (cFile) to (cFileDuplicate2)

if alltrim( HB_ArgV( 1 )) != "--heading_model"
lFile := HB_FileExists( cFileDuplicate1 ) 
if lFile = .T.
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Arquivo 1 copiado e renomeado." )
Main.List_1.Value:= (indice)
erro = 0
else
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Erro! Arquivo selecionado não foi copiado." )
Main.List_1.Value:= (indice)
erro = 1
endif
endif

if alltrim( HB_ArgV( 1 )) != "--heading_model"
lFile := HB_FileExists( cFileDuplicate2 ) 
if lFile = .T.
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Arquivo 2 copiado e renomeado." )
Main.List_1.Value:= (indice)
erro = 0
else
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Erro! Arquivo selecionado não foi copiado." )
Main.List_1.Value:= (indice)
erro = 1
endif
endif

if alltrim( HB_ArgV( 1 )) == "--heading_model"
lFile := HB_FileExists( cFileDuplicate1 ) 
if lFile = .T.
dt := dia_hora()
FWrite( nH, (dt) + "Arquivo 1 copiado e renomeado..." + Chr(13) + Chr(10) )
erro = 0
else
dt := dia_hora()
FWrite( nH, (dt) + "Erro! Arquivo selecionado não foi copiado." + Chr(13) + Chr(10) )
FClose( nH )
erro = 1
endif
endif

if alltrim( HB_ArgV( 1 )) = "--heading_model"
lFile := HB_FileExists( cFileDuplicate2 ) 
if lFile = .T.
dt := dia_hora()
FWrite( nH, (dt) + "Arquivo 2 copiado e renomeado..." + Chr(13) + Chr(10) )
erro = 0
else
dt := dia_hora()
FWrite( nH, (dt) + "Erro! Arquivo selecionado não foi copiado." + Chr(13) + Chr(10) )
FClose( nH )
erro = 1
endif
endif

Return Nil