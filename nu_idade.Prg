#include <hmg.ch>

declare window Main

* Preenche o campo nu_idade.

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Preenchendo o campo nu_idade..." )
Main.List_1.Value:= (indice)

idade := ""
use (HB_DirBase() + "tmp_covid19.dbf" )

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

skip
enddo

close

Return Nil