#include <hmg.ch>

declare window Main

* Codificação do campo "res_igm". O resultado da codificação vai para o campo "cod_igm".

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo cod_igm..." )
Main.List_1.Value:= (indice)

cCodIgm := ""
use (HB_DirBase() + "tmp_covid19.dbf" )
do while .not. eof()
switch alltrim(res_igm)
case "REAGENTE"
cCodIgm = "1"
exit
case "NAO REAGENTE"
cCodIgm = "2"
exit
case "INCONCLUSIVO OU INDE"
cCodIgm = "3"
exit
otherwise
cCodIgm = "7"
endswitch

replace cod_igm with cCodIgm
skip
enddo

close

Return Nil