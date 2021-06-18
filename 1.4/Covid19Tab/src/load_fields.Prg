#include "fileio.ch"

PROCEDURE Main()

* CSIS Software 2021
* Codificacao dos campos criados pelo objeto fieldCreation.
* -----------------------------------------------------------------------------
* Compilado no Harbour Make (hbmk2) versao 3.0.0
* Roda somente com argumentos de entrada.

* Primeiro argumento: tipo de arquivo selecionado pelo usuário.
* Segundo argumento: UF selecionada pelo usuário nas configurações do programa.
* Terceiro argumento: local onde estão os arquivos do SINAN NET.
* -----------------------------------------------------------------------------

* Verifica se existe argumento.
if empty(HB_ArgV(1)) = .T.
set color to r+/
? "Erro! O programa precisa que voce forneca argumento de entrada."
__Quit()
endif

* Verifica se o argumento é valido.
set exact on
if (HB_ArgV(1)) <> "MP1" .and. (HB_ArgV(1)) <> "MP2" .and. (HB_ArgV(1)) <> "MP3"
set color to r+/
? "Erro! O argumento escolhido nao e valido."
__Quit()
endif

************************************************************
*************************** MP1 ****************************
************************************************************

if (HB_ArgV(1)) = "MP1"

public cFileDBF := "C:\Covid19Tab\1.4\Covid19Tab\tmp\molde5.dbf"
public nPercent, nCounter, nTotalRecs
public cPercent

