#include <hmg.ch>

declare window Main

* Codificação do campo "res_tot". O resultado da codificação vai para o campo "cod_restot".

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo cod_restot..." )
Main.List_1.Value:= (indice)

cCodResTot := ""
use (HB_DirBase() + "tmp_covid19.dbf" )
do while .not. eof()
switch alltrim(res_tot)
case "REAGENTE"
cCodResTot = "1"
exit
case "NAO REAGENTE"
cCodResTot = "2"
exit
case "INCONCLUSIVO OU INDE"
cCodResTot = "3"
exit
otherwise
cCodResTot = "7"
endswitch

replace cod_restot with cCodResTot
skip
enddo

close

Return Nil