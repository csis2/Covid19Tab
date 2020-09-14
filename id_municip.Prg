#include <hmg.ch>
declare window Main

* Preenche o campo id_municip.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo id_municip..." )
Main.List_1.Value:= (indice)

	  aArray7 := {}
      use ( alltrim( cSinan ) + "\basedbf\municnet.dbf" )
	  nRecs := reccount()
      FOR x := 1 TO nRecs
	  AAdd( aArray7, {alltrim(id_municip),alltrim(nm_municip),alltrim(sg_uf)} )
	  skip
	  NEXT
	  close
	  aArray7 := asort( aArray7,,,{|x,y| x[3] < y[3]} )		  
	  
use (HB_DirBase() + "tmp_covid19.dbf" )
index on sigla_not+munic_not to (HB_DirBase() + "sigla_munic_not" ) ascending
close	
use (HB_DirBase() + "tmp_covid19.dbf" ) index ( (HB_DirBase() + "sigla_munic_not.cdx" ) )

do while .not. eof()
erro = 0
cValor = alltrim(munic_not)
cValor2 = alltrim(sigla_not)

if empty(cValor) = .F.
nPlace := ascan( aArray7, {|x| x[2] == (cValor) .and. x[3] == (cValor2) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cPlaceMunName := aArray7[nPlace,1]
recover
erro = 1
end sequence

if erro = 0 
replace id_municip with cPlaceMunName
endif
endif

skip
enddo

close

erro = 0
Return Nil