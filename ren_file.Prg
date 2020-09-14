#include <hmg.ch>

declare window Main

* Roda o módulo que renomeia definitivamente o arquivo DBF gerado.
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Renomeia definitivamente o arquivo DBF gerado..." )
Main.List_1.Value:= (indice)

cOldFileX := (HB_DirBase() + "tmp_covid19.dbf" )
x:= rat( ( ".csv" ) , ( cFile ) )
cNewFileY := posrepl ( ( cFile ), ".dbf", x )

* Deleta arquivo DBF anterior que tenha o mesmo nome do arquivo selecionado pelo usuário no início do programa.
if file ( cNewFileY ) = .T.
delete file ( cNewFileY )
endif

* Renomeia o arquivo gerado pelo nome do arquivo CSV selecionado pelo usuário no início do programa.
rename (cOldFileX) to (cNewFileY)

Return Nil