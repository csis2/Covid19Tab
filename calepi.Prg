#include <hmg.ch>

declare window Main

* Módulo para geração do calendário epidemiológico.
* O algoritmo de criação do calendario epidemiologico foi copiado do programa FAD 14.01.

Function calepi( nAno )

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Gerando o calendário epidemiológico..." )
Main.List_1.Value:= (indice)

cDataHoje = dtoc(date())
cAnoAtual = str(year(date()))
cAnoAtual2 = alltrim(cAnoAtual)

* Cria uma tabela DBF com o nome epid.
err=0
   matstru:= {}
   AAdd(matstru, {"sem_epi", "C", 2, 0})
   AAdd(matstru, {"dia1", "C", 10, 0})
   AAdd(matstru, {"dia2", "C", 10, 0})
   AAdd(matstru, {"dia3", "C", 10, 0})
   AAdd(matstru, {"dia4", "C", 10, 0})
   AAdd(matstru, {"dia5", "C", 10, 0})
   AAdd(matstru, {"dia6", "C", 10, 0})
   AAdd(matstru, {"dia7", "C", 10, 0})
   AAdd(matstru, {"dataproc", "C", 10, 0})
   AAdd(matstru, {"ano_atual", "C", 4, 0})
   AAdd(matstru, {"semananot", "C", 6, 0})
   dbcreate(HB_DirBase()+"\epid", matstru)

IF err<=0
PRIVATE cZero
cZero="0"
PRIVATE nTestAno,nTestAno1,nTestAno2,cTestAno,cTestAnoAntes
PRIVATE cTestAnoDepois,nAchei,cVez

cTestAno1 = ( nAno )-1
cTestAno = str(cTestAno1)
nAchei=0
cVez=0
nTestAno=VAL(cTestAno)
nTestAno1=VAL(cTestAno)-1
nTestAno2=VAL(cTestAno)+1
cTestAnoAntes=alltrim(STR(nTestAno1))
cTestAnoDepois=alltrim(STR(nTestAno2))
cAnoSolicitado = alltrim(HB_ArgV( 1 ))

PRIVATE nAnoSem,cAnoSem
PRIVATE cDateiniY,cDatefinY
PRIVATE dDia1,dDia2,dDia3,dDia4,dDia5,dDia6,dDia7,cDiae1,cDiae7
PRIVATE inicioano,dtinicio,fimano,ultsemana,cValueIs1,cValueLeft

* Inicia o algoritmo para calcular as semanas epidemiologicas do ano fornecido.
FOR vez=1 TO 3
IF vez=1
cTestAno=cTestAno
ENDIF
IF vez=2
cTestAno=cTestAnoAntes
ENDIF
IF vez=3
cTestAno=cTestAnoDepois
ENDIF
cDateiniY="01/01/"+(cTestAno)
cDatefinY="31/12/"+(cTestAno)
inicioano= CToD(cDateiniY)
   if (DoW(inicioano) <= 4)
      dtinicio= inicioano - DoW(inicioano) + 1
   else
      dtinicio= inicioano + (8 - DoW(inicioano))
   endif
fimano= CToD(cDatefiny)
   if (DoW(fimano) >= 4)
      fimano= fimano + 7 - DoW(fimano)
   else
      fimano= fimano - DoW(fimano)
   endif
   ultsemana= Int((fimano - dtinicio) / 7) + 1
* Fim do algoritmo.
   
* Povoa a tabela epid.dbf com as semanas epidemiologicas do ano.
cFileEpid := HB_DirBase()+"\epid.dbf"
use (cFileEpid)
dDia1=dtinicio
FOR nsem=1 TO ultsemana
APPEND BLANK
replace sem_epi WITH (LOWER(ALLTRIM(str(nsem))))
ENDFOR

GOTO top
dDia1=dtinicio
FOR nsem=1 TO ultsemana
GOTO (nsem)
replace dia1 WITH DTOC(dDia1)
replace dia2 WITH DTOC(dDia1+1)
replace dia3 WITH DTOC(dDia1+2)
replace dia4 WITH DTOC(dDia1+3)
replace dia5 WITH DTOC(dDia1+4)
replace dia6 WITH DTOC(dDia1+5)
replace dia7 WITH DTOC(dDia1+6)
dDia1=dDia1+7
ENDFOR

ENDFOR

* Exlui as linhas nao utilizadas da tabela epid.dbf.
goto top
n=0
do while .not. eof()
delete for empty(dia1) = .T.
skip
enddo
pack

* Ajusta a ultima linha para se adequar à semana 52 ou 53.
goto bottom
cSemIs := sem_epi
if cSemIs = "1"
replace sem_epi with "53"
endif

* Preenche o campo "dataproc" e o campo "ano_atual", respectivamente com a data atual e o ano atual do sistema operacional que esta rodando o programa.
goto top
do while .not. eof()
replace dataproc with cDataHoje
replace ano_atual with cAnoAtual2
skip
enddo

* Ajusta as primeiras semanas do ano epidemiologico para o formato SS.
goto top
FOR nRecord=1 to 9
replace sem_epi with "0"+alltrim(str(nRecord))
skip
ENDFOR

* Preenche o campo semananot com o ano da notificacao e a respectiva semana. Formato YYYYSS.
goto top
do while .not. eof()
replace semananot with cAnoSolicitado+sem_epi
skip
enddo

close

ENDIF

Return Nil