FErase( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt" )
nHandle := FCreate( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt" )
FWrite ( nHandle, "1.00" )
Fclose ( nHandle )
crlf := chr(13) + chr(10)

use ( cFileDBF )
nTotalRecs = reccount() * 21
close

* Preenche o campo uf_resi.

	  aArray0 := {}
	  if (HB_ArgV(3)) = "1"
	  use "C:\sinannet\basedbf\uf.dbf"
	  else	  
      use "C:\Covid19Tab\1.4\Covid19Tab\baseDBF\UF.DBF"
	  endif
	  	  
	  nRecs0 := reccount()
      FOR x := 1 TO nRecs0
      AAdd( aArray0, {alltrim(id_uf),alltrim(nm_uf)} )
   	  skip
      NEXT
	  close
	  aArray0 := asort( aArray0,,,{|x,y| x[2] < y[2] } )
	  
use ( cFileDBF ) index "C:\Covid19Tab\1.4\Covid19Tab\tmp\uf_reside.ntx"

nCounter = 1
do while .not. eof()
erro = 0
cValor = alltrim(uf_reside)
if empty(cValor) = .F.
nPlace := ascan( aArray0, {|x| x[2] == (cValor) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cPlaceUFName := aArray0[nPlace,1]
recover
erro = 1
end sequence

if erro = 0
replace uf_resi with cPlaceUFName
endif
endif

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++
skip
enddo

close

* Preenche o campo sigla.

cSiglaIs = ""
use ( cFileDBF )
do while .not. eof()
switch (uf_resi)
case "11"
cSiglaIs = "RO"
exit
case "12"
cSiglaIs = "AC"
exit
case "13"
cSiglaIs = "AM"
exit
case "14"
cSiglaIs = "RR"
exit
case "15"
cSiglaIs = "PA"
exit
case "16"
cSiglaIs = "AP"
exit
case "17"
cSiglaIs = "TO"
exit
case "21"
cSiglaIs = "MA"
exit
case "22"
cSiglaIs = "PI"
exit
case "23"
cSiglaIs = "CE"
exit
case "24"
cSiglaIs = "RN"
exit
case "25"
cSiglaIs = "PB"
exit
case "26"
cSiglaIs = "PE"
exit
case "27"
cSiglaIs = "AL"
exit
case "28"
cSiglaIs = "SE"
exit
case "29"
cSiglaIs = "BA"
exit
case "31"
cSiglaIs = "MG"
exit
case "32"
cSiglaIs = "ES"
exit
case "33"
cSiglaIs = "RJ"
exit
case "35"
cSiglaIs = "SP"
exit
case "41"
cSiglaIs = "PR"
exit
case "42"
cSiglaIs = "SC"
exit
case "43"
cSiglaIs = "RS"
exit
case "50"
cSiglaIs = "MS"
exit
case "51"
cSiglaIs = "MT"
exit
case "52"
cSiglaIs = "GO"
exit
case "53"
cSiglaIs = "DF"
exit
otherwise
cSiglaIs = ""
endswitch

replace sigla with cSiglaIs

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

close

* Preenche o campo id_mn_resi.

	  aArray1 := {}
	  *use "C:\Covid19Tab\1.4\Covid19Tab\baseDBF\municnet.dbf"
	  	  
	  if (HB_ArgV(3)) = "1"
	  use "C:\sinannet\basedbf\municnet.dbf"
	  else	  
	  use "C:\Covid19Tab\1.4\Covid19Tab\baseDBF\municnet.dbf"
	  endif	  
	  	  
	  nRecs := reccount()
      FOR x := 1 TO nRecs
	  AAdd( aArray1, {alltrim(id_municip),alltrim(nm_municip),alltrim(sg_uf)} )
	  skip
	  NEXT
	  close
	  aArray1 := asort( aArray1,,,{|x,y| x[3] < y[3]} )	
	    
use ( cFileDBF )
index on sigla+munic_res to "C:\Covid19Tab\1.4\Covid19Tab\tmp\sigla_munic_res" ascending
close	
use ( cFileDBF ) index "C:\Covid19Tab\1.4\Covid19Tab\tmp\sigla_munic_res.ntx"

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

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif
 
nCounter ++

skip
enddo

close

* Preenche o campo nu_ano.

use ( cFileDBF ) 
do while .not. eof()
replace nu_ano with alltrim(str(year(dt_notific)))

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

close

* Preenche o campo sem_not.

	  aArray2 := {}
	  use ( "C:\Covid19Tab\1.4\Covid19Tab\tmp\weeks_table.dbf" )
	  nRecs := reccount()
      FOR x := 1 TO nRecs * 7
      AAdd( aArray2, {(dia1),alltrim(ano_sem)} )
      AAdd( aArray2, {(dia2),alltrim(ano_sem)} )
      AAdd( aArray2, {(dia3),alltrim(ano_sem)} )
      AAdd( aArray2, {(dia4),alltrim(ano_sem)} )
      AAdd( aArray2, {(dia5),alltrim(ano_sem)} )
      AAdd( aArray2, {(dia6),alltrim(ano_sem)} )
      AAdd( aArray2, {(dia7),alltrim(ano_sem)} )	  
	  skip  
	  NEXT
	  close

use ( cFileDBF )

do while .not. eof()
erro = 0
cDatex = dt_notific

cSem := ascan( aArray2, {|x| x[1] == (cDatex) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cSemNot := aArray2[cSem,2]
recover
erro = 1
end sequence

if erro = 0
replace sem_not with cSemNot
endif

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

* Preenche o campo sem_pri.

	  aArray3 := {}
	  use ( "C:\Covid19Tab\1.4\Covid19Tab\tmp\weeks_table.dbf" )
	  nRecs := reccount()
      FOR x := 1 TO nRecs * 7
      AAdd( aArray3, {(dia1),alltrim(ano_sem)} )
      AAdd( aArray3, {(dia2),alltrim(ano_sem)} )
      AAdd( aArray3, {(dia3),alltrim(ano_sem)} )
      AAdd( aArray3, {(dia4),alltrim(ano_sem)} )
      AAdd( aArray3, {(dia5),alltrim(ano_sem)} )
      AAdd( aArray3, {(dia6),alltrim(ano_sem)} )
      AAdd( aArray3, {(dia7),alltrim(ano_sem)} )	  
	  skip  
	  NEXT
	  close
	  aArray3 := asort( aArray3,,,{|x,y| x[1] < y[1] } )	  

use ( cFileDBF )

do while .not. eof()
erro = 0
cDatex2 = dt_sintom

cSem2 := ascan( aArray3, {|x| x[1] == (cDatex2) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cSemPri := aArray3[cSem2,2]
recover
erro = 1
end sequence

if erro = 0
replace sem_pri with cSemPri
endif

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

close

* Preenche o campo nu_idade_n.

idade := ""
use ( cFileDBF )

do while .not. eof()
erro_age = 0
days := ((dt_sintom) - (dt_nasc))
months := int ((days) / 30)
years := int((days) / 365)

if days < 30 .and. months = 0 .and. years = 0
nSize := len(alltrim(str(days)))
 SWITCH nSize
   CASE 1
	  idade = "2"+"00"+alltrim(str(days)) 
	  exit
   CASE 2
	  idade = "2"+"0"+alltrim(str(days))    
	  exit
   ENDSWITCH
endif

if days <> 0 .and. months <> 0 .and. years = 0 
nSize2 := len(alltrim(str(months)))
 SWITCH nSize2
   CASE 1
	  idade = "3"+"00"+alltrim(str(months)) 
	  exit
   CASE 2
	  idade = "3"+"0"+alltrim(str(months))    
	  exit
   ENDSWITCH
endif

if days <> 0 .and. months <> 0 .and. years <> 0 
nSize3 := len(alltrim(str(years)))
 SWITCH nSize3
   CASE 1
	  idade = "4"+"00"+alltrim(str(years)) 
	  exit
   CASE 2
	  idade = "4"+"0"+alltrim(str(years))    
	  exit
   ENDSWITCH
endif

if (dt_sintom) < (dt_nasc)
erro_age = 1
endif

if erro_age = 0
replace nu_idade_n with val(idade)
endif

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

close

* Preenche o campo id_rg_resi.

	  aArray4 := {}
	  
	  if (HB_ArgV(3)) = "1"
	  cFileDBFSinan := "C:\sinannet\basedbf\municnet.dbf"
	  else	  
      cFileDBFSinan := "C:\Covid19Tab\1.4\Covid19Tab\basedbf\municnet.dbf"
	  endif
	  
	  *cFileDBFSinan := "C:\Covid19Tab\1.4\Covid19Tab\basedbf\municnet.dbf"
	  use ( cFileDBFSinan )
	  nRecs := reccount()
      FOR x := 1 TO nRecs
	  if alltrim(sg_uf) = (HB_ArgV(2))
      AAdd( aArray4, {alltrim(id_municip),alltrim(id_regiona)} )
	  endif
	  skip
	  NEXT
	  close
	  
use ( cFileDBF )

do while .not. eof()
erro_rg = 0
cValor := alltrim(id_mn_resi)
if empty(cValor) = .F.
nPlace := ascan( aArray4, {|x| x[1] == (cValor) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cPlaceRegiCode := aArray4[nPlace,2]
recover
erro_rg = 1
end sequence

if erro_rg = 0
replace id_rg_resi with cPlaceRegiCode
endif
endif

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

close

* preenche o campo nomeregi.

	  aArray5 := {}
	  
	  if (HB_ArgV(3)) = "1"	  
	  cFileDBFSinan2 := "C:\sinannet\basedbf\regionet.dbf"
	  else	 
	  cFileDBFSinan2 := "C:\Covid19Tab\1.4\Covid19Tab\basedbf\regionet.dbf"
	  endif

	  *cFileDBFSinan2 := "C:\Covid19Tab\1.4\Covid19Tab\basedbf\regionet.dbf"	  
	  use ( cFileDBFSinan2 )
	  nRecs := reccount()
      FOR x := 1 TO nRecs
	  if alltrim(sg_uf) = (HB_ArgV(2))
      AAdd( aArray5, {alltrim(id_regiona),alltrim(nm_regiona)} )
	  endif
	  skip
	  NEXT
	  close
	  aArray5 := asort( aArray5,,,{|x,y| x[1] < y[1] } )

use ( cFileDBF )

do while .not. eof()
erro_rg = 0
cValor := alltrim(id_rg_resi)
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

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif
 
nCounter ++

skip
enddo

close

* Preenche o campo uf_not.

	  aArray6 := {}
	  
	  if (HB_ArgV(3)) = "1"
	  use "C:\sinannet\basedbf\uf.dbf"
	  else	  
      use "C:\Covid19Tab\1.4\Covid19Tab\baseDBF\UF.DBF"
	  endif
	  
      *use "C:\Covid19Tab\1.4\Covid19Tab\basedbf\uf.dbf"
	  nRecs0 := reccount()
      FOR x := 1 TO nRecs0
      AAdd( aArray6, {alltrim(id_uf),alltrim(nm_uf)} )
   	  skip
      NEXT
	  close
	  aArray6 := asort( aArray6,,,{|x,y| x[2] < y[2] } )	  

use ( cFileDBF ) index "C:\Covid19Tab\1.4\Covid19Tab\tmp\uf_notific.ntx"

do while .not. eof()
erro = 0
cValor := alltrim(uf_notific)
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

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif
 
nCounter ++

skip
enddo

close

* Preenche o campo sigla_not.

cSiglaIs := ""
use ( cFileDBF )
do while .not. eof()
switch (uf_not)
case "11"
cSiglaIs = "RO"
exit
case "12"
cSiglaIs = "AC"
exit
case "13"
cSiglaIs = "AM"
exit
case "14"
cSiglaIs = "RR"
exit
case "15"
cSiglaIs = "PA"
exit
case "16"
cSiglaIs = "AP"
exit
case "17"
cSiglaIs = "TO"
exit
case "21"
cSiglaIs = "MA"
exit
case "22"
cSiglaIs = "PI"
exit
case "23"
cSiglaIs = "CE"
exit
case "24"
cSiglaIs = "RN"
exit
case "25"
cSiglaIs = "PB"
exit
case "26"
cSiglaIs = "PE"
exit
case "27"
cSiglaIs = "AL"
exit
case "28"
cSiglaIs = "SE"
exit
case "29"
cSiglaIs = "BA"
exit
case "31"
cSiglaIs = "MG"
exit
case "32"
cSiglaIs = "ES"
exit
case "33"
cSiglaIs = "RJ"
exit
case "35"
cSiglaIs = "SP"
exit
case "41"
cSiglaIs = "PR"
exit
case "42"
cSiglaIs = "SC"
exit
case "43"
cSiglaIs = "RS"
exit
case "50"
cSiglaIs = "MS"
exit
case "51"
cSiglaIs = "MT"
exit
case "52"
cSiglaIs = "GO"
exit
case "53"
cSiglaIs = "DF"
exit
otherwise
cSiglaIs = ""
endswitch

replace sigla_not with cSiglaIs

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif
 
nCounter ++

skip
enddo

close

* Preenche o campo id_municip.

	  aArray7 := {}
	  
	  if (HB_ArgV(3)) = "1"
	  use "C:\sinannet\basedbf\municnet.dbf"
	  else	  
      use "C:\Covid19Tab\1.4\Covid19Tab\baseDBF\municnet.dbf"
	  endif 
	  
      *use "c:\covid19tab\1.4\covid19tab\basedbf\municnet.dbf"
	  nRecs := reccount()
      FOR x := 1 TO nRecs
	  AAdd( aArray7, {alltrim(id_municip),alltrim(nm_municip),alltrim(sg_uf)} )
	  skip
	  NEXT
	  close
	  aArray7 := asort( aArray7,,,{|x,y| x[3] < y[3]} )		  
	  
use ( cFileDBF )
index on sigla_not+munic_not to "c:\covid19tab\1.4\covid19tab\tmp\sigla_munic_not" ascending
close	
use ( cFileDBF ) index "c:\covid19tab\1.4\covid19tab\tmp\sigla_munic_not.ntx"

do while .not. eof()
erro = 0
cValor = alltrim(munic_not)
cValor2 = alltrim(sigla_not)

if empty(cValor) = .F.
nPlace := ascan( aArray7, {|x| x[2] == (cValor) .and. x[3] == (cValor2) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cCodeMunicip := aArray7[nPlace,1]
recover
erro = 1
end sequence

if erro = 0 
replace id_municip with cCodeMunicip
endif
endif

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif
 
nCounter ++

skip
enddo

close

* Preenche o campo id_regiona.

	  aArray8 := {}
	  
	  if (HB_ArgV(3)) = "1"
	  cFileDBFSinan3 := "C:\sinannet\basedbf\municnet.dbf"
	  else	  
      cFileDBFSinan3 := "C:\Covid19Tab\1.4\Covid19Tab\baseDBF\municnet.dbf"
	  endif
	  
	  *cFileDBFSinan3 := "c:\covid19tab\1.4\covid19tab\basedbf\municnet.dbf"
	  use ( cFileDBFSinan3 )
	  nRecs := reccount()
      FOR x := 1 TO nRecs
	  if alltrim(sg_uf) = (HB_ArgV(2))
      AAdd( aArray8, {alltrim(id_municip),alltrim(id_regiona)} )
	  endif
	  skip
	  NEXT
	  close
	  aArray8 := asort( aArray8,,,{|x,y| x[1] < y[1] } )  	  

use ( cFileDBF )

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

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif
 
nCounter ++

skip
enddo

close

* Preenche o campo regio_not.

	  aArray9 := {}
	  
	  if (HB_ArgV(3)) = "1"
	  cFileDBFSinan4 := "C:\sinannet\basedbf\regionet.dbf"
	  else	  
      	  cFileDBFSinan4 := "C:\Covid19Tab\1.4\Covid19Tab\baseDBF\regionet.dbf"
	  endif
	  
	  *cFileDBFSinan4 := "c:\covid19tab\1.4\covid19tab\basedbf\regionet.dbf"
	  use ( cFileDBFSinan4 )
	  nRecs := reccount()
      FOR x := 1 TO nRecs
	  if alltrim(sg_uf) = (HB_ArgV(2))
      AAdd( aArray9, {alltrim(id_regiona),alltrim(nm_regiona)} )
	  endif
	  skip
	  NEXT
	  close
	  aArray9 := asort( aArray9,,,{|x,y| x[1] < y[1] } )	  

use ( cFileDBF )

do while .not. eof()
erro_rg = 0
cValor = alltrim(id_regiona)
if empty(cValor) = .F.
nPlace := ascan( aArray9, {|x| x[1] == (cValor) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cPlaceRegiName := aArray9[nPlace,2]
recover
erro_rg = 1
end sequence

if erro_rg = 0
replace regio_not with cPlaceRegiName
endif
endif

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif
 
nCounter ++

skip
enddo

close

* Codificacao do campo "raca_cor". O resultado da codificação vai para o campo "id_racacor".

cRacaCor := ""
use ( cFileDBF )
do while .not. eof()
switch alltrim(raca_cor)
case "BRANCA"
cRacaCor = "1"
exit
case "PRETA"
cRacaCor = "2"
exit
case "AMARELA"
cRacaCor = "3"
exit
case "PARDA"
cRacaCor = "4"
exit
case "INDIGENA"
cRacaCor = "5"
exit
case "IGNORADO"
cRacaCor = "9"
exit
otherwise
cRacaCor = "6"
endswitch

replace id_racacor with cRacaCor

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

close

* Codificacao do campo "evolucao". O resultado da codificação vai para o campo "id_evoluc".

cEvolucao := ""
use ( cFileDBF )
do while .not. eof()
switch alltrim(evolucao)
case "CANCELADO"
cEvolucao = "1"
exit
case "INTERNADO"
cEvolucao = "2"
exit
case "OBITO"
cEvolucao = "3"
exit
case "EM TRATAMENTO DOMICILIAR"
cEvolucao = "4"
exit
case "CURA"
cEvolucao = "5"
exit
case "INTERNADO EM UTI"
cEvolucao = "6"
exit
case "IGNORADO"
cEvolucao = "9"
exit
otherwise
cEvolucao = "0"
endswitch

replace id_evoluc with cEvolucao

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif
 
nCounter ++

skip
enddo

close

* Codificacao do campo "tipo_teste". O resultado da codificação vai para o campo "id_tp_test".

cTpTeste := ""
use ( cFileDBF )
do while .not. eof()
switch ( alltrim(left(tipo_teste,21) ) )
case "RT-PCR"
cTpTeste = "1"
exit
case "TESTE RAPIDO - ANTICO"
cTpTeste = "2"
exit
case "TESTE RAPIDO - ANTIGE"
cTpTeste = "3"
exit
case "ENZIMAIMUNOENSAIO ? E"
cTpTeste = "4"
exit
case "IMUNOENSAIO POR ELETR"
cTpTeste = "5"
exit
case "QUIMIOLUMINESCENCIA -"
cTpTeste = "6"
exit
otherwise
cTpTeste = "0"
endswitch

replace id_tp_test with cTpTeste

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif
 
nCounter ++

skip
enddo

close

* Codificacao do campo "est_teste". O resultado da codificação vai para o campo "id_esttest".

cEstTest := ""
use ( cFileDBF )
do while .not. eof()
switch alltrim(est_teste)
case "SOLICITADO"
cEstTest = "1"
exit
case "COLETADO"
cEstTest = "2"
exit
case "CONCLUIDO"
cEstTest = "3"
exit
case "EXAME NAO SOLICITADO"
cEstTest = "4"
exit
otherwise
cEstTest = "0"
endswitch

replace id_esttest with cEstTest

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

close

* Codificacao do campo "classi_fin". O resultado da codificação vai para o campo "id_cla_fin".

cClassFinal := ""
use ( cFileDBF )
do while .not. eof()
switch alltrim(classi_fin)
case "DESCARTADO"
cClassFinal = "1"
exit
case "CONFIRMADO CLINICO-EPIDEMIOLOGICO"
cClassFinal = "2"
exit
case "CONFIRMADO LABORATORIAL"
cClassFinal = "3"
exit
case "SINDROME GRIPAL NAO ESPECIFICADA"
cClassFinal = "4"
exit
case "CONFIRMADO CLINICO-IMAGEM"
cClassFinal = "5"
exit
case "CONFIRMADO POR CRITERIO CLINICO"
cClassFinal = "6"
exit
otherwise
cClassFinal = "7"
endswitch

replace id_cla_fin with cClassFinal

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

close

* Codificacao do campo "t_sorolog". O resultado da codificação vai para o campo "id_sorolog".

cTesteSorolog := ""
use ( cFileDBF )
do while .not. eof()
switch alltrim(t_sorolog)
case "ANTICORPOS TOTAIS"
cTesteSorolog = "01"
exit
case "IGA"
cTesteSorolog = "02"
exit
case "IGA, IGG"
cTesteSorolog = "03"
exit
case "IGG"
cTesteSorolog = "04"
exit
case "IGG, ANTICORPOS TOTAIS"
cTesteSorolog = "05"
exit
case "IGG, IGA"
cTesteSorolog = "06"
exit
case "IGG, IGM"
cTesteSorolog = "07"
exit
case "IGM"
cTesteSorolog = "08"
exit
case "IGM, IGG"
cTesteSorolog = "09"
exit
case "ANTICORPOS TOTAIS, IGM, IGG"
cTesteSorolog = "10"
exit
case "IGG, IGM, ANTICORPOS TOTAIS"
cTesteSorolog = "11"
exit
case "IGM, ANTICORPOS TOTAIS"
cTesteSorolog = "12"
exit
otherwise
cTesteSorolog = "15"
endswitch

replace id_sorolog with cTesteSorolog

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

close

* Codificacao do campo "id_comunid". O resultado da codificação vai para o campo "cod_comuni".

cComunidade := ""
use ( cFileDBF )
do while .not. eof()
switch alltrim( id_comunid )
case "AGROEXTRATIVISTAS"
cComunidade = "01"
exit
case "CAATINGUEIROS"
cComunidade = "02"
exit
case "CAICARAS"
cComunidade = "03"
exit
case "CERRADO"
cComunidade = "04"
exit
case "CIGANOS"
cComunidade = "05"
exit
case "COMUNIDADES DE FUNDO E FECHO DE PASTO"
cComunidade = "06"
exit
case "EXTRATIVISTAS"
cComunidade = "07"
exit
case "FAXINALENSES"
cComunidade = "08"
exit
case "GERAIZEIROS"
cComunidade = "09"
exit
case "MARISQUEIROS"
cComunidade = "10"
exit
case "PANTANEIROS"
cComunidade = "11"
exit
case "PESCADORES ARTESANAIS"
cComunidade = "12"
exit
case "POMERANOS"
cComunidade = "13"
exit
case "POVOS INDIGENAS"
cComunidade = "14"
exit
case "POVOS QUILOMBOLAS"
cComunidade = "15"
exit
case "QUEBRADEIRAS DE COCO BABACU"
cComunidade = "16"
exit
case "RETIREIROS"
cComunidade = "17"
exit
case "RIBEIRINHOS"
cComunidade = "18"
exit
case "SERINGUEIROS"
cComunidade = "19"
exit
case "POVOS DE TERREIRO / MATRIZ AFRICANA"
cComunidade = "20"
exit
case "VAZANTEIROS"
cComunidade = "21"
exit
case "OUTROS"
cComunidade = "22"
exit
case "ACAMPADA"
cComunidade = "23"
exit
case "ANDIROBEIRAS"
cComunidade = "24"
exit
case "APATRIDAS"
cComunidade = "25"
exit
case "ASSENTADA"
cComunidade = "26"
exit
case "CAMPONESES"
cComunidade = "27"
exit
case "CASTANHEIRAS"
cComunidade = "28"
exit
case "CATADORES DE MANGABA"
cComunidade = "29"
exit
case "ISQUEIROS"
cComunidade = "30"
exit
case "JANGADEIROS"
cComunidade = "31"
exit
case "MIGRANTES"
cComunidade = "32"
exit
case "MORROQUIANOS"
cComunidade = "33"
exit
case "POPULACOES ATINGIDAS POR BARRAGENS"
cComunidade = "34"
exit
case "POPULACAO CIRCENSE"
cComunidade = "35"
exit
case "REFUGIADOS"
cComunidade = "36"
exit
case "TRABALHADORES RURAIS ASSALARIADOS"
cComunidade = "37"
exit
case "TRABALHADORES RURAIS TEMPORARIOS"
cComunidade = "38"
exit
case "VARJEIROS"
cComunidade = "39"
exit
otherwise
cComunidade = "99"
endswitch

replace cod_comuni with cComunidade

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

endif

**********************************************************
************************** MP2 ***************************
**********************************************************

if (HB_ArgV(1)) = "MP2"

public cFileDBF := "C:\Covid19Tab\1.4\Covid19Tab\tmp\molde5.dbf"
public nPercent, nCounter, nTotalRecs
public cPercent

FErase( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt" )
nHandle := FCreate( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt" )
FWrite ( nHandle, "1.00" )
Fclose ( nHandle )
crlf := chr(13) + chr(10)

use ( cFileDBF )
nTotalRecs = reccount() * 17
close

cFileDBF := "C:\Covid19Tab\1.4\Covid19Tab\tmp\molde5.dbf"

* Codificacao do campo id_racacor.
cRacaCor := ""
use (cFileDBF)
nCounter = 1

do while .not. eof()
switch alltrim(raca_cor)
case "BRANCA"
cRacaCor = "1"
exit
case "PRETA"
cRacaCor = "2"
exit
case "AMARELA"
cRacaCor = "3"
exit
case "PARDA"
cRacaCor = "4"
exit
case "INDIGENA"
cRacaCor = "5"
exit
case "IGNORADO"
cRacaCor = "9"
exit
otherwise
cRacaCor = "6"
endswitch

replace id_racacor with cRacaCor

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo id_criter.

cCriterio := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(criterio)
case "CLINICO"
cCriterio = "1"
exit
case "CLINICO-EPIDEMIOLOGICO"
cCriterio = "2"
exit
case "CLINICO-IMAGEM"
cCriterio = "3"
exit
case "LABORATORIAL"
cCriterio = "4"
exit
otherwise
cCriterio = "9"
endswitch

replace id_criter with cCriterio

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo id_evoluc.

cEvolucao := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(evolucao)
case "CURA"
cEvolucao = "1"
exit
case "EM TRATAMENTO DOMICILIAR"
cEvolucao = "2"
exit
case "INTERNADO"
cEvolucao = "3"
exit
case "INTERNADO EM UTI"
cEvolucao = "4"
exit
case "OBITO"
cEvolucao = "5"
exit
case "OBITO POR OUTRAS CAUSAS"
cEvolucao = "6"
exit
case "IGNORADO"
cEvolucao = "9"
exit
endswitch

replace id_evoluc with cEvolucao

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo id_res_tst.

cResTeste := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(res_teste)
case "INCONCLUSIVO"
cResTeste = "1"
exit
case "POSITIVO"
cResTeste = "2"
exit
case "NEGATIVO"
cResTeste = "3"
exit
otherwise
cResTeste = "9"
endswitch

replace id_res_tst with cResTeste

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

set exact off
* Reescrevendo o campo tp_teste.
use (cFileDBF)
do while .not. eof()
if alltrim(tp_teste) = "ENZIMAIMUNOENSAIO"
replace tp_teste with "ENZIMAIMUNOENSAIO"
endif

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close
set exact on

* Codificacao do campo tp_teste.

cTpTeste := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(tp_teste)
case "ECLIA IGG"
cTpTeste = "01"
exit
case "ELISA IGM"
cTpTeste = "02"
exit
case "ENZIMAIMUNOENSAIO"
cTpTeste = "03"
exit
case "IGA"
cTpTeste = "04"
exit
case "IGG"
cTpTeste = "05"
exit
case "IGM"
cTpTeste = "06"
exit
case "IMUNOENSAIO POR ELETRO"
cTpTeste = "07"
exit
case "QUIMIOLUMINESCENCIA -"
cTpTeste = "08"
exit
case "RT-PCR"
cTpTeste = "09"
exit
case "TESTE RAPIDO - ANTICOR"
cTpTeste = "10"
exit
case "TESTE RAPIDO - ANTIGEN"
cTpTeste = "11"
exit
otherwise
cTpTeste = "12"
endswitch

replace id_tp_tst with cTpTeste

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo id_est_tst.
cEstTeste := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(est_teste)
case "COLETADO"
cEstTeste = "1"
exit
case "CONCLUIDO"
cEstTeste = "2"
exit
case "EXAME NAO"
cEstTeste = "3"
exit
case "SOLICITADO"
cEstTeste = "4"
exit
otherwise
cEstTeste = "9"
endswitch

replace id_est_tst with cEstTeste

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo id_fonte.

cFonte := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(fonte)
case "ESUS"
cFonte = "1"
exit
case "SIVEP"
cFonte = "2"
exit
otherwise
cFonte = "9"
endswitch

replace id_fonte with cFonte

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo cls_sivep.
cClassSivep := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(clas_sivep)
case "SEM CLASSIFICACAO"
cClassSivep = "1"
exit
case "SRAG POR COVID19"
cClassSivep = "2"
exit
otherwise
cClassSivep = "9"
endswitch

replace cls_sivep with cClassSivep

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo id_class.
cClass := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(classific)
case "CONFIRMADO"
cClass = "1"
exit
case "DESCARTADO"
cClass = "2"
exit
case "SINDROME GRIPAL NAO ESPECIFICADA"
cClass = "3"
exit
case "SRAG NAO ESPECIFICADO"
cClass = "4"
exit
case "SUSPEITO"
cClass = "5"
exit
otherwise
cClass = "9"
endswitch

replace id_class with cClass

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo nu_idade_c.
use (cFileDBF)
do while .not. eof()
erro_age = 0
days := ((dt_sin_pri) - (dt_nasc))
months := int ((days) / 30)
years := int((days) / 365)

if days < 30 .and. months = 0 .and. years = 0
nSize := len(alltrim(str(days)))
 SWITCH nSize
   CASE 1
	  idade2 = "2"+"00"+alltrim(str(days)) 
	  exit
   CASE 2
	  idade2 = "2"+"0"+alltrim(str(days))    
	  exit
   ENDSWITCH
endif

if days <> 0 .and. months <> 0 .and. years = 0 
nSize2 := len(alltrim(str(months)))
 SWITCH nSize2
   CASE 1
	  idade2 = "3"+"00"+alltrim(str(months)) 
	  exit
   CASE 2
	  idade2 = "3"+"0"+alltrim(str(months))    
	  exit
   ENDSWITCH
endif

if days <> 0 .and. months <> 0 .and. years <> 0 
nSize3 := len(alltrim(str(years)))
 SWITCH nSize3
   CASE 1
	  idade2 = "4"+"00"+alltrim(str(years)) 	  
	  exit
   CASE 2
	  idade2 = "4"+"0"+alltrim(str(years))   
	  exit
   ENDSWITCH
endif

if (dt_sin_pri) < (dt_nasc)
erro_age = 1
endif

if erro_age = 0
replace nu_idade_n with val(idade2)
endif

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo sem_not.
cSemNot := ""
use (cFileDBF)
do while .not. eof()
nSemNot := val( sem_epi_no )
if nSemNot >=1 .and. nSemNot <= 9
cSemNot = ano_epi_no + "0" + sem_epi_no
else
cSemNot = ano_epi_no + sem_epi_no
endif
replace sem_not with ( cSemNot )

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo sem_pri.
cSemPri := ""
use (cFileDBF)
do while .not. eof()
nSemPri := val( sem_epi_si )
if nSemPri >=1 .and. nSemPri <= 9
cSemPri = ano_epi_si + "0" + sem_epi_si
else
cSemPri = ano_epi_si + sem_epi_si
endif
replace sem_pri with ( cSemPri )

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo sem_evoluc.
cSemEv := ""
use (cFileDBF)
do while .not. eof()
nSemEv := val( sem_epi_ev )
if nSemEv >=1 .and. nSemEv <= 9
cSemEv = ano_epi_ev + "0" + sem_epi_ev
else
cSemEv = ano_epi_ev + sem_epi_ev
endif
replace sem_evoluc with ( cSemEv )

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo sem_inter.
cSemInter := ""
use (cFileDBF)
do while .not. eof()
nSemInter := val( sem_epi_in )
if nSemInter >=1 .and. nSemInter <= 9
cSemInter = ano_epi_in + "0" + sem_epi_in
else
cSemInter = ano_epi_in + sem_epi_in
endif
replace sem_inter with ( cSemInter )

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo sg_uf.
cUFResid := ""
use (cFileDBF)
do while .not. eof()
cUFResid = LEFT( id_mn_resi,2 )
replace sg_uf with cUFResid

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo id_rg_resi.

	  aArray8 := {}
	  *cFileDBFNet := "C:\Covid19Tab\1.4\Covid19Tab\baseDBF\MUNICNET.DBF"
	  *cUnidF := "GO"
	  
	  if (HB_ArgV(3)) = "1"
	  cFileDBFNet := "C:\sinannet\basedbf\municnet.dbf"
	  else	  
      cFileDBFNet := "C:\Covid19Tab\1.4\Covid19Tab\basedbf\municnet.dbf"
	  endif	  
	  
	  use ( cFileDBFNet )
	  nRecs := reccount()
      FOR x := 1 TO nRecs
	  if alltrim(sg_uf) = (HB_ArgV(2))
      AAdd( aArray8, {alltrim(id_municip),alltrim(id_regiona)} )
	  endif
	  skip
	  NEXT
	  close
	  aArray8 := asort( aArray8,,,{|x,y| x[1] < y[1] } )  	  

use (cFileDBF)
do while .not. eof()
erro_rg = 0
cValor = alltrim(id_mn_resi)
if empty(cValor) = .F.
nPlace := ascan( aArray8, {|x| x[1] == (cValor) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cPlaceRegiCode := aArray8[nPlace,2]
recover
erro_rg = 1
end sequence

if erro_rg = 0
replace id_rg_resi with cPlaceRegiCode
endif
endif

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

endif

**********************************************************
************************** MP3 ***************************
**********************************************************

if (HB_ArgV(1)) = "MP3"

public cFileDBF := "C:\Covid19Tab\1.4\Covid19Tab\tmp\molde5.dbf"
public nPercent, nCounter, nTotalRecs
public cPercent

FErase( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt" )
nHandle := FCreate( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt" )
FWrite ( nHandle, "1.00" )
Fclose ( nHandle )
crlf := chr(13) + chr(10)

use ( cFileDBF )
nTotalRecs = reccount() * 16
close

* Codificacao do campo idade_n

use (cFileDBF)
nCounter = 1
do while .not. eof()
replace idade_n with val(idade)

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Preenche o campo nu_ano.

use ( cFileDBF ) 
do while .not. eof()
replace nu_ano with alltrim(str(year(dt_notific)))

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

close

* Preenche o campo sem_not.

	  aArray2 := {}
	  use ( "C:\Covid19Tab\1.4\Covid19Tab\tmp\weeks_table.dbf" )
	  nRecs := reccount()
      FOR x := 1 TO nRecs * 7
      AAdd( aArray2, {(dia1),alltrim(ano_sem)} )
      AAdd( aArray2, {(dia2),alltrim(ano_sem)} )
      AAdd( aArray2, {(dia3),alltrim(ano_sem)} )
      AAdd( aArray2, {(dia4),alltrim(ano_sem)} )
      AAdd( aArray2, {(dia5),alltrim(ano_sem)} )
      AAdd( aArray2, {(dia6),alltrim(ano_sem)} )
      AAdd( aArray2, {(dia7),alltrim(ano_sem)} )	  
	  skip  
	  NEXT
	  close

use ( cFileDBF )

do while .not. eof()
erro = 0
cDatex = dt_notific

cSem := ascan( aArray2, {|x| x[1] == (cDatex) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cSemNot := aArray2[cSem,2]
recover
erro = 1
end sequence

if erro = 0
replace sem_not with cSemNot
endif

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

* Preenche o campo sem_pri.

	  aArray3 := {}
	  use ( "C:\Covid19Tab\1.4\Covid19Tab\tmp\weeks_table.dbf" )
	  nRecs := reccount()
      FOR x := 1 TO nRecs * 7
      AAdd( aArray3, {(dia1),alltrim(ano_sem)} )
      AAdd( aArray3, {(dia2),alltrim(ano_sem)} )
      AAdd( aArray3, {(dia3),alltrim(ano_sem)} )
      AAdd( aArray3, {(dia4),alltrim(ano_sem)} )
      AAdd( aArray3, {(dia5),alltrim(ano_sem)} )
      AAdd( aArray3, {(dia6),alltrim(ano_sem)} )
      AAdd( aArray3, {(dia7),alltrim(ano_sem)} )	  
	  skip  
	  NEXT
	  close
	  aArray3 := asort( aArray3,,,{|x,y| x[1] < y[1] } )	  

use ( cFileDBF )

do while .not. eof()
erro = 0
cDatex2 = dt_sin_pri

cSem2 := ascan( aArray3, {|x| x[1] == (cDatex2) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cSemPri := aArray3[cSem2,2]
recover
erro = 1
end sequence

if erro = 0
replace sem_pri with cSemPri
endif

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

close

* Codificacao do campo sem_evoluc.

	  aArray3d := {}
	  use ( "C:\Covid19Tab\1.4\Covid19Tab\tmp\weeks_table.dbf" )
	  nRecs := reccount()
      FOR x := 1 TO nRecs * 7
      AAdd( aArray3d, {(dia1),alltrim(ano_sem)} )
      AAdd( aArray3d, {(dia2),alltrim(ano_sem)} )
      AAdd( aArray3d, {(dia3),alltrim(ano_sem)} )
      AAdd( aArray3d, {(dia4),alltrim(ano_sem)} )
      AAdd( aArray3d, {(dia5),alltrim(ano_sem)} )
      AAdd( aArray3d, {(dia6),alltrim(ano_sem)} )
      AAdd( aArray3d, {(dia7),alltrim(ano_sem)} )	  
	  skip  
	  NEXT
	  close
	  aArray3d := asort( aArray3d,,,{|x,y| x[1] < y[1] } )	  

use ( cFileDBF )

do while .not. eof()
erro = 0
cDatex2 = dt_evoluc

cSem2 := ascan( aArray3d, {|x| x[1] == (cDatex2) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cSemEv := aArray3d[cSem2,2]
recover
erro = 1
end sequence

if erro = 0
replace sem_evoluc with cSemEv
endif

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

close

* Codificacao do campo id_racacor.

cRacaCor := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(raca_cor)
case "BRANCA"
cRacaCor = "1"
exit
case "PRETA"
cRacaCor = "2"
exit
case "AMARELA"
cRacaCor = "3"
exit
case "PARDA"
cRacaCor = "4"
exit
case "INDIGENA"
cRacaCor = "5"
exit
case "IGNORADO"
cRacaCor = "9"
exit
otherwise
cRacaCor = "6"
endswitch

replace id_racacor with cRacaCor

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

close

* Codificacao do campo id_rg_resi.

	  aArray8 := {}
	  *cFileDBFNet := "C:\Covid19Tab\1.4\Covid19Tab\baseDBF\MUNICNET.DBF"
	  *cUnidF := "GO"
	  
	  if (HB_ArgV(3)) = "1"
	  cFileDBFNet := "C:\sinannet\basedbf\municnet.dbf"
	  else	  
      cFileDBFNet := "C:\Covid19Tab\1.4\Covid19Tab\basedbf\municnet.dbf"
	  endif	  
	  
	  use ( cFileDBFNet )
	  nRecs := reccount()
      FOR x := 1 TO nRecs
	  if alltrim(sg_uf) = (HB_ArgV(2))
      AAdd( aArray8, {alltrim(id_municip),alltrim(id_regiona)} )
	  endif
	  skip
	  NEXT
	  close
	  aArray8 := asort( aArray8,,,{|x,y| x[1] < y[1] } )  	  

use (cFileDBF)
do while .not. eof()
erro_rg = 0
cValor = alltrim(id_mn_resi)
if empty(cValor) = .F.
nPlace := ascan( aArray8, {|x| x[1] == (cValor) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
cPlaceRegiCode := aArray8[nPlace,2]
recover
erro_rg = 1
end sequence

if erro_rg = 0
replace id_rg_resi with cPlaceRegiCode
endif
endif

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Preenche o campo id_uf_res.

cIdUfRes := ""
use ( cFileDBF )
do while .not. eof()
cIdUfRes := (left(id_mn_resi,2))

replace id_uf_res with cIdUfRes

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo

close

* Codificacao do campo UF2.

cSiglaIs := ""
use ( cFileDBF )
do while .not. eof()
switch (id_uf_res)
case "11"
cSiglaIs = "RO"
exit
case "12"
cSiglaIs = "AC"
exit
case "13"
cSiglaIs = "AM"
exit
case "14"
cSiglaIs = "RR"
exit
case "15"
cSiglaIs = "PA"
exit
case "16"
cSiglaIs = "AP"
exit
case "17"
cSiglaIs = "TO"
exit
case "21"
cSiglaIs = "MA"
exit
case "22"
cSiglaIs = "PI"
exit
case "23"
cSiglaIs = "CE"
exit
case "24"
cSiglaIs = "RN"
exit
case "25"
cSiglaIs = "PB"
exit
case "26"
cSiglaIs = "PE"
exit
case "27"
cSiglaIs = "AL"
exit
case "28"
cSiglaIs = "SE"
exit
case "29"
cSiglaIs = "BA"
exit
case "31"
cSiglaIs = "MG"
exit
case "32"
cSiglaIs = "ES"
exit
case "33"
cSiglaIs = "RJ"
exit
case "35"
cSiglaIs = "SP"
exit
case "41"
cSiglaIs = "PR"
exit
case "42"
cSiglaIs = "SC"
exit
case "43"
cSiglaIs = "RS"
exit
case "50"
cSiglaIs = "MS"
exit
case "51"
cSiglaIs = "MT"
exit
case "52"
cSiglaIs = "GO"
exit
case "53"
cSiglaIs = "DF"
exit
otherwise
cSiglaIs = ""
endswitch

replace UF2 with cSiglaIs

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif
 
nCounter ++

skip
enddo

close

* Codificacao do campo id_class.

cClass := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(classific)
case "CONFIRMADO"
cClass = "1"
exit
case "DESCARTADO"
cClass = "2"
exit
case "SINDROME GRIPAL NAO ESPECIFICADA"
cClass = "3"
exit
case "SRAG NAO ESPECIFICADO"
cClass = "4"
exit
case "SUSPEITO"
cClass = "5"
exit
otherwise
cClass = "9"
endswitch

replace id_class with cClass

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo id_criter.

cCriterio := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(criterio)
case "CLINICO"
cCriterio = "1"
exit
case "CLINICO-EPIDEMIOLOGICO"
cCriterio = "2"
exit
case "CLINICO-IMAGEM"
cCriterio = "3"
exit
case "LABORATORIAL"
cCriterio = "4"
exit
otherwise
cCriterio = "9"
endswitch

replace id_criter with cCriterio

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo id_evoluc.

cEvolucao := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(evolucao)
case "CURA"
cEvolucao = "1"
exit
case "EM TRATAMENTO DOMICILIAR"
cEvolucao = "2"
exit
case "INTERNADO"
cEvolucao = "3"
exit
case "INTERNADO EM UTI"
cEvolucao = "4"
exit
case "OBITO"
cEvolucao = "5"
exit
case "OBITO POR OUTRAS CAUSAS"
cEvolucao = "6"
exit
case "IGNORADO"
cEvolucao = "9"
exit
endswitch

replace id_evoluc with cEvolucao

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo id_res_tst.

cResTeste := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(res_teste)
case "INCONCLUSIVO"
cResTeste = "1"
exit
case "POSITIVO"
cResTeste = "2"
exit
case "NEGATIVO"
cResTeste = "3"
exit
otherwise
cResTeste = "9"
endswitch

replace id_res_tst with cResTeste

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo id_tp_tst.

cTpTeste := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(tp_teste)
case "ECLIA IGG"
cTpTeste = "01"
exit
case "ELISA IGM"
cTpTeste = "02"
exit
case "ENZIMAIMUNOENSAIO"
cTpTeste = "03"
exit
case "IGA"
cTpTeste = "04"
exit
case "IGG"
cTpTeste = "05"
exit
case "IGM"
cTpTeste = "06"
exit
case "IMUNOENSAIO POR ELETRO"
cTpTeste = "07"
exit
case "QUIMIOLUMINESCENCIA -"
cTpTeste = "08"
exit
case "RT-PCR"
cTpTeste = "09"
exit
case "TESTE RAPIDO - ANTICOR"
cTpTeste = "10"
exit
case "TESTE RAPIDO - ANTIGEN"
cTpTeste = "11"
exit
otherwise
cTpTeste = "12"
endswitch

replace id_tp_tst with cTpTeste

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo id_est_tst.

cEstTeste := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(est_teste)
case "COLETADO"
cEstTeste = "1"
exit
case "CONCLUIDO"
cEstTeste = "2"
exit
case "EXAME NAO"
cEstTeste = "3"
exit
case "SOLICITADO"
cEstTeste = "4"
exit
otherwise
cEstTeste = "9"
endswitch

replace id_est_tst with cEstTeste

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

* Codificacao do campo id_fonte.

cFonte := ""
use (cFileDBF)
do while .not. eof()
switch alltrim(fonte)
case "ESUS"
cFonte = "1"
exit
case "SIVEP"
cFonte = "2"
exit
otherwise
cFonte = "9"
endswitch

replace id_fonte with cFonte

nPercent := ( 100 * nCounter ) / ( nTotalRecs ) 
cPercent := alltrim(str( nPercent ))
cRightString := right( cPercent,3 )
if cRightString = ".00"
nH := FOpen( "C:\Covid19Tab\1.4\Covid19Tab\tmp\data6.txt", FO_WRITE)
FWrite ( nH, cPercent )
FWrite ( nH, crlf )
Fclose ( nH )
endif

nCounter ++

skip
enddo
close

endif

Return Nil