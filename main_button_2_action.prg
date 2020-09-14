#include "hmg.ch"

declare window Main

Function main_button_2_action

* Verifica se um arquivo do e-SUS VE Notifica foi selecionado pelo usuário.
if empty(cFile) = .T.
erro = 1
msgbox ("É necessário que o usuário escolha um arquivo de exportação do e-SUS VE Notifica.","Covid19Tab")
else
erro = 0
endif

* Exclui os itens do ListBox.
Main.List_1.DeleteAllItems
indice := 0

* Coloca em variaveis o full path dos executaveis que serao usados pelo programa.
public cScript3 := (HB_DirBase())+"\verify.exe"
public cScript4 := (HB_DirBase())+"\del_line.exe"

* Coloca em variaveis o full path dos arquivos que serão gerados e trabalhados pelo programa.
public cFileDuplicate1 := HB_DirBase()+"\temp_covid19.txt"
public cFileDuplicate2 := HB_DirBase()+"\temp2_covid19.txt"
public cFileCompare := HB_DirBase()+"heading.txt"

* Roda a função para criar uma string com data/hora para o log de eventos.
dt := dia_hora()

if erro = 0
* Bloco de instruções para mostrar ao usuário o andamento do programa.
indice++
setProperty("Main", "List_1", "Item", (indice), (dt)+"Iniciando processamento..." )
cHoraInicio := (dt)
Main.List_1.Value:= (indice)
endif

* Inicia o processamento...
if erro = 0
start()
endif

Return Nil