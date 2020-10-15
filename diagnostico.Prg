#include <hmg.ch>

declare window Main

* Verifica se o programa terá algum problema para gerar os dados solicitados pelo usuário.
* setProperty("Main", "List_1", "DeleteAllItems" )
Main.List_1.DeleteAllItems
indice := 0
nErroDiagnostico = 0

indice++
setProperty("Main", "List_1", "Item", (indice), "Iniciando módulo de diagnóstico..." )
Main.List_1.Value:= (indice)

if (empty(cUnidF) = .T. ) .and. ( nErroDiagnostico = 0 )
nErroDiagnostico = 1
indice++
setProperty("Main", "List_1", "Item", (indice), "A UF não foi escolhida pelo usuário." )
Main.List_1.Value:= (indice)
else
nErroDiagnostico = 0
indice++
setProperty("Main", "List_1", "Item", (indice), "UF configurada." )
Main.List_1.Value:= (indice)
endif

				if (empty(cSinan) = .T. ) .and. ( nErroDiagnostico = 0 )
				nErroDiagnostico = 1
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Pasta do SINAN NET não foi mostrada pelo usuário." )
				Main.List_1.Value:= (indice)
				else
				nErroDiagnostico = 0
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Pasta do SINAN NET configurada." )
				Main.List_1.Value:= (indice)
				endif

if ( nErroDiagnostico = 0 )
if (( lRegistrosInconsistentes = .T. ) .or. ( lRegistrosInconsistentes = .F. ) )
nErroDiagnostico = 0
indice++
setProperty("Main", "List_1", "Item", (indice), "Correção de campo inconsistente, configurado." )
Main.List_1.Value:= (indice)
else
nErroDiagnostico = 1
indice++
setProperty("Main", "List_1", "Item", (indice), "Correção de campo inconsistente, não configurado." )
Main.List_1.Value:= (indice)
endif
endif

				if ( nWaitingTime >= 5 ) .and. ( nErroDiagnostico = 0 )
				nErroDiagnostico = 0
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Tempo máximo de espera, configurado." )
				Main.List_1.Value:= (indice)
				else
				nErroDiagnostico = 1
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Tempo máximo de espera, não configurado." )
				Main.List_1.Value:= (indice)
				endif

cArquivo1 := alltrim(cSinan)+alltrim("\\BaseDBF\\municnet.dbf")
if ((file(cArquivo1)) = .F. ) .and. ( nErroDiagnostico = 0 )
nErroDiagnostico = 1
indice++
setProperty("Main", "List_1", "Item", (indice), "Arquivo 'municnet.dbf' não encontrado." )
Main.List_1.Value:= (indice)
else
nErroDiagnostico = 0
indice++
setProperty("Main", "List_1", "Item", (indice), "Arquivo 'municnet.dbf'...............ok." )
Main.List_1.Value:= (indice)
endif

				cArquivo2 := alltrim(cSinan)+alltrim("\\BaseDBF\\regionet.dbf")				
				if ((file(cArquivo2)) = .F. ) .and. ( nErroDiagnostico = 0 )
				nErroDiagnostico = 1
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Arquivo 'regionet.dbf' não encontrado." )
				Main.List_1.Value:= (indice)
				else
				nErroDiagnostico = 0
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Arquivo 'regionet.dbf'...............ok." )
				Main.List_1.Value:= (indice)
				endif

cArquivo3 := alltrim(cSinan)+alltrim("\\BaseDBF\\uf.dbf")
if ((file(cArquivo3)) = .F.) .and. ( nErroDiagnostico = 0 )
nErroDiagnostico = 1
indice++
setProperty("Main", "List_1", "Item", (indice), "Arquivo 'uf.dbf' não encontrado." )
Main.List_1.Value:= (indice)
else
nErroDiagnostico = 0
indice++
setProperty("Main", "List_1", "Item", (indice), "Arquivo 'uf.dbf'...............ok." )
Main.List_1.Value:= (indice)
endif
				if nErroDiagnostico = 0
				use ( cArquivo1 )
				nReg_Arquivo1 := reccount()
				close
				if ( nReg_Arquivo1 = 0 )
				nErroDiagnostico = 1
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Arquivo 'municnet.dbf' sem registros." )
				Main.List_1.Value:= (indice)
				else
				nErroDiagnostico = 0
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Registros no arquivo 'municnet.dbf'............ok." )
				Main.List_1.Value:= (indice)
				endif	
				endif		
				
if nErroDiagnostico = 0				
use ( cArquivo2 )
nReg_Arquivo2 := reccount()
close
if ( nReg_Arquivo2 = 0 )
nErroDiagnostico = 1
indice++
setProperty("Main", "List_1", "Item", (indice), "Arquivo 'regionet.dbf' sem registros." )
Main.List_1.Value:= (indice)
else
nErroDiagnostico = 0
indice++
setProperty("Main", "List_1", "Item", (indice), "Registros no arquivo 'regionet.dbf'...............ok." )
Main.List_1.Value:= (indice)
endif			
endif
				if nErroDiagnostico = 0	
				use ( cArquivo3 )
				nReg_Arquivo3 := reccount()
				close
				if ( nReg_Arquivo3 = 0 )
				nErroDiagnostico = 1
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Arquivo 'uf.dbf' sem registros." )
				Main.List_1.Value:= (indice)
				else
				nErroDiagnostico = 0
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Registros no arquivo 'uf.dbf'...............ok." )
				Main.List_1.Value:= (indice)
				endif	
				endif				

