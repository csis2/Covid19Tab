#include "fileio.ch"

PROCEDURE Main()

* CSIS Software 2021
* replacer.prg
* Substitui algumas expressoes digitadas pelos usuarios que usam o caracter ";" evitando dessa forma,
* a geracao de inconsistencia quando os dados vao para os arquivos DBF.
* 

* "------------------------------------------------------------------------"
* "Compilado no Harbour Make (hbmk2) versao 3.0.0"
* "Roda somente com argumento de entrada."
* "Exemplo: replacer.exe MP1"
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

cFuse := ( "C:\Covid19Tab\1.9\Covid19Tab\tmp\temp_covid19alfa.txt" )
hb_fuse (cFuse)
nTotalLines := ( HB_FLastRec() - 1 ) // Total de linhas no arquivo menos a linha do cabeçalho.
HB_FGoTop()
HB_FGoTo(2)

for loopX = 1 to nTotalLines
cString := alltrim(hb_freadln())

@ 17,1 say (cString)
@ 18,1 say (loopX)
@ 19,1 say (CountLeft(cString, ";") )

HB_FSkip()

endfor

/*
cFuse := ( "C:\Covid19Tab\1.9\Covid19Tab\tmp\temp_covid19alfa.txt" )
hb_fuse (cFuse)
nTotalLines := ( HB_FLastRec() - 1 ) // Total de linhas no arquivo menos a linha do cabeçalho.
HB_FGoTop()
HB_FGoTo(2)
nVezes := 0
for loopX = 1 to nTotalLines
cString := alltrim(hb_freadln())

nSubStrExist = hb_at ("QD;",cString,0)
if nSubStrExist != 0
AtRepl( "QD;", cString, "QD." )
@ 10,1 say ( cString )
WAIT
endif

HB_FSkip()

endfor

*/

endif

Return Nil