#include <hmg.ch>

declare window Main

* Apaga os arquivos auxiliares que não serão mais usados pelo programa.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Apagando arquivos auxiliares..." )
Main.List_1.Value:= (indice)

delete file (HB_DirBase() + "temp_covid19.dbf" )
delete file (HB_DirBase() + "temp_covid19.csv" )
delete file (HB_DirBase() + "comp_return.prn" )
delete file (HB_DirBase() + "temp2_covid19x.txt" )
delete file (HB_DirBase() + "molde1.dbf" )
delete file (HB_DirBase() + "molde2.dbf" )
delete file (HB_DirBase() + "molde3.dbf" )
delete file (HB_DirBase() + "molde5.dbf" )
delete file (HB_DirBase() + "heading2.txt" )
delete file (HB_DirBase() + "temp_covid19beta.txt" )
delete file (HB_DirBase() + "heading_ready.txt" )
delete file (HB_DirBase() + "temp_covid19.txt" )
delete file (HB_DirBase() + "temp2_covid19.txt" )
delete file (HB_DirBase() + "process.txt" )
Return Nil
