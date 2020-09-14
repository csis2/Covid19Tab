#include <hmg.ch>

* Verifica se o arquivo "heading_model.c19" foi renomeado no módulo 'rename_file' e se está pronto para uso.

dt := dia_hora()
FWrite( nH, (dt) + "Esperando liberação do arquivo 'heading_model.c19' para uso." + Chr(13) + Chr(10) )
for n = 1 to 300
inkey (1)
lFile8 := HB_FileExists( (HB_DirBase()) + "\heading_model.c19" )
if lFile8 = .T.
dt := dia_hora()
FWrite( nH, (dt) + "Arquivo 'heading_model.c19' pronto." + Chr(13) + Chr(10) )
erro = 0
exit
else
dt := dia_hora()
FWrite( nH, (dt) + "Aguardando liberação do arquivo.." + Chr(13) + Chr(10) )
endif
endfor  
lFile9 := HB_FileExists( (HB_DirBase()) + "\heading_model.c19" )
if lFile9 = .F.
erro = 1
dt := dia_hora()
FWrite( nH, (dt) + "Erro ao gerar o arquivo 'heading_model.c19'." + Chr(13) + Chr(10) )
endif  

Return Nil