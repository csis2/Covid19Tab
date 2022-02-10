PROCEDURE Main()

* CSIS Software 2021
* save.prg
* Script para salvar os dados de configuração do Covid19Tab e recuperar os registros em arquivo texto.
* ------------------------------------------------------------------------"
* Compilado no Harbour Make (hbmk2) versao 3.0.0
* Roda somente com argumentos de entrada.
* 
* save w [sigla da UF] [loc. arquivos sinan net] -- grava os registros em "setting.c19".
* save r - recupera os registros em "settings.c19". 
* ------------------------------------------------------------------------"

* Verifica se o primeiro argumento existe.
if empty(HB_ArgV(1)) = .T.
set color to r+/
? "Erro! O programa precisa que voce forneca obrigatoriamente o primeiro argumento como 'w' ou 'r'."
__Quit()
endif

* Verifica se o segundo argumento existe.
if ( empty(HB_ArgV(2)) = .T. ) .and. (HB_ArgV(1) = "w" )
set color to r+/
? "Erro! O programa precisa que voce forneca o segundo argumento de entrada."
__Quit()
endif

* Verifica se o terceiro argumento existe.
if ( empty(HB_ArgV(3)) = .T. ) .and. (HB_ArgV(1) = "w" )
set color to r+/
? "Erro! O programa precisa que voce forneca o terceiro argumento de entrada."
__Quit()
endif

if (HB_ArgV(1)) = "w"
use "C:\Covid19Tab\2.1\Covid19Tab\set\settings.c19"
zap 
append blank
replace uf with (HB_ArgV(2))
replace dbf_sinan with ((HB_ArgV(3)))
endif

if (HB_ArgV(1)) = "r"
crlf := chr(13) + chr(10)
use "C:\Covid19Tab\2.1\Covid19Tab\set\settings.c19"
cUF = alltrim(uf)
cDbfSinan = alltrim(dbf_sinan)
nHandle := FCreate( "C:\Covid19Tab\2.1\Covid19Tab\tmp\data3.txt" )
FWrite ( nHandle, cUF )
FWrite ( nHandle, crlf )
FWrite ( nHandle, cDbfSinan )
FWrite ( nHandle, crlf )
Fclose ( nHandle )
endif

return nil