if nErroDiagnostico = 0	
cArquivo4 := HB_DirBase()+alltrim("\\del_line.exe")
if ((file(cArquivo4)) = .F. ) .and. ( nErroDiagnostico = 0 )
nErroDiagnostico = 1
indice++
setProperty("Main", "List_1", "Item", (indice), "Arquivo 'del_line.exe' não encontrado." )
Main.List_1.Value:= (indice)
else
nErroDiagnostico = 0
indice++
setProperty("Main", "List_1", "Item", (indice), "Arquivo 'del_line.exe'...............ok." )
Main.List_1.Value:= (indice)
endif
endif

				if nErroDiagnostico = 0	
				cArquivo5 := HB_DirBase()+alltrim("\\heading_model.c19")
				if ((file(cArquivo5)) = .F. ) .and. ( nErroDiagnostico = 0 )
				nErroDiagnostico = 1
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Arquivo 'heading_model.c19' não encontrado." )
				Main.List_1.Value:= (indice)
				else
				nErroDiagnostico = 0
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Arquivo 'heading_model.c19'...............ok." )
				Main.List_1.Value:= (indice)
				endif
				endif

if nErroDiagnostico = 0	
cArquivo6 := HB_DirBase()+alltrim("\\settings.c19")
if ((file(cArquivo6)) = .F. ) .and. ( nErroDiagnostico = 0 )
nErroDiagnostico = 1
indice++
setProperty("Main", "List_1", "Item", (indice), "Arquivo 'settings.c19' não encontrado." )
Main.List_1.Value:= (indice)
else
nErroDiagnostico = 0
indice++
setProperty("Main", "List_1", "Item", (indice), "Arquivo 'settings.c19'...............ok." )
Main.List_1.Value:= (indice)
endif
endif

				if nErroDiagnostico = 0	
				cArquivo7 := HB_DirBase()+alltrim("\\libiconv2.dll")
				if ((file(cArquivo7)) = .F. ) .and. ( nErroDiagnostico = 0 )
				nErroDiagnostico = 1
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Arquivo 'libiconv2.dll' não encontrado." )
				Main.List_1.Value:= (indice)
				else
				nErroDiagnostico = 0
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Arquivo 'libiconv2.dll'...............ok." )
				Main.List_1.Value:= (indice)
				endif
				endif

if nErroDiagnostico = 0	
cArquivo8 := HB_DirBase()+alltrim("\\libintl3.dll")
if ((file(cArquivo8)) = .F. ) .and. ( nErroDiagnostico = 0 )
nErroDiagnostico = 1
indice++
setProperty("Main", "List_1", "Item", (indice), "Arquivo 'libintl3.dll' não encontrado." )
Main.List_1.Value:= (indice)
else
nErroDiagnostico = 0
indice++
setProperty("Main", "List_1", "Item", (indice), "Arquivo 'libintl3.dll'...............ok." )
Main.List_1.Value:= (indice)
endif
endif

				if nErroDiagnostico = 0	
				cArquivo9 := HB_DirBase()+alltrim("\\regex2.dll")
				if ((file(cArquivo9)) = .F. ) .and. ( nErroDiagnostico = 0 )
				nErroDiagnostico = 1
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Arquivo 'regex2.dll' não encontrado." )
				Main.List_1.Value:= (indice)
				else
				nErroDiagnostico = 0
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Arquivo 'regex2.dll'...............ok." )
				Main.List_1.Value:= (indice)
				endif
				endif

if nErroDiagnostico = 0	
cArquivo10 := HB_DirBase()+alltrim("\\sed.exe")
if ((file(cArquivo10)) = .F. ) .and. ( nErroDiagnostico = 0 )
nErroDiagnostico = 1
indice++
setProperty("Main", "List_1", "Item", (indice), "Arquivo 'sed.exe' não encontrado." )
Main.List_1.Value:= (indice)
else
nErroDiagnostico = 0
indice++
setProperty("Main", "List_1", "Item", (indice), "Arquivo 'sed.exe'...............ok." )
Main.List_1.Value:= (indice)
endif
endif

				if nErroDiagnostico = 0	
				cArquivo11 := HB_DirBase()+alltrim("\\transfer2.exe")
				if ((file(cArquivo11)) = .F. ) .and. ( nErroDiagnostico = 0 )
				nErroDiagnostico = 1
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Arquivo 'transfer2.exe' não encontrado." )
				Main.List_1.Value:= (indice)
				else
				nErroDiagnostico = 0
				indice++
				setProperty("Main", "List_1", "Item", (indice), "Arquivo 'transfer2.exe'...............ok." )
				Main.List_1.Value:= (indice)
				endif
				endif

if nErroDiagnostico = 0	
cArquivo12 := HB_DirBase()+alltrim("\\verify.exe")
if ((file(cArquivo12)) = .F. ) .and. ( nErroDiagnostico = 0 )
nErroDiagnostico = 1
indice++
setProperty("Main", "List_1", "Item", (indice), "Arquivo 'verify.exe' não encontrado." )
Main.List_1.Value:= (indice)
else
nErroDiagnostico = 0
indice++
setProperty("Main", "List_1", "Item", (indice), "Arquivo 'verify.exe'...............ok." )
Main.List_1.Value:= (indice)
endif
endif

Return Nil
