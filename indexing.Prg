#include <hmg.ch>

declare window Main

* Indexando arquivos...

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Indexando arquivos..." )
Main.List_1.Value:= (indice)

use (HB_DirBase() + "tmp_covid19.dbf" )
index on uf_reside to (HB_DirBase() + "uf_reside" ) ascending
index on uf_notific to (HB_DirBase() + "uf_notific" ) ascending
close

Return Nil