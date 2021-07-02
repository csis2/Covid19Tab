PROCEDURE Main()

* CSIS Software 2021
* Script que coleta dados do arquivo 'molde5.dbf' para verificar se a
* transferencia foi bem sucedida.
* "------------------------------------------------------------------------"
* "Compilado no Harbour Make (hbmk2) versao 3.0.0"
* "Roda somente com argumento de entrada. No caso, o tipo de arquivo que esta sendo processado."
* "Exemplo: getdata.exe MP1"
* "------------------------------------------------------------------------"

* Verifica se existe argumento.
if empty(HB_ArgV(1)) = .T.
set color to r+/
? "Erro! O programa precisa que voce forneca argumento de entrada."
__Quit()
endif

* Verifica se o argumento é valido.
set exact on
if (HB_ArgV(1)) <> "MP1" .and. (HB_ArgV(1)) <> "MP2" .and. (HB_ArgV(1)) <> "MP3" .and. (HB_ArgV(1)) <> "MP4"
set color to r+/
? "Erro! O argumento escolhido nao e valido."
__Quit()
endif

* O ultimo registro do arquivo 'molde5.dbf' contém a quantidade de linhas do arquivo 'temp_covid19alfa.txt'. Cada linha
* representa um registro. O trecho seguinte extrai essa informação do arquivo 'molde5.dbf'.

use "C:\Covid19Tab\1.5\Covid19Tab\tmp\molde5.dbf"
dbgobottom()
if (HB_ArgV(1)) = "MP4"
cTxtRecs := nm_contato
else
cTxtRecs := nm_pacient
endif

cTxtRecs2 := substr(cTxtRecs,12,40)
cTxtRecs3 := rtrim(cTxtRecs2)
cTxtRecs4 := ltrim(cTxtRecs3)
nTxtRecs := val(cTxtRecs4) // quantidade de linhas do arquivo 'temp_covid19alfa.txt'.

* Deleta o registro com a quantidade de linhas do arquivo temp_covid19alfa.txt.
delete record (reccount())
pack

nDbfRecs := reccount() // quantidade de linhas do arquivo 'molde5.dbf'.

* Calcula o percentual de aproveitamento da transferencia.
nPercent := (nDbfRecs*100) / (nTxtRecs)

* Mostra os valores encontrados no componente List_1.
cDisplayTxt := "Total de registros do arquivo CSV:" + alltrim(cTxtRecs4)
cDisplayDbf := "Total de registros do arquivo DBF:" + alltrim(str(nDbfRecs))
cPercent := "Aproveitamento:" + alltrim(str(nPercent))

crlf := chr(13) + chr(10)
nHandle := FCreate( "C:\Covid19Tab\1.5\Covid19Tab\tmp\data1.txt" )
FWrite ( nHandle, cDisplayTxt )
FWrite ( nHandle, crlf )
FWrite ( nHandle, cDisplayDbf )
FWrite ( nHandle, crlf )
FWrite ( nHandle, cPercent )
FWrite ( nHandle, crlf )
Fclose ( nHandle )

Return Nil