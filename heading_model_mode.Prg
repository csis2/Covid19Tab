#include <hmg.ch>
declare window Main

* Instruções para o programa funcionar quando usado no modo "--heading_model".

* Coloca em variaveis o full path dos executaveis que serao usados nesse modo do programa.
* public cScript1 := (HB_DirBase())+"\copyline.exe"
public cScript4 := (HB_DirBase())+"\del_line.exe"

* Coloca em variaveis o full path dos arquivos que serão gerados e trabalhados pelo programa.
public cFileDuplicate1 := HB_DirBase()+"\temp_covid19.txt"
public cFileDuplicate2 := HB_DirBase()+"\temp2_covid19.txt"
public cFileCompare := HB_DirBase()+"heading.txt"

* Roda o módulo duplicate
duplicate()

* Roda o módulo para copiar o cabeçalho do arquivo temp2_covid19.txt.
if erro = 0
copyline(HB_DirBase())
endif

* Roda módulo para verificar se o arquivo "heading.txt" foi gerado e se está pronto para uso.
if erro = 0
release1()
endif

* Roda o módulo para excluir linhas em branco do arquivo "heading.txt".
if erro = 0
del_line(cFileCompare)
endif

* Roda módulo para verificar se o arquivo "heading_ready.txt" foi gerado no módulo anterior
* e se está pronto para uso.
if erro = 0
release2()
endif

* Renomeia o arquivo "heading_ready.txt" para "heading_model.c19".
if erro = 0
rename_file()
endif

* Roda módulo para verificar se o arquivo "heading_model.c19" foi renomeado no módulo anterior.
* e se está pronto para uso.
if erro = 0
release5()
endif

dt := dia_hora()
FWrite( nH, (dt) + "Fim do processamento." + Chr(13) + Chr(10) )
msgbox ("Fim do processamento.")
Main.Release()

Return Nil