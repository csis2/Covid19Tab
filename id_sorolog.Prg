#include <hmg.ch>

declare window Main

* Codificacao do campo "t_sorolog". O resultado da codificação vai para o campo "id_sorolog".

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo 'id_sorolog'..." )
Main.List_1.Value:= (indice)

cTesteSorolog := ""
use (HB_DirBase() + "tmp_covid19.dbf" )
do while .not. eof()
switch alltrim(t_sorolog)
case "ANTICORPOS TOTAIS"
cTesteSorolog = "01"
exit
case "IGA"
cTesteSorolog = "02"
exit
case "IGA, IGG"
cTesteSorolog = "03"
exit
case "IGG"
cTesteSorolog = "04"
exit
case "IGG, ANTICORPOS TOTAIS"
cTesteSorolog = "05"
exit
case "IGG, IGA"
cTesteSorolog = "06"
exit
case "IGG, IGM"
cTesteSorolog = "07"
exit
case "IGM"
cTesteSorolog = "08"
exit
case "IGM, IGG"
cTesteSorolog = "09"
exit
case "ANTICORPOS TOTAIS, IGM, IGG"
cTesteSorolog = "10"
exit
case "IGG, IGM, ANTICORPOS TOTAIS"
cTesteSorolog = "11"
exit
case "IGM, ANTICORPOS TOTAIS"
cTesteSorolog = "12"
exit
otherwise
cTesteSorolog = "15"
endswitch

replace id_sorolog with cTesteSorolog
skip
enddo

close

Return Nil