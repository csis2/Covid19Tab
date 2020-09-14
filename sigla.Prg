#include <hmg.ch>

declare window Main

* Preenche o campo sigla.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo sigla..." )
Main.List_1.Value:= (indice)

cSiglaIs = ""
use (HB_DirBase() + "tmp_covid19.dbf" )
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
skip
enddo

close

Return Nil