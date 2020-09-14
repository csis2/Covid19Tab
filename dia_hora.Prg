#include <hmg.ch>

declare window Main
* Função para criar uma string com data/hora para o log de eventos.

cAno := alltrim(str((year(date()))))
nMes := month(date())
switch (nMes)
case 1
cMes = "01"
exit
case 2
cMes = "02"
exit
case 3
cMes = "03"
exit
case 4
cMes = "04"
exit
case 5
cMes = "05"
exit
case 6
cMes = "06"
exit
case 7
cMes = "07"
exit
case 8
cMes = "08"
exit
case 9
cMes = "09"
exit
otherwise
cMes = alltrim(str(month(date())))
endswitch

nDia := day(date())
switch (nDia)
case 1
cDia = "01"
exit
case 2
cDia = "02"
exit
case 3
cDia = "03"
exit
case 4
cDia = "04"
exit
case 5
cDia = "05"
exit
case 6
cDia = "06"
exit
case 7
cDia = "07"
exit
case 8
cDia = "08"
exit
case 9
cDia = "09"
exit
otherwise
cDia = alltrim(str(day(date())))
endswitch
cData := (cDia) + "/" + (cMes) + "/" + (cAno) + "-" + alltrim(time()) + "-"
return (cData)