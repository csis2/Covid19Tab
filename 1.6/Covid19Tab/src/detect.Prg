PROCEDURE Main()

* CSIS Software 2021
* detect.prg
* Detecta inconsistencia no arquivo molde5.dbf.
* "------------------------------------------------------------------------"
* "Compilado no Harbour Make (hbmk2) versao 3.0.0"
* "Roda somente com argumento de entrada."
* "Exemplo: detect.exe MP1"
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
if (HB_ArgV(1)) <> "MP1" .and. (HB_ArgV(1)) <> "MP2" .and. (HB_ArgV(1)) <> "MP3" .and. (HB_ArgV(1)) <> "MP4"
set color to r+/
? "Erro! O argumento escolhido nao e valido."
__Quit()
endif

if (HB_ArgV(1)) = "MP1"

crlf := chr(13) + chr(10)
nH := FCreate( "C:\Covid19Tab\1.6\Covid19Tab\tmp\data2.txt" )
FWrite ( nH, "Modulo Detect - Registros inconsistentes de nivel 2 encontrados:" )
FWrite ( nH, crlf )
FWrite ( nH, "================================================================" )
FWrite ( nH, crlf )
FWrite ( nH, "num.registro, num.da notificacao, nome do paciente" )
FWrite ( nH, crlf )
use "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde5.dbf"
do while .not. eof()
if empty(dt_notific) = .T.
cRegistro := alltrim(str( recno() )) + "," + alltrim( nu_notific ) + "," + alltrim( nm_pacient )
FWrite ( nH, cRegistro )
FWrite ( nH, crlf )
endif
skip
enddo

close
Fclose ( nH )
copy file "C:\Covid19Tab\1.6\Covid19Tab\tmp\data2.txt" to "C:\Covid19Tab\1.6\Covid19Tab\rel\relatorio_nivel2.txt"

endif

if (HB_ArgV(1)) = "MP2"

crlf := chr(13) + chr(10)
nH := FCreate( "C:\Covid19Tab\1.6\Covid19Tab\tmp\data2.txt" )
FWrite ( nH, "Modulo Detect - Registros inconsistentes de nivel 2 encontrados:" )
FWrite ( nH, crlf )
FWrite ( nH, "================================================================" )
FWrite ( nH, crlf )
FWrite ( nH, "num.registro, num.da notificacao, nome do paciente" )
FWrite ( nH, crlf )
use "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde5.dbf"
do while .not. eof()
nSize := len(alltrim(ano_epi_no))
if nSize < 4
cRegistro := alltrim(str( recno() )) + "," + alltrim( nu_notific ) + "," + alltrim( nm_pacient )
FWrite ( nH, cRegistro )
FWrite ( nH, crlf )
endif
skip
enddo

close
Fclose ( nH )
copy file "C:\Covid19Tab\1.6\Covid19Tab\tmp\data2.txt" to "C:\Covid19Tab\1.6\Covid19Tab\rel\relatorio_nivel2.txt"

endif

if (HB_ArgV(1)) = "MP3"

crlf := chr(13) + chr(10)
nH := FCreate( "C:\Covid19Tab\1.6\Covid19Tab\tmp\data2.txt" )
FWrite ( nH, "Modulo Detect - Registros inconsistentes de nivel 2 encontrados:" )
FWrite ( nH, crlf )
FWrite ( nH, "================================================================" )
FWrite ( nH, crlf )
FWrite ( nH, "num.registro, num.da notificacao, nome do paciente" )
FWrite ( nH, crlf )
use "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde5.dbf"
do while .not. eof()
nSize := len(alltrim(munic_not))
if nSize = 0
cRegistro := alltrim(str( recno() )) + "," + alltrim( nu_notific ) + "," + alltrim( nm_pacient )
FWrite ( nH, cRegistro )
FWrite ( nH, crlf )
endif
skip
enddo

close
Fclose ( nH )
copy file "C:\Covid19Tab\1.6\Covid19Tab\tmp\data2.txt" to "C:\Covid19Tab\1.6\Covid19Tab\rel\relatorio_nivel2.txt"

endif

Return Nil