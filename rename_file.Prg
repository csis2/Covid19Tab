#include <hmg.ch>

* Renomeia o arquivo "heading_ready.txt" para "heading_model.c19"

dt := dia_hora()
FWrite( nH, (dt) + "Renomeia o arquivo 'heading_ready.txt' para 'heading_model.c19'" + Chr(13) + Chr(10) )

  cFileBase1 := alltrim(HB_DirBase())+"heading_ready.txt"
  cFileBase2 := alltrim(HB_DirBase())+"heading_model.c19"
  rename (cFileBase1) to (cFileBase2)

Return Nil