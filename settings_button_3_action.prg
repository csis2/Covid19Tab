#include "hmg.ch"

declare window settings

Function settings_button_3_action
setProperty("Main", "enabled", .t. )
settings.release()
Return Nil
