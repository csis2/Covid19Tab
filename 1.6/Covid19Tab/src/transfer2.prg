#include "fileio.ch"
REQUEST HB_CODEPAGE_PTISO
REQUEST HB_CODEPAGE_PT850

function Main()

* CSIS Software 2021
* Script que transfere os dados do arquivo csv selecionado pelo usuario para o arquivo
* DBF criado pelo objeto "DbfFile" e que o objeto "FieldCreation" acrescentou novos campos.
* -----------------------------------------------------------------------------------
* Compilado no Harbour Make (hbmk2) versao 3.0.0
* Roda somente com argumento de entrada.
* Exemplo: transfer2.exe MP1
* ------------------------------------------------------------------------------------

* Verifica se existe argumento.
if empty(HB_ArgV(1)) = .T.
set color to r+/
? "Erro! O programa precisa que voce forneca argumento de entrada."
__Quit()
endif

* Verifica se o argumento é valido.
set exact on
if (HB_ArgV(1)) <> "MP1" .and. (HB_ArgV(1)) <> "MP2" .and. (HB_ArgV(1)) <> "MP3"  .and. (HB_ArgV(1)) <> "MP4"
set color to r+/
? "Erro! O argumento escolhido nao e valido."
__Quit()
endif

if (HB_ArgV(1)) = "MP1"

HB_SETCODEPAGE( "PT850" )

set century on
set date british

* Criando e atribuindo valor às variáveis principais.
cMolde5 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde5.dbf" )
cFuse := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\temp_covid19alfa.txt" )
FErase( "C:\Covid19Tab\1.6\Covid19Tab\tmp\data5.txt" )
nHandle := FCreate( "C:\Covid19Tab\1.6\Covid19Tab\tmp\data5.txt" )
FWrite ( nHandle, "1.00" )
Fclose ( nHandle )
crlf := chr(13) + chr(10)

hElements := { => } // Constroi uma hash table vazia.

hb_fuse (cFuse)
use ( cMolde5 )
nTotalLines := ( HB_FLastRec() - 1 ) // Total de linhas no arquivo menos a linha do cabeçalho.
HB_FGoTop()
HB_FGoTo(2)
nVezes := 0
for loopX = 1 to nTotalLines+1

cString := alltrim(hb_freadln())
nTotalStringSize := len(cString)

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

* Fraciona a variavel cString em diversas substrings e as armazena em uma hash table.
* Primeira string antes do primeiro caracter ";".
nPos1 := hb_at ( ";", (cString) )
cSubString1 := substr ( (cString),1 ,(nPos1-1) )
hElements[ 1 ] := ( cSubString1 )

nPosX := nPos1
for n = 1 to 72
nPosY :=  hb_at ( ";", (cString), (nPosX+1) )
cSubStringY :=  substr ( (cString),(nPosX+1),(nPosY)-(nPosX+1) )
hElements[ n+1 ] := ( cSubStringY )

nPosX := nPosY
endfor

* Ultima string depois do caracter ";".
nLastPos := hb_RAt ( ";", (cString) )
cLastSubString := substr ( (cString), (nLastPos+1),(nTotalStringSize)-(nLastPos) )
hElements[ 72 ] := ( cLastSubString )

* Transfere os valores armazenados na hash table para o arquivo dbf.
append blank
replace nu_notific with upper ( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 1 ) ) ) )
replace uf_notific with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 2 ) ) ) )
replace munic_not with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 3 ) ) ) )
replace tipo_teste with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 4 ) ) ) )
replace res_rapido with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 5 ) ) ) )
replace evolucao with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 6 ) ) ) )
replace dt_tst_rap with ctod( ( HB_HGET( hElements, 7 ) ) )
replace est_teste with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 8 ) ) ) )
replace dt_encerra with ctod( ( HB_HGET( hElements, 9 ) ) )
replace classi_fin with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 10 ) ) ) )

replace res_tot with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 11 ) ) ) )
replace res_iga with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 12 ) ) ) )
replace res_igm with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 13 ) ) ) )
replace res_igg with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 14 ) ) ) )
replace t_sorolog with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 15 ) ) ) )
replace dt_tst_sor with ctod( ( HB_HGET( hElements, 16 ) ) )
replace tel_contat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 17 ) ) ) )
replace uf_reside with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 18 ) ) ) )
replace sexo with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 19 ) ) ) )
replace tem_cpf with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 20 ) ) ) )

