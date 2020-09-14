#include <hmg.ch>
declare window Main

* Preenche o campo sem_pri.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo sem_pri..." )
Main.List_1.Value:= (indice)

	  aArray3 := {}
	  use (HB_DirBase() + "epid.dbf" )
	  nRecs := reccount()
      FOR x := 1 TO nRecs * 7
      AAdd( aArray3, {ctod(dia1),alltrim(semananot)} )
      AAdd( aArray3, {ctod(dia2),alltrim(semananot)} )
      AAdd( aArray3, {ctod(dia3),alltrim(semananot)} )
      AAdd( aArray3, {ctod(dia4),alltrim(semananot)} )
      AAdd( aArray3, {ctod(dia5),alltrim(semananot)} )
      AAdd( aArray3, {ctod(dia6),alltrim(semananot)} )
      AAdd( aArray3, {ctod(dia7),alltrim(semananot)} )	  
	  skip  
	  NEXT
	  close
	  aArray3 := asort( aArray3,,,{|x,y| x[1] < y[1] } )	  

use (HB_DirBase() + "tmp_covid19.dbf" )

do while .not. eof()
erro = 0
cDatex2 = dt_sintom

cSem2 := ascan( aArray3, {|x| x[1] == (cDatex2) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cSemPri := alltrim(str(year(cDatex2))) + aArray3[cSem2,2]
recover
erro = 1
end sequence

if erro = 0
replace sem_pri with cSemPri
endif

skip
enddo

close

Return Nil