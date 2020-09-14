#include <hmg.ch>

declare window Main

* preenche o campo nomeregi.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo nomeregi..." )
Main.List_1.Value:= (indice)

	  aArray5 := {}
	  cFileDBF2 := alltrim( cSinan ) + "\basedbf\regionet.dbf"
	  use ( cFileDBF2 )
	  nRecs := reccount()
      FOR x := 1 TO nRecs
	  if alltrim(sg_uf) = ( cUnidF )
      AAdd( aArray5, {alltrim(id_regiona),alltrim(nm_regiona)} )
	  endif
	  skip
	  NEXT
	  close
	  aArray5 := asort( aArray5,,,{|x,y| x[1] < y[1] } )

use (HB_DirBase() + "tmp_covid19.dbf" )

do while .not. eof()
erro_rg = 0
cValor = alltrim(id_rg_resi)
if empty(cValor) = .F.
nPlace := ascan( aArray5, {|x| x[1] == (cValor) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cPlaceRegiName := aArray5[nPlace,2]
recover
erro_rg = 1
end sequence

if erro_rg = 0
replace nomeregi with cPlaceRegiName
endif
endif

skip
enddo

close

Return Nil