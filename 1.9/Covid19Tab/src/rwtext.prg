PROCEDURE Main()

* CSIS Software 2021
* Script criado para gerar o arquivo "heading_ready.txt". Esse arquivo nao
* contem o carriage return do arquivo "heading.txt".
* "------------------------------------------------------------------------"
* "Compilado no Harbour Make (hbmk2) versao 3.0.0"
* "Roda somente com argumento de entrada."
* "Exemplo: rwtext.exe run"
* "------------------------------------------------------------------------"

* Verifica se existe argumento.
if empty(HB_ArgV(1)) = .T.
set color to r+/
? "Erro! O programa precisa que voce forneca argumento de entrada."
__Quit()
endif

* Verifica se o argumento é valido.
set exact on
if (HB_ArgV(1)) <> "run"
set color to r+/
? "Erro! O argumento escolhido nao e valido."
__Quit()
endif

cBuffer := space( 2000 )
cAddress := "c:\covid19tab\1.9\covid19tab\tmp\heading.txt"
nH := Fopen ( cAddress )
FRead( nH, @cBuffer, 2000 )
cString := alltrim ( cBuffer )
nStringSize := len( cString ) - 2
FClose( nH )

cBuffer := space( nStringSize )
nH2 := Fopen ( cAddress )
FRead( nH2, @cBuffer, nStringSize )
FClose( nH2 )

cAddress2 := "c:\covid19tab\1.9\covid19tab\tmp\heading_ready.txt"
nHandle := FCreate ( cAddress2 )
FWrite ( nHandle, ( alltrim(cBuffer) ) )
FClose ( nHandle )

return nil