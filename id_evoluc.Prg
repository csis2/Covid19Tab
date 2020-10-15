#include <hmg.ch>

declare window Main

* Codificacao do campo "evolucao". O resultado da codificação vai para o campo "id_evoluc".

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo 'id_evoluc'..." )
Main.List_1.Value:= (indice)

cEvolucao := ""
use (HB_DirBase() + "tmp_covid19.dbf" )
do while .not. eof()
switch alltrim(evolucao)
case "CANCELADO"
cEvolucao = "1"
exit
case "INTERNADO"
cEvolucao = "2"
exit
case "OBITO"
cEvolucao = "3"
exit
case "EM TRATAMENTO DOMICILIAR"
cEvolucao = "4"
exit
case "CURA"
cEvolucao = "5"
exit
case "INTERNADO EM UTI"
cEvolucao = "6"
exit
case "IGNORADO"
cEvolucao = "9"
exit
otherwise
cEvolucao = "0"
endswitch

replace id_evoluc with cEvolucao
skip
enddo

close

Return Nil