﻿#include "fileio.ch"
REQUEST HB_CODEPAGE_PTISO
REQUEST HB_CODEPAGE_PT850

function Main()

* CSIS Software 2021
* Script que transfere os dados do arquivo csv selecionado pelo usuario para o arquivo
* DBF criado pelo objeto "DbfFile" e que o objeto "FieldCreation" acrescentou novos campos.
* -----------------------------------------------------------------------------------
* Compilado no Harbour Make (hbmk2) versao 3.0.0
* Roda somente com argumento de entrada.
* Exemplo: transfer2.exe run
* ------------------------------------------------------------------------------------

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

HB_SETCODEPAGE( "PT850" )

set century on
set date british

* Acessando o arquivo de configuração do Covid19Tab e lendo a configuração de campo inconsistente.
* use ( (HB_DirBase()) + "\settings.c19" )
* lInconsist := registros
* close

* Criando e atribuindo valor às variáveis principais.
cMolde5 := ( "C:\Covid19Tab\1.2\Covid19Tab\tmp\molde5.dbf" )
cFuse := ( "C:\Covid19Tab\1.2\Covid19Tab\tmp\temp_covid19alfa.txt" )

hElements := { => } // Constroi uma hash table vazia.

hb_fuse (cFuse)
use ( cMolde5 )
nTotalLines := ( HB_FLastRec() - 1 ) // Total de linhas no arquivo menos a linha do cabeçalho.
HB_FGoTop()
HB_FGoTo(2)
for loopX = 1 to nTotalLines+1
cString := alltrim(hb_freadln())
nTotalStringSize := len(cString)

* Procura por inconsistencias nas linhas do arquivo, se o programa estiver configurado para tal tarefa.
*if lInconsist = .T.
nCharExist := hb_at ('"',cString,0)
if nCharExist != 0
do while hb_at ('"',cString,0) != 0
nQuotesPos1 := hb_at ('"',cString,0)
nQuotesPos2 := hb_at ('"',cString,nQuotesPos1+1)
nDif := ( nQuotesPos2 - nQuotesPos1+1 )
cSubStr := SubStr( ( cString ) , ( nQuotesPos1 ), ( nDif ) )
cNewSubStr := REPLALL( ( cSubStr ), ",", ";" )
cNewSubStr2 := RANGEREPL(CHR(59), CHR(59), cNewSubStr, ",")
cNewSubStr3 := RANGEREPL(CHR(34), CHR(34), cNewSubStr2, ",")
cReplace:= StrTran( ( cString ), ( cSubStr ), ( cNewSubStr3 ) )
cString := ( cReplace )
enddo
endif
*endif

* Fraciona a variavel cString em diversas substrings e as armazena em uma hash table.
* Primeira string antes do primeiro caracter ";".
nPos1 := hb_at ( ";", (cString) )
cSubString1 := substr ( (cString),1 ,(nPos1-1) )
hElements[ 1 ] := ( cSubString1 )

nPosX := nPos1
for n = 1 to 66
nPosY :=  hb_at ( ";", (cString), (nPosX+1) )
cSubStringY :=  substr ( (cString),(nPosX+1),(nPosY)-(nPosX+1) )
hElements[ n+1 ] := ( cSubStringY )
nPosX := nPosY
endfor

* Ultima string depois do caracter ";".
nLastPos := hb_RAt ( ";", (cString) )
cLastSubString := substr ( (cString), (nLastPos+1),(nTotalStringSize)-(nLastPos) )
hElements[ 66 ] := ( cLastSubString )

* Transfere os valores armazenados na hash table para o arquivo dbf.
append blank
replace nu_notific with upper ( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 1 ) ) ) )
replace dt_notific with ctod( ( HB_HGET( hElements, 2 ) ) )
replace cpf with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 3 ) ) ) )
replace nm_pacient with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 4 ) ) ) )
replace sexo with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 5 ) ) ) )
replace raca_cor with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 6 ) ) ) )
replace dt_nasc with ctod( ( HB_HGET( hElements, 7 ) ) )
replace idade with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 8 ) ) ) )
replace cbo with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 9 ) ) ) )
replace id_mn_resi with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 10 ) ) ) )

replace munic_res with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 11 ) ) ) )
replace region_res with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 12 ) ) ) )
replace macroresid with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 13 ) ) ) )
replace uf with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 14 ) ) ) )
replace dt_sin_pri with ctod( ( HB_HGET( hElements, 15 ) ) )
replace diabetes with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 16 ) ) ) )
replace cardio with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 17 ) ) ) )
replace d_resp with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 18 ) ) ) )
replace imunosup with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 19 ) ) ) )
replace classific with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 20 ) ) ) )

replace criterio with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 21 ) ) ) )
replace evolucao with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 22 ) ) ) )
replace dt_evoluc with ctod( ( HB_HGET( hElements, 23 ) ) )
replace cnes_not with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 24 ) ) ) )
replace res_teste with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 25 ) ) ) )
replace tp_teste with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 26 ) ) ) )
replace est_teste with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 27 ) ) ) )
replace profissio with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 28 ) ) ) )
replace fonte with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 29 ) ) ) )
replace clas_sivep with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 30 ) ) ) )

replace internacao with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 31 ) ) ) )
replace dt_inter with ctod( ( HB_HGET( hElements, 32 ) ) )
replace inter_uti with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 33 ) ) ) )
replace dt_int_uti with ctod( ( HB_HGET( hElements, 34 ) ) )
replace dt_sai_uti with ctod( ( HB_HGET( hElements, 35 ) ) )
replace puerpera with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 36 ) ) ) )
replace hemato with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 37 ) ) ) )
replace sind_down with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 38 ) ) ) )
replace hepat_cron with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 39 ) ) ) )
replace neuro_cron with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 40 ) ) ) )

replace renal_cron with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 41 ) ) ) )
replace obesidade with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 42 ) ) ) )
replace gestante with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 43 ) ) ) )
replace febre with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 44 ) ) ) )
replace tosse with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 45 ) ) ) )
replace dor_gargan with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 46 ) ) ) )
replace dispneia with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 47 ) ) ) )
replace desc_resp with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 48 ) ) ) )
replace saturacao with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 49 ) ) ) )
replace diarreia with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 50 ) ) ) )

replace vomito with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 51 ) ) ) )
replace out_sint2 with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 52 ) ) ) )
replace condicoes with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 53 ) ) ) )
replace etnia_ind with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 54 ) ) ) )
replace out_sint with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 55 ) ) ) )
replace doen_renal with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 56 ) ) ) )
replace doen_cromo with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 57 ) ) ) )
replace sem_epi_si with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 58 ) ) ) )
replace ano_epi_si with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 59 ) ) ) )
replace sem_epi_ev with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 60 ) ) ) )

replace ano_epi_ev with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 61 ) ) ) )
replace sem_epi_in with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 62 ) ) ) )
replace ano_epi_in with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 63 ) ) ) )
replace sem_epi_no with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 64 ) ) ) )
replace ano_epi_no with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 66 ) ) ) )

HB_FSkip()

endfor

hb_fuse()

* Exclui o ultimo registro no arquivo "molde5.dbf", pois está duplicado.
goto bottom
delete
pack

* Cria um registro extra no arquivo "molde5.dbf" com o total de registros contidos no arquivo.
append blank
replace nm_pacient with "covid19tab#" + str(nTotalLines)
close

return Nil