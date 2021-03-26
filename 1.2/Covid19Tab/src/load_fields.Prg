PROCEDURE Main()

* CSIS Software 2021
* Codificacao dos campos criados pelo objeto FieldCreation.
* "------------------------------------------------------------------------"
* "Compilado no Harbour Make (hbmk2) versao 3.0.0"
* "Roda somente com argumento de entrada."
* "Exemplo: load_fields.exe run"
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

cFileDBF := "C:\Covid19Tab\1.2\Covid19Tab\tmp\molde5.dbf"

* Codificacao do campo id_racacor.
cRacaCor := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(raca_cor)
case "BRANCA"
cRacaCor = "1"
exit
case "PRETA"
cRacaCor = "2"
exit
case "AMARELA"
cRacaCor = "3"
exit
case "PARDA"
cRacaCor = "4"
exit
case "INDIGENA"
cRacaCor = "5"
exit
case "IGNORADO"
cRacaCor = "9"
exit
otherwise
cRacaCor = "6"
endswitch

replace id_racacor with cRacaCor
skip
enddo
close

* Codificacao do campo id_criter.
cCriterio := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(criterio)
case "CLINICO"
cCriterio = "1"
exit
case "CLINICO-EPIDEMIOLOGICO"
cCriterio = "2"
exit
case "CLINICO-IMAGEM"
cCriterio = "3"
exit
case "LABORATORIAL"
cCriterio = "4"
exit
otherwise
cCriterio = "9"
endswitch

replace id_criter with cCriterio
skip
enddo
close

* Codificacao do campo id_evoluc.
cEvolucao := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(evolucao)
case "CURA"
cEvolucao = "1"
exit
case "EM TRATAMENTO DOMICILIAR"
cEvolucao = "2"
exit
case "INTERNADO"
cEvolucao = "3"
exit
case "INTERNADO EM UTI"
cEvolucao = "4"
exit
case "OBITO"
cEvolucao = "5"
exit
case "OBITO POR OUTRAS CAUSAS"
cEvolucao = "6"
exit
case "IGNORADO"
cEvolucao = "9"
exit
endswitch

replace id_evoluc with cEvolucao
skip
enddo
close

* Codificacao do campo id_res_tst.
cResTeste := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(res_teste)
case "INCONCLUSIVO"
cResTeste = "1"
exit
case "POSITIVO"
cResTeste = "2"
exit
case "NEGATIVO"
cResTeste = "3"
exit
otherwise
cResTeste = "9"
endswitch

replace id_res_tst with cResTeste
skip
enddo
close

set exact off
* Reescrevendo o campo tp_teste.
use (cFileDBF)
do while .not. eof()
if alltrim(tp_teste) = "ENZIMAIMUNOENSAIO"
replace tp_teste with "ENZIMAIMUNOENSAIO"
endif
skip
enddo
close
set exact on

* Codificacao do campo tp_teste.
cTpTeste := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(tp_teste)
case "ECLIA IGG"
cTpTeste = "01"
exit
case "ELISA IGM"
cTpTeste = "02"
exit
case "ENZIMAIMUNOENSAIO"
cTpTeste = "03"
exit
case "IGA"
cTpTeste = "04"
exit
case "IGG"
cTpTeste = "05"
exit
case "IGM"
cTpTeste = "06"
exit
case "IMUNOENSAIO POR ELETRO"
cTpTeste = "07"
exit
case "QUIMIOLUMINESCENCIA -"
cTpTeste = "08"
exit
case "RT-PCR"
cTpTeste = "09"
exit
case "TESTE RAPIDO - ANTICOR"
cTpTeste = "10"
exit
case "TESTE RAPIDO - ANTIGEN"
cTpTeste = "11"
exit
otherwise
cTpTeste = "12"
endswitch

replace id_tp_tst with cTpTeste
skip
enddo
close

* Codificacao do campo id_est_tst.
cEstTeste := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(est_teste)
case "COLETADO"
cEstTeste = "1"
exit
case "CONCLUIDO"
cEstTeste = "2"
exit
case "EXAME NAO"
cEstTeste = "3"
exit
case "SOLICITADO"
cEstTeste = "4"
exit
otherwise
cEstTeste = "9"
endswitch

replace id_est_tst with cEstTeste
skip
enddo
close

* Codificacao do campo id_fonte.
cFonte := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(fonte)
case "ESUS"
cFonte = "1"
exit
case "SIVEP"
cFonte = "2"
exit
otherwise
cFonte = "9"
endswitch

replace id_fonte with cFonte
skip
enddo
close

* Codificacao do campo cls_sivep.
cClassSivep := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(clas_sivep)
case "SEM CLASSIFICACAO"
cClassSivep = "1"
exit
case "SRAG POR COVID19"
cClassSivep = "2"
exit
otherwise
cClassSivep = "9"
endswitch

replace cls_sivep with cClassSivep
skip
enddo
close

* Codificacao do campo id_class.
cClass := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(classific)
case "CONFIRMADO"
cClass = "1"
exit
case "DESCARTADO"
cClass = "2"
exit
case "SINDROME GRIPAL NAO ESPECIFICADA"
cClass = "3"
exit
case "SRAG NAO ESPECIFICADO"
cClass = "4"
exit
case "SUSPEITO"
cClass = "5"
exit
otherwise
cClass = "9"
endswitch

replace id_class with cClass
skip
enddo
close

* Codificacao do campo nu_idade_c.
use (cFileDBF)
do while .not. eof()
erro_age = 0
days := ((dt_sin_pri) - (dt_nasc))
months := int ((days) / 30)
years := int((days) / 365)

if days < 30 .and. months = 0 .and. years = 0
nSize := len(alltrim(str(days)))
 SWITCH nSize
   CASE 1
	  idade = "2"+"00"+alltrim(str(days)) 
	  exit
   CASE 2
	  idade = "2"+"0"+alltrim(str(days))    
	  exit
   ENDSWITCH
endif

if days <> 0 .and. months <> 0 .and. years = 0 
nSize2 := len(alltrim(str(months)))
 SWITCH nSize2
   CASE 1
	  idade = "3"+"00"+alltrim(str(months)) 
	  exit
   CASE 2
	  idade = "3"+"0"+alltrim(str(months))    
	  exit
   ENDSWITCH
endif

if days <> 0 .and. months <> 0 .and. years <> 0 
nSize3 := len(alltrim(str(years)))
 SWITCH nSize3
   CASE 1
	  idade = "4"+"00"+alltrim(str(years)) 	  
	  exit
   CASE 2
	  idade = "4"+"0"+alltrim(str(years))   
	  exit
   ENDSWITCH
endif

if (dt_sin_pri) < (dt_nasc)
erro_age = 1
endif

if erro_age = 0
replace nu_idade_c with alltrim(idade)
endif

skip
enddo
close

* Codificacao do campo sem_not.
cSemNot := ""
use (cFileDBF)
do while .not. eof()
nSemNot := val( sem_epi_no )
if nSemNot >=1 .and. nSemNot <= 9
cSemNot = ano_epi_no + "0" + sem_epi_no
else
cSemNot = ano_epi_no + sem_epi_no
endif
replace sem_not with ( cSemNot )
skip
enddo
close

* Codificacao do campo sem_pri.
cSemPri := ""
use (cFileDBF)
do while .not. eof()
nSemPri := val( sem_epi_si )
if nSemPri >=1 .and. nSemPri <= 9
cSemPri = ano_epi_si + "0" + sem_epi_si
else
cSemPri = ano_epi_si + sem_epi_si
endif
replace sem_pri with ( cSemPri )
skip
enddo
close

* Codificacao do campo sem_evoluc.
cSemEv := ""
use (cFileDBF)
do while .not. eof()
nSemEv := val( sem_epi_ev )
if nSemEv >=1 .and. nSemEv <= 9
cSemEv = ano_epi_ev + "0" + sem_epi_ev
else
cSemEv = ano_epi_ev + sem_epi_ev
endif
replace sem_evoluc with ( cSemEv )
skip
enddo
close

* Codificacao do campo sem_inter.
cSemInter := ""
use (cFileDBF)
do while .not. eof()
nSemInter := val( sem_epi_in )
if nSemInter >=1 .and. nSemInter <= 9
cSemInter = ano_epi_in + "0" + sem_epi_in
else
cSemInter = ano_epi_in + sem_epi_in
endif
replace sem_inter with ( cSemInter )
skip
enddo
close

* Codificacao do campo sg_uf.
cUFResid := ""
use (cFileDBF)
do while .not. eof()
cUFResid = LEFT( id_mn_resi,2 )
replace sg_uf with cUFResid
skip
enddo
close

* Codificacao do campo id_rg_resi.

	  aArray8 := {}
	  cFileDBFNet := "C:\Covid19Tab\1.2\Covid19Tab\baseDBF\MUNICNET.DBF"
	  cUnidF := "GO"
	  use ( cFileDBFNet )
	  nRecs := reccount()
      FOR x := 1 TO nRecs
	  if alltrim(sg_uf) = ( cUnidF )
      AAdd( aArray8, {alltrim(id_municip),alltrim(id_regiona)} )
	  endif
	  skip
	  NEXT
	  close
	  aArray8 := asort( aArray8,,,{|x,y| x[1] < y[1] } )  	  

use (cFileDBF)
do while .not. eof()
erro_rg = 0
cValor = alltrim(id_mn_resi)
if empty(cValor) = .F.
nPlace := ascan( aArray8, {|x| x[1] == (cValor) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cPlaceRegiCode := aArray8[nPlace,2]
recover
erro_rg = 1
end sequence

if erro_rg = 0
replace id_rg_resi with cPlaceRegiCode
endif
endif

skip
enddo
close

Return Nil