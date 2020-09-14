#include <hmg.ch>

declare window Main

* Preenche o campo sem_not.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo sem_not..." )
Main.List_1.Value:= (indice)

	  aArray2 := {}
	  use (HB_DirBase() + "epid.dbf" )
	  nRecs := reccount()
      FOR x := 1 TO nRecs * 7
      AAdd( aArray2, {ctod(dia1),alltrim(semananot)} )
      AAdd( aArray2, {ctod(dia2),alltrim(semananot)} )
      AAdd( aArray2, {ctod(dia3),alltrim(semananot)} )
      AAdd( aArray2, {ctod(dia4),alltrim(semananot)} )
      AAdd( aArray2, {ctod(dia5),alltrim(semananot)} )
      AAdd( aArray2, {ctod(dia6),alltrim(semananot)} )
      AAdd( aArray2, {ctod(dia7),alltrim(semananot)} )	  
	  skip  
	  NEXT
	  close

use (HB_DirBase() + "tmp_covid19.dbf" )

do while .not. eof()
erro = 0
cDatex = dt_notific

cSem := ascan( aArray2, {|x| x[1] == (cDatex) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cSemNot := alltrim(str(year(cDatex))) + aArray2[cSem,2]
recover
erro = 1
end sequence

if erro = 0
replace sem_not with cSemNot
endif

skip
enddo

erro = 0

Return Nil