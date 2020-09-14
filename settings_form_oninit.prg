#include "hmg.ch"

declare window settings

Function settings_form_oninit
setProperty("Main", "enabled", .f. )
use (HB_DirBase() + "settings.c19" )
cUnidF := uf
lRegistrosInconsistentes := registros
cSinan := sinan_net
nWaitingTime := time
x := 0
close

* Procura no combobox a sigla da UF correspondente ao valor disponivel no arquivo 'settings.c19'.
if empty( cUnidF ) = .F.
for n = 1 to 27
if ( cUnidF ) = (settings.Combo_1.Item(n))
x = n
endif
endfor
settings.Combo_1.value := x
endif

settings.label_1.value := (alltrim( cSinan ))
settings.Check_1.value := lRegistrosInconsistentes
settings.Spinner_1.value := nWaitingTime
if empty(cUnidF) = .T.
cUnidF := ""
endif

Return Nil