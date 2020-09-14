#include <hmg.ch>

declare window Main

* Preenche o campo id_regiona.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo id_regiona..." )
Main.List_1.Value:= (indice)

	  aArray8 := {}
	  cFileDBF := alltrim( cSinan ) + "\basedbf\municnet.dbf"
	  use ( cFileDBF )
	  nRecs := reccount()
      FOR x := 1 TO nRecs
	  if alltrim(sg_uf) = ( cUnidF )
      AAdd( aArray8, {alltrim(id_municip),alltrim(id_regiona)} )
	  endif
	  skip
	  NEXT
	  close
	  aArray8 := asort( aArray8,,,{|x,y| x[1] < y[1] } )  	  

use (HB_DirBase() + "tmp_covid19.dbf" )

do while .not. eof()
erro_rg = 0
cValor = alltrim(id_municip)
if empty(cValor) = .F.
nPlace := ascan( aArray8, {|x| x[1] == (cValor) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cPlaceRegiName := aArray8[nPlace,2]
recover
erro_rg = 1
end sequence

if erro_rg = 0
replace id_regiona with cPlaceRegiName
endif
endif

skip
enddo

close

Return Nil