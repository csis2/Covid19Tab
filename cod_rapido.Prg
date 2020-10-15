#include <hmg.ch>

declare window Main

* Codificação do campo "res_rapido". O resultado da codificação vai para o campo "cod_rapido".

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo cod_rapido..." )
Main.List_1.Value:= (indice)

cCodRapido := ""
use (HB_DirBase() + "tmp_covid19.dbf" )
do while .not. eof()
switch alltrim(res_rapido)
case "POSITIVO"
cCodRapido = "1"
exit
case "NEGATIVO"
cCodRapido = "2"
exit
case "INCONCLUSIVO OU INDE"
cCodRapido = "3"
exit
otherwise
cCodRapido = "7"
endswitch

replace cod_rapido with cCodRapido
skip
enddo

close

Return Nil