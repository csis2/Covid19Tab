#include <hmg.ch>

declare window Main

* Codificacao do campo "classi_fin". O resultado da codificação vai para o campo "id_cla_fin".

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo 'id_cla_fin'..." )
Main.List_1.Value:= (indice)

cClassFinal := ""
use (HB_DirBase() + "tmp_covid19.dbf" )
do while .not. eof()
switch alltrim(classi_fin)
case "DESCARTADO"
cClassFinal = "1"
exit
case "CONFIRMADO CLINICO-EPIDEMIOLOGICO"
cClassFinal = "2"
exit
case "CONFIRMADO LABORATORIAL"
cClassFinal = "3"
exit
case "SINDROME GRIPAL NAO ESPECIFICADA"
cClassFinal = "4"
exit
case "CONFIRMADO CLINICO-IMAGEM"
cClassFinal = "5"
exit
case "CONFIRMADO POR CRITERIO CLINICO"
cClassFinal = "6"
exit
otherwise
cClassFinal = "7"
endswitch

replace id_cla_fin with cClassFinal
skip
enddo

close

Return Nil