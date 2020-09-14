#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Esse script exclui as linhas em branco que existem no arquivo "heading.txt".
; Após o processamento, o arquivo passará a se chamar "heading_ready.txt"
; É necessário passar um argumento com o local e o nome do arquivo para rodar o script.
; Ex: del_line c:\covid19tab\heading.txt.

#Include tf.ahk
#MaxMem 500

argui = %1% ; Armazena o argumento na variavel global 'argui'.
LocalFile = %A_ScriptDir% ; path onde foi executado o script.

if (argui = "")
{
msgbox Script "del_line" sem argumento.
ExitApp ; se não existe argumento, finaliza o script.
}

if !FileExist(argui)
{
msgbox, Erro! Arquivo passado como argumento não existe.
ExitApp, 1
}

TotLines := TF_CountLines(argui)
TF_RemoveBlankLines(argui)

FileDelete, %argui%

complemento3 := "\heading_ready.txt"
argui3 := (LocalFile) (complemento3)

complemento2 := "\heading_copy.txt"
argui2 := (LocalFile) (complemento2)

FileMove, %argui2%, %argui3%

ExitApp