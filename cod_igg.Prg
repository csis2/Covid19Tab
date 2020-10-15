#include <hmg.ch>

declare window Main

* Codificação do campo "res_igg". O resultado da codificação vai para o campo "cod_igg".

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo cod_igg..." )
Main.List_1.Value:= (indice)

cCodIgg := ""
use (HB_DirBase() + "tmp_covid19.dbf" )
do while .not. eof()
switch alltrim(res_igg)
case "REAGENTE"
cCodIgg = "1"
exit
case "NAO REAGENTE"
cCodIgg = "2"
exit
case "INCONCLUSIVO OU INDE"
cCodIgg = "3"
exit
otherwise
cCodIgg = "7"
endswitch

replace cod_igg with cCodIgg
skip
enddo

close

Return Nil