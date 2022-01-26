#include "fileio.ch"

PROCEDURE Main()

* CSIS Software 2021
* filter_one.prg
* Detecta inconsistencia no arquivo temp_covid19alfa.txt antes de ser usado
* para geracao de arquivo no formato DBF.
* "------------------------------------------------------------------------"
* "Compilado no Harbour Make (hbmk2) versao 3.0.0"
* "Roda somente com argumento de entrada."
* "Exemplo: filter_one.exe MP1"
* "------------------------------------------------------------------------"

* Verifica se existe argumento.
if empty(HB_ArgV(1)) = .T.
set color to r+/
? "Erro! O programa precisa que voce forneca argumento de entrada."
wait
__Quit()
endif

* Verifica se o argumento é valido.
set exact on
if (HB_ArgV(1)) <> "MP1" .and. (HB_ArgV(1)) <> "MP2" .and. (HB_ArgV(1)) <> "MP3" .and. (HB_ArgV(1)) <> "MP4" .and. (HB_ArgV(1)) <> "MP5"
set color to r+/
? "Erro! O argumento escolhido nao e valido."
__Quit()
endif

if (HB_ArgV(1)) = "MP1"

nRec := 0
FErase( "C:\Covid19Tab\1.9\Covid19Tab\tmp\data10.txt" )
nHandle := FCreate( "C:\Covid19Tab\1.9\Covid19Tab\tmp\data10.txt" )
FWrite ( nHandle, "1.00" )
Fclose ( nHandle )
crlf := chr(13) + chr(10)

nH := FCreate( "C:\Covid19Tab\1.9\Covid19Tab\tmp\filtro1.txt" )
FWrite ( nH, "Filtro1 - Registros com inconsistencia nivel 1." )
FWrite ( nH, crlf )
FWrite ( nH, "=====================================================" )
FWrite ( nH, crlf )
FWrite ( nH, "num.registro, calculo inconsistencia" )
FWrite ( nH, crlf )

cFuse := ( "C:\Covid19Tab\1.9\Covid19Tab\tmp\temp_covid19alfa.txt" )
hb_fuse (cFuse)
nTotalLines := ( HB_FLastRec() - 1 ) // Total de linhas no arquivo menos a linha do cabeçalho.
HB_FGoTop()
HB_FGoTo(2)
nVezes := 0
for loopX = 1 to nTotalLines
cString := alltrim(hb_freadln())
nTotalStringSize := len(cString)

nCharExist := hb_at (';',cString,0)
cSubStr := SubStr( cString, 0, nCharExist-1 )
nSubStr := val( cSubStr )
cSubStr2 := alltrim (str( nSubStr ))
nLen_cSubStr := len( cSubStr )
nLen_cSubStr2 := len ( cSubStr2 )
nDif := ( nLen_cSubStr2 - nLen_cSubStr )

if nDif <> 0
nRec ++
cRegistro := alltrim(str( loopX + 1 )) + "," + str ( nDif )
FWrite ( nH, cRegistro )
FWrite ( nH, crlf )
endif

HB_FSkip()

nPercent := (100 * loopX) / (nTotalLines + 1)
cPercent := alltrim(str(nPercent))
cRightString := right( cPercent,3 )

if cRightString = ".00"
nVezes ++
if nVezes = 1
nH2 := FOpen( "C:\Covid19Tab\1.9\Covid19Tab\tmp\data10.txt", FO_WRITE)
FWrite ( nH2, cPercent )
FWrite ( nH2, crlf )
Fclose ( nH2 )
endif
endif

if cRightString <> ".00"
nVezes := 0
endif

endfor

Fclose ( nH )
if nRec > 0
copy file "C:\Covid19Tab\1.9\Covid19Tab\tmp\filtro1.txt" to "C:\Covid19Tab\1.9\Covid19Tab\rel\relatorio_nivel1.txt"
endif

endif

Return Nil