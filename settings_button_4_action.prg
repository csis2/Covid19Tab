#include "hmg.ch"

declare window settings

Function settings_button_4_action
nState := 0
cError_settings := 0
lRegistrosInconsistentes := settings.check_1.value
cSinan := settings.label_1.value
nWaitingTime := settings.spinner_1.value
nState := settings.combo_1.value
cUnidF := settings.combo_1.item(nState)

if empty( nState ) = .T.
msgbox ("Você deve selecionar uma UF para prosseguir.")
cError_settings = 1
endif

if empty( cSinan ) = .T. .and. cError_settings = 0
msgbox ("Você deve indicar onde está a pasta do SINAN NET para prosseguir.")
cError_settings = 1
endif

* Grava no arquivo "settings.c19" os valores escolhidos pelo usuário.
if cError_settings = 0
use (HB_DirBase() + "settings.c19" )
zap
append blank
replace uf with ( cUnidF )
replace registros with lRegistrosInconsistentes
replace sinan_net with ( cSinan )
replace time with nWaitingTime
close
msgbox ("Covid19Tab configurado.")
setProperty("Main", "enabled", .T. )
settings.release()
endif

Return Nil
