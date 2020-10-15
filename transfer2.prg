#include "fileio.ch"
REQUEST HB_CODEPAGE_PTISO
REQUEST HB_CODEPAGE_PT850

function Main()

HB_SETCODEPAGE( "PT850" )

set century on
set date british

* Acessando o arquivo de configuração do Covid19Tab e lendo a configuração de campo inconsistente.
use ( (HB_DirBase()) + "\settings.c19" )
lInconsist := registros
close

* Criando e atribuindo valor às variáveis principais.
cMolde3 := ( (HB_DirBase()) + "\molde4.dbf" )
cFuse := ( (HB_DirBase()) + "\temp_covid19beta.txt" )

hElements := { => } // Constroi uma hash table vazia.

hb_fuse (cFuse)
use ( cMolde3 )
nTotalLines := ( HB_FLastRec() - 1 ) // Total de linhas no arquivo menos a linha do cabeçalho.
HB_FGoTop()
HB_FGoTo(2)
for loopX = 1 to nTotalLines+1
cString := alltrim(hb_freadln())
nTotalStringSize := len(cString)

* Procura por inconsistencias nas linhas do arquivo, se o programa estiver configurado para tal tarefa.
if lInconsist = .T.
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
endif

* Fraciona a variavel cString em diversas substrings e as armazena em uma hash table.
* Primeira string antes do primeiro caracter ";".
nPos1 := hb_at ( ";", (cString) )
cSubString1 := substr ( (cString),1 ,(nPos1-1) )
hElements[ 1 ] := ( cSubString1 )

nPosX := nPos1
for n = 1 to 68
nPosY :=  hb_at ( ";", (cString), (nPosX+1) )
cSubStringY :=  substr ( (cString),(nPosX+1),(nPosY)-(nPosX+1) )
hElements[ n+1 ] := ( cSubStringY )
nPosX := nPosY
endfor

* Ultima string depois do caracter ";".
nLastPos := hb_RAt ( ";", (cString) )
cLastSubString := substr ( (cString), (nLastPos+1),(nTotalStringSize)-(nLastPos) )
hElements[ 70 ] := ( cLastSubString )

* Transfere os valores armazenados na hash table para o arquivo dbf.
append blank
replace nu_notific with upper ( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 1 ) ) ) )
replace uf_notific with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 2 ) ) ) )
replace munic_not with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 3 ) ) ) )
replace profsaude with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 4 ) ) ) )
replace tel_contat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 5 ) ) ) )
replace etnia with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 6 ) ) ) )
replace logradouro with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 7 ) ) ) )
replace evolucao with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 8 ) ) ) )
replace tipo_teste with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 9 ) ) ) )
replace uf_reside with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 10 ) ) ) )
replace numero with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 11 ) ) ) )

replace res_tot with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 12 ) ) ) )

replace dt_notific with ctod( ( HB_HGET( hElements, 13 ) ) )

replace res_iga with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 14 ) ) ) )

replace cbo with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 15 ) ) ) )
replace garganta with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 16 ) ) ) )
replace dispneia with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 17 ) ) ) )
replace febre with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 18 ) ) ) )
replace tosse with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 19 ) ) ) )
replace outros with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 20 ) ) ) )
replace dor_cabeca with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 21 ) ) ) )
replace gustativos with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 22 ) ) ) )
replace olfativos with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 23 ) ) ) )
replace coriza with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 24 ) ) ) )
replace assintomat with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 25 ) ) ) )
replace cep with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 26 ) ) ) )
replace prof_seg with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 27 ) ) ) )

replace res_rapido with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 28 ) ) ) )

replace raca_cor with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 29 ) ) ) )

replace t_sorolog with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 30 ) ) ) )

replace sexo with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 31 ) ) ) )
replace estrang with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 32 ) ) ) )
replace tem_cpf with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 33 ) ) ) )

replace res_igm with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 34 ) ) ) )

replace est_teste with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 35 ) ) ) )

replace dt_tst_sor with ctod( ( HB_HGET( hElements, 36 ) ) )
replace res_igg with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 37 ) ) ) )

replace cns with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 38 ) ) ) )
replace d_resp with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 39 ) ) ) )
replace d_card with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 40 ) ) ) )
replace diabetes with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 41 ) ) ) )
replace d_renais with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 42 ) ) ) )
replace imunosup with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 43 ) ) ) )
replace gestante with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 44 ) ) ) )
replace portador with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 45 ) ) ) )
replace puerpera with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 46 ) ) ) )
replace obesidade with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 47 ) ) ) )
replace bairro with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 48 ) ) ) )

replace dt_tst_rap with ctod( ( HB_HGET( hElements, 49 ) ) )

replace descricao with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 50 ) ) ) )
replace dt_encerra with ctod( ( HB_HGET( hElements, 51 ) ) )
replace dt_nasc with ctod( ( HB_HGET( hElements, 52 ) ) )
replace classi_fin with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 53 ) ) ) )
replace munic_res with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 54 ) ) ) )

replace noname_fld with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 55 ) ) ) )

replace complement with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 56 ) ) ) )
replace passaporte with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 57 ) ) ) )
replace cpf with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 58 ) ) ) )
replace nome with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 59 ) ) ) )
replace pais with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 60 ) ) ) )
replace dt_sintom with ctod( ( HB_HGET( hElements, 61 ) ) )
replace nome_mae with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 62 ) ) ) )
replace tel_cel with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 63 ) ) ) )
replace not_cnes with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 64 ) ) ) )
replace not_cpf with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 65 ) ) ) )
replace not_email with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 66 ) ) ) )
replace not_nome with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 67 ) ) ) )
replace not_cnpj with upper( remacent("",hb_UTF8ToStr( HB_HGET( hElements, 68 ) ) ) )

HB_FSkip()

endfor

hb_fuse()

* Cria um registro extra no arquivo "molde4.dbf" com o total de registros contidos no arquivo.
append blank
replace nome with "covid19tab#" + str(nTotalLines)
close

return Nil