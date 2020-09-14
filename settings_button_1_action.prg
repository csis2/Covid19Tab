#include "hmg.ch"

declare window settings

Function settings_button_1_action

 cFolder1 := Getfolder ("Pasta do Sinan Net.","c:\sinannet\")
 settings.Label_1.value := (cFolder1)

Return Nil
