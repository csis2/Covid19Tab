#include <hmg.ch>
declare window Main

* Preenche o campo id_mn_resi.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo id_mn_resi..." )
Main.List_1.Value:= (indice)

	  aArray1 := {}
      use ( alltrim( cSinan ) + "\basedbf\municnet.dbf" )
	  nRecs := reccount()
      FOR x := 1 TO nRecs
	  AAdd( aArray1, {alltrim(id_municip),alltrim(nm_municip),alltrim(sg_uf)} )
	  skip
	  NEXT
	  close
	  aArray1 := asort( aArray1,,,{|x,y| x[3] < y[3]} )	
	    
use (HB_DirBase() + "tmp_covid19.dbf" )
index on sigla+munic_res to (HB_DirBase() + "sigla_munic_res" ) ascending
close	
use (HB_DirBase() + "tmp_covid19.dbf" ) index ( (HB_DirBase() + "sigla_munic_res.cdx" ) ) 

do while .not. eof()
erro = 0
cValor = alltrim(munic_res)
cValor2 = alltrim(sigla)

if empty(cValor) = .F.
nPlace := ascan( aArray1, {|x| x[3] == (cValor2) .and. x[2] == (cValor) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
nPlaceMunName := aArray1[nPlace,1]
recover
erro = 1
end sequence

if erro = 0 
replace id_mn_resi with nPlaceMunName
endif
endif

skip
enddo

close

erro = 0
Return Nil