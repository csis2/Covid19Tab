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

Return Nil