replace estrang with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 21 ) ) ) )
replace cpf with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 22 ) ) ) )
replace munic_res with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 23 ) ) ) )
replace cns with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 24 ) ) ) )
replace dt_nasc with ctod( ( HB_HGET( hElements, 25 ) ) )
replace passaporte with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 26 ) ) ) )
replace nome_mae with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 27 ) ) ) )
replace pais with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 28 ) ) ) )
replace tel_cel with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 29 ) ) ) )
replace nm_pacient with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 30 ) ) ) )

replace profsaude with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 31 ) ) ) )
replace cbo with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 32 ) ) ) )
replace cep with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 33 ) ) ) )
replace logradouro with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 34 ) ) ) )
replace numero with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 35 ) ) ) )
replace complement with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 36 ) ) ) )
replace bairro with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 37 ) ) ) )
replace raca_cor with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 38 ) ) ) )
replace prof_seg with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 39 ) ) ) )
replace etnia with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 40 ) ) ) )

replace email with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 41 ) ) ) )
replace comunidade with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 42 ) ) ) )
replace id_comunid with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 43 ) ) ) )
replace garganta with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 44 ) ) ) )
replace dispneia with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 45 ) ) ) )
replace febre with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 46 ) ) ) )
replace tosse with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 47 ) ) ) )
replace outros with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 48 ) ) ) )
replace dor_cabeca with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 49 ) ) ) )
replace gustativos with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 50 ) ) ) )

replace olfativos with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 51 ) ) ) )
replace coriza with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 52 ) ) ) )
replace assintomat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 53 ) ) ) )
replace dt_notific with ctod( ( HB_HGET( hElements, 54 ) ) )
replace d_resp with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 55 ) ) ) )
replace d_card with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 56 ) ) ) )
replace diabetes with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 57 ) ) ) )
replace d_renais with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 58 ) ) ) )
replace imunosup with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 59 ) ) ) )
replace gestante with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 60 ) ) ) )

replace portador with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 61 ) ) ) )
replace puerpera with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 62 ) ) ) )
replace obesidade with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 63 ) ) ) )
replace dt_sintom with ctod( ( HB_HGET( hElements, 64 ) ) )
replace descricao with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 65 ) ) ) )
replace cnes_lab with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 66 ) ) ) )
replace not_cnes with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 67 ) ) ) )
replace not_cpf with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 68 ) ) ) )
replace not_email with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 69 ) ) ) )
replace not_nome with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 70 ) ) ) )

replace not_cnpj with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 72 ) ) ) )

HB_FSkip()

nPercent := (100 * loopX) / (nTotalLines + 1)
cPercent := alltrim(str(nPercent))
cRightString := right( cPercent,3 )

