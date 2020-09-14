#include <hmg.ch>

declare window Main

* Preenche o campo uf_not.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo uf_not..." )
Main.List_1.Value:= (indice)
	  
	  aArray6 := {}
      use ( alltrim( cSinan ) + "\basedbf\uf.dbf" )
	  nRecs0 := reccount()
      FOR x := 1 TO nRecs0
      AAdd( aArray6, {alltrim(id_uf),alltrim(nm_uf)} )
   	  skip
      NEXT
	  close
	  aArray6 := asort( aArray6,,,{|x,y| x[2] < y[2] } )	  

use (HB_DirBase() + "tmp_covid19.dbf" ) index ( (HB_DirBase() + "uf_notific.cdx" ) )

do while .not. eof()
erro = 0
cValor = alltrim(uf_notific)
if empty(cValor) = .F.
nPlace := ascan( aArray6, {|x| x[2] == (cValor) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cPlaceUFName := aArray6[nPlace,1]
recover
erro = 1
end sequence

if erro = 0
replace uf_not with cPlaceUFName
endif
endif

skip
enddo

close

Return Nil