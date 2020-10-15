#include <hmg.ch>

declare window Main

* Codificação do campo "res_iga". O resultado da codificação vai para o campo "cod_iga".

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo cod_iga..." )
Main.List_1.Value:= (indice)

cCodIga := ""
use (HB_DirBase() + "tmp_covid19.dbf" )
do while .not. eof()
switch alltrim(res_iga)
case "REAGENTE"
cCodIga = "1"
exit
case "NAO REAGENTE"
cCodIga = "2"
exit
case "INCONCLUSIVO OU INDE"
cCodIga = "3"
exit
otherwise
cCodIga = "7"
endswitch

replace cod_iga with cCodIga
skip
enddo

close

Return Nil