if cRightString = ".00"
nVezes ++
if nVezes = 1
nH := FOpen( "C:\Covid19Tab\1.6\Covid19Tab\tmp\data5.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif
endif

if cRightString <> ".00"
nVezes := 0
endif

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

endif

if (HB_ArgV(1)) = "MP2"

HB_SETCODEPAGE( "PT850" )

set century on
set date british

* Criando e atribuindo valor às variáveis principais.
cMolde5 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde5.dbf" )
cFuse := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\temp_covid19alfa.txt" )
FErase( "C:\Covid19Tab\1.6\Covid19Tab\tmp\data5.txt" )
nHandle := FCreate( "C:\Covid19Tab\1.6\Covid19Tab\tmp\data5.txt" )
FWrite ( nHandle, "1.00" )
Fclose ( nHandle )
crlf := chr(13) + chr(10)

hElements := { => } // Constroi uma hash table vazia.

hb_fuse (cFuse)
use ( cMolde5 )
nTotalLines := ( HB_FLastRec() - 1 ) // Total de linhas no arquivo menos a linha do cabeçalho.
HB_FGoTop()
HB_FGoTo(2)
nVezes := 0
for loopX = 1 to nTotalLines+1
cString := alltrim(hb_freadln())
nTotalStringSize := len(cString)

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

* Fraciona a variavel cString em diversas substrings e as armazena em uma hash table.
* Primeira string antes do primeiro caracter ";".
nPos1 := hb_at ( ";", (cString) )
cSubString1 := substr ( (cString),1 ,(nPos1-1) )
hElements[ 1 ] := ( cSubString1 )

nPosX := nPos1
for n = 1 to 69
nPosY :=  hb_at ( ";", (cString), (nPosX+1) )
cSubStringY :=  substr ( (cString),(nPosX+1),(nPosY)-(nPosX+1) )
hElements[ n+1 ] := ( cSubStringY )
nPosX := nPosY
endfor

* Ultima string depois do caracter ";".
nLastPos := hb_RAt ( ";", (cString) )
cLastSubString := substr ( (cString), (nLastPos+1),(nTotalStringSize)-(nLastPos) )
hElements[ 69 ] := ( cLastSubString )

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
replace sup_ventil with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 52 ) ) ) )
replace out_sint2 with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 53 ) ) ) )
replace condicoes with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 54 ) ) ) )
replace etnia_ind with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 55 ) ) ) )
replace out_sint with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 56 ) ) ) )
replace doen_renal with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 57 ) ) ) )
replace doen_cromo with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 58 ) ) ) )
replace sem_epi_si with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 59 ) ) ) )
replace ano_epi_si with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 60 ) ) ) )

replace sem_epi_ev with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 61 ) ) ) )
replace ano_epi_ev with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 62 ) ) ) )
replace sem_epi_in with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 63 ) ) ) )
replace ano_epi_in with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 64 ) ) ) )
replace sem_epi_no with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 65 ) ) ) )
replace ano_epi_no with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 66 ) ) ) )
replace sem_ep_uti with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 67 ) ) ) )
replace ano_ep_uti with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 69 ) ) ) )

HB_FSkip()

nPercent := (100 * loopX) / (nTotalLines + 1)
cPercent := alltrim(str(nPercent))
cRightString := right( cPercent,3 )

if cRightString = ".00"
nVezes ++
if nVezes = 1
nH := FOpen( "C:\Covid19Tab\1.6\Covid19Tab\tmp\data5.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif
endif

if cRightString <> ".00"
nVezes := 0
endif

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

endif

if (HB_ArgV(1)) = "MP3"

HB_SETCODEPAGE( "PT850" )

set century on
set date british

* Criando e atribuindo valor às variáveis principais.
cMolde5 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde5.dbf" )
cFuse := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\temp_covid19alfa.txt" )
FErase( "C:\Covid19Tab\1.6\Covid19Tab\tmp\data5.txt" )
nHandle := FCreate( "C:\Covid19Tab\1.6\Covid19Tab\tmp\data5.txt" )
FWrite ( nHandle, "1.00" )
Fclose ( nHandle )
crlf := chr(13) + chr(10)

hElements := { => } // Constroi uma hash table vazia.

hb_fuse (cFuse)
use ( cMolde5 )
nTotalLines := ( HB_FLastRec() - 1 ) // Total de linhas no arquivo menos a linha do cabeçalho.
HB_FGoTop()
HB_FGoTo(2)
nVezes := 0
for loopX = 1 to nTotalLines+1

cString := alltrim(hb_freadln())
nTotalStringSize := len(cString)

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

* Fraciona a variavel cString em diversas substrings e as armazena em uma hash table.
* Primeira string antes do primeiro caracter ";".
nPos1 := hb_at ( ";", (cString) )
cSubString1 := substr ( (cString),1 ,(nPos1-1) )
hElements[ 1 ] := ( cSubString1 )

nPosX := nPos1
for n = 1 to 38
nPosY :=  hb_at ( ";", (cString), (nPosX+1) )
cSubStringY :=  substr ( (cString),(nPosX+1),(nPosY)-(nPosX+1) )
hElements[ n+1 ] := ( cSubStringY )
nPosX := nPosY
endfor

* Ultima string depois do caracter ";".
nLastPos := hb_RAt ( ";", (cString) )
cLastSubString := substr ( (cString), (nLastPos+1),(nTotalStringSize)-(nLastPos) )
hElements[ 38 ] := ( cLastSubString )

* Transfere os valores armazenados na hash table para o arquivo dbf.
append blank
replace nu_notific with upper ( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 1 ) ) ) )
replace dt_notific with ctod( ( HB_HGET( hElements, 2 ) ) )
replace cpf with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 3 ) ) ) )
replace nm_pacient with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 4 ) ) ) )
replace sexo with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 5 ) ) ) )
replace raca_cor with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 6 ) ) ) )
replace dt_nasc with ctod( ( HB_HGET( hElements, 7 ) ) )
replace nome_mae with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 8 ) ) ) )
replace cbo with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 9 ) ) ) )
replace logradouro with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 10 ) ) ) )

replace bairro with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 11 ) ) ) )
replace cep with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 12 ) ) ) )
replace id_mn_resi with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 13 ) ) ) )
replace munic_res with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 14 ) ) ) )
replace region_res with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 15 ) ) ) )
replace macroresid with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 16 ) ) ) )
replace uf with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 17 ) ) ) )
replace munic_not with upper( ( HB_HGET( hElements, 18 ) ) )
replace diabetes with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 19 ) ) ) )
replace cardio with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 20 ) ) ) )

replace d_resp with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 21 ) ) ) )
replace imunosup with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 22 ) ) ) )
replace gestante with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 23 ) ) ) )
replace puerpera with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 24 ) ) ) )
replace dt_sin_pri with ctod( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 25 ) ) ) )
replace classific with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 26 ) ) ) )
replace criterio with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 27 ) ) ) )
replace evolucao with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 28 ) ) ) )
replace dt_evoluc with ctod( ( HB_HGET( hElements, 29 ) ) )
replace cnes_not with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 30 ) ) ) )

replace res_teste with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 31 ) ) ) )
replace tp_teste with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 32 ) ) ) )
replace dt_coleta with ctod( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 33 ) ) ) )
replace est_teste with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 34 ) ) ) )
replace profissio with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 35 ) ) ) )
replace fonte with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 36 ) ) ) )
replace idade with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 38 ) ) ) )

HB_FSkip()

nPercent := (100 * loopX) / (nTotalLines + 1)
cPercent := alltrim(str(nPercent))
cRightString := right( cPercent,3 )

if cRightString = ".00"
nVezes ++
if nVezes = 1
nH := FOpen( "C:\Covid19Tab\1.6\Covid19Tab\tmp\data5.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif
endif

if cRightString <> ".00"
nVezes := 0
endif

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

endif

if (HB_ArgV(1)) = "MP4"

HB_SETCODEPAGE( "PT850" )

set century on
set date british

* Criando e atribuindo valor às variáveis principais.
cMolde5 := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\molde5.dbf" )
cFuse := ( "C:\Covid19Tab\1.6\Covid19Tab\tmp\temp_covid19alfa.txt" )
FErase( "C:\Covid19Tab\1.6\Covid19Tab\tmp\data5.txt" )
nHandle := FCreate( "C:\Covid19Tab\1.6\Covid19Tab\tmp\data5.txt" )
FWrite ( nHandle, "1.00" )
Fclose ( nHandle )
crlf := chr(13) + chr(10)

hElements := { => } // Constroi uma hash table vazia.

hb_fuse (cFuse)
use ( cMolde5 )
nTotalLines := ( HB_FLastRec() - 1 ) // Total de linhas no arquivo menos a linha do cabeçalho.
HB_FGoTop()
HB_FGoTo(2)
nVezes := 0
for loopX = 1 to nTotalLines+1
cString := alltrim(hb_freadln())
nTotalStringSize := len(cString)

* Fraciona a variavel cString em diversas substrings e as armazena em uma hash table.
* Primeira string antes do primeiro caracter ";".
nPos1 := hb_at ( ";", (cString) )
cSubString1 := substr ( (cString),1 ,(nPos1-1) )
hElements[ 1 ] := ( cSubString1 )

nPosX := nPos1
for n = 1 to 50
nPosY :=  hb_at ( ";", (cString), (nPosX+1) )
cSubStringY :=  substr ( (cString),(nPosX+1),(nPosY)-(nPosX+1) )
hElements[ n+1 ] := ( cSubStringY )
nPosX := nPosY
endfor

* Ultima string depois do caracter ";".
nLastPos := hb_RAt ( ";", (cString) )
cLastSubString := substr ( (cString), (nLastPos+1),(nTotalStringSize)-(nLastPos) )
hElements[ 50 ] := ( cLastSubString )

* Transfere os valores armazenados na hash table para o arquivo dbf.
append blank
replace num_contat with upper ( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 1 ) ) ) )
replace nu_notific with upper( ( HB_HGET( hElements, 2 ) ) )
replace nm_contato with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 3 ) ) ) )
replace uf_reside with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 4 ) ) ) )
replace munic_res with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 5 ) ) ) )
replace id_mn_resi with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 6 ) ) ) )
replace cpf with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 7 ) ) ) )
replace tel_cel with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 8 ) ) ) )
replace telefone with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 9 ) ) ) )
replace relacao with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 10 ) ) ) )

replace rel_outros with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 11 ) ) ) )
replace dt_contato with ctod( ( HB_HGET( hElements, 12 ) ) )
replace status with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 13 ) ) ) )
replace resultado with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 14 ) ) ) )
replace dia1_data with ctod( ( HB_HGET( hElements, 15 ) ) )
replace dia1_stat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 16 ) ) ) )
replace dia2_data with ctod( ( HB_HGET( hElements, 17 ) ) )
replace dia2_stat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 18 ) ) ) )
replace dia3_data with ctod( ( HB_HGET( hElements, 19 ) ) )
replace dia3_stat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 20 ) ) ) )

replace dia4_data with ctod( ( HB_HGET( hElements, 21 ) ) )
replace dia4_stat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 22 ) ) ) )
replace dia5_data with ctod( ( HB_HGET( hElements, 23 ) ) )
replace dia5_stat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 24 ) ) ) )
replace dia6_data with ctod( ( HB_HGET( hElements, 25 ) ) )
replace dia6_stat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 26 ) ) ) )
replace dia7_data with ctod( ( HB_HGET( hElements, 27 ) ) )
replace dia7_stat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 28 ) ) ) )
replace dia8_data with ctod( ( HB_HGET( hElements, 29 ) ) )
replace dia8_stat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 30 ) ) ) )

replace dia9_data with ctod( ( HB_HGET( hElements, 31 ) ) )
replace dia9_stat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 32 ) ) ) )
replace dia10_data with ctod( ( HB_HGET( hElements, 33 ) ) )
replace dia10_stat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 34 ) ) ) )
replace dia11_data with ctod( ( HB_HGET( hElements, 35 ) ) )
replace dia11_stat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 36 ) ) ) )
replace dia12_data with ctod( ( HB_HGET( hElements, 37 ) ) )
replace dia12_stat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 38 ) ) ) )
replace dia13_data with ctod( ( HB_HGET( hElements, 39 ) ) )
replace dia13_stat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 40 ) ) ) )

replace dia14_data with ctod( ( HB_HGET( hElements, 41 ) ) )
replace dia14_stat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 42 ) ) ) )
replace dia15_data with ctod( ( HB_HGET( hElements, 43 ) ) )
replace dia15_stat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 44 ) ) ) )
replace not_cnes with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 45 ) ) ) )
replace not_cpf with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 46 ) ) ) )
replace not_email with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 47 ) ) ) )
replace not_nome with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 48 ) ) ) )
replace not_cnpj with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 50 ) ) ) )

HB_FSkip()

nPercent := (100 * loopX) / (nTotalLines + 1)
cPercent := alltrim(str(nPercent))
cRightString := right( cPercent,3 )

if cRightString = ".00"
nVezes ++
if nVezes = 1
nH := FOpen( "C:\Covid19Tab\1.6\Covid19Tab\tmp\data5.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif
endif

if cRightString <> ".00"
nVezes := 0
endif

endfor

hb_fuse()

* Exclui o ultimo registro no arquivo "molde5.dbf", pois está duplicado.
goto bottom
delete
pack

* Cria um registro extra no arquivo "molde5.dbf" com o total de registros contidos no arquivo.
append blank
replace nm_contato with "covid19tab#" + str(nTotalLines)
close

endif

return Nil