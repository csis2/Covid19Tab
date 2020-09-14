#include "hmg.ch"

declare window Main

Function main_button_1_action

 cFile := Getfile ({{'Arquivos do tipo CSV','*.csv'}},'Abrir arquivo','c:\',.F.)
 Main.Label_1.value := (cFile)

Return Nil
