#include <hmg.ch>

declare window Main

* Codificacao do campo "est_teste". O resultado da codificação vai para o campo "id_esttest".

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo 'id_esttest'..." )
Main.List_1.Value:= (indice)

cEstTest := ""
use (HB_DirBase() + "tmp_covid19.dbf" )
do while .not. eof()
switch alltrim(est_teste)
case "SOLICITADO"
cEstTest = "1"
exit
case "COLETADO"
cEstTest = "2"
exit
case "CONCLUIDO"
cEstTest = "3"
exit
case "EXAME NAO SOLICITADO"
cEstTest = "4"
exit
otherwise
cEstTest = "0"
endswitch

replace id_esttest with cEstTest
skip
enddo

close

Return Nil