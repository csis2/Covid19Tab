#include "hmg.ch"

declare window about

Function about_label_10_action
wapi_ShellExecute( 0, 'open','https://github.com/csisgo/Covid19Tab','','',SW_SHOWNORMAL )

Return Nil
