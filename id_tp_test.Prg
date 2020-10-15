#include <hmg.ch>

declare window Main

* Codificacao do campo "tipo_teste". O resultado da codificação vai para o campo "id_tp_test".

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo 'id_tp_test'..." )
Main.List_1.Value:= (indice)

cTpTeste := ""
use (HB_DirBase() + "tmp_covid19.dbf" )
do while .not. eof()
switch ( alltrim(left(tipo_teste,21) ) )
case "RT-PCR"
cTpTeste = "1"
exit
case "TESTE RAPIDO - ANTICO"
cTpTeste = "2"
exit
case "TESTE RAPIDO - ANTIGE"
cTpTeste = "3"
exit
case "ENZIMAIMUNOENSAIO ? E"
cTpTeste = "4"
exit
case "IMUNOENSAIO POR ELETR"
cTpTeste = "5"
exit
case "QUIMIOLUMINESCENCIA -"
cTpTeste = "6"
exit
otherwise
cTpTeste = "0"
endswitch

replace id_tp_test with cTpTeste
skip
enddo

close

Return Nil