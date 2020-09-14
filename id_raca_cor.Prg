#include <hmg.ch>

declare window Main

* Codificacao do campo "raca_cor". O resultado da codificação vai para o campo "id_racacor".

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo 'id_racacor'..." )
Main.List_1.Value:= (indice)

cRacaCor := ""
use (HB_DirBase() + "tmp_covid19.dbf" )
do while .not. eof()
switch alltrim(raca_cor)
case "BRANCA"
cRacaCor = "1"
exit
case "PRETA"
cRacaCor = "2"
exit
case "AMARELA"
cRacaCor = "3"
exit
case "PARDA"
cRacaCor = "4"
exit
case "INDIGENA"
cRacaCor = "5"
exit
case "IGNORADO"
cRacaCor = "9"
exit
otherwise
cRacaCor = "6"
endswitch

replace id_racacor with cRacaCor
skip
enddo

close

Return Nil