#include <hmg.ch>

declare window Main

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo nu_ano..." )
Main.List_1.Value:= (indice)

* Preenche o campo nu_ano.
use (HB_DirBase() + "tmp_covid19.dbf" )

do while .not. eof()
replace nu_ano with alltrim(str(year(dt_notific)))
skip
enddo

close

Return Nil