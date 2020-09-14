#include <hmg.ch>

declare window Main

* Preenche o campo id_rg_resi.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo id_rg_resi..." )
Main.List_1.Value:= (indice)

	  aArray4 := {}
	  cFileDBF := alltrim( cSinan ) + "\basedbf\municnet.dbf"
	  use ( cFileDBF )
	  nRecs := reccount()
      FOR x := 1 TO nRecs
	  if alltrim(sg_uf) = ( cUnidF )
      AAdd( aArray4, {alltrim(id_municip),alltrim(id_regiona)} )
	  endif
	  skip
	  NEXT
	  close
	  
use (HB_DirBase() + "tmp_covid19.dbf" )

do while .not. eof()
erro_rg = 0
cValor = alltrim(id_mn_resi)
if empty(cValor) = .F.
nPlace := ascan( aArray4, {|x| x[1] == (cValor) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cPlaceRegiName := aArray4[nPlace,2]
recover
erro_rg = 1
end sequence

if erro_rg = 0
replace id_rg_resi with cPlaceRegiName
endif
endif

skip
enddo

close

Return Nil