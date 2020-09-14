#include <hmg.ch>

declare window Main

* Compara o arquivo "heading_ready.txt" com o arquivo "heading_model.c19" e gera um arquivo
* com o resultado da comparação chamado de "comp_return.prn".

if erro = 0
public cFilex := (HB_DirBase()) + "\heading_ready.txt"
public cFiley := (HB_DirBase()) + "\heading_model.c19"
public cResult := (HB_DirBase()) + "\comp_return.prn"
public cLine := "/c echo n|comp " + (cFilex) + " " + (cFiley) + " > " + (cResult)
wapi_ShellExecute( 0, 'open','cmd', (cLine), 0 , 0 )
endif

Return Nil