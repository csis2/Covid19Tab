#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include tf.ahk
#MaxMem 2000

; Verifica se os campos do arquivo "temp_covid19alfa.txt" foi, de fato, alterado pelo script "altera_campo.exe", analisando 
; o conteúdo do arquivo "heading2.txt" que contém o cabeçalho do arquivo "temp_covid19alfa.txt".

; Por segurança, cria um parâmetro para a execução do programa, evitando que o programa seja
; disparado por engano e faça alguma alteração não desejada.

argui = %1% ; Armazena o argumento na variavel global 'argui'.
LocalFile = %A_ScriptDir% ; path onde foi executado o script.
erro = 0

if (argui = "")
{
msgbox Script "verify" sem argumento.
ExitApp ; se não existe argumento, finaliza o script.
}

if !FileExist(argui)
{
msgbox, Erro! Arquivo passado como argumento não existe.
ExitApp, 1
}

; Procura por alguns campos que só existem se o script "altera_campo.exe" for executado corretamente.
; campo 1 - nu_notific
cResult := TF_Find((argui),1,1,"nu_notific",0,1)

if cResult > 0
{
conta_linhas1 := TF_CountLines(cResult) ; Conta o total de linhas em que a ocorrencia da palavra "nu_notific" foi positiva.
conta_linhas1 += 0
} else {
erro += 1
}

; campo 2 - classi_fin
cResult2 := TF_Find((argui),1,1,"classi_fin",0,1)

if cResult2 > 0
{
conta_linhas2 := TF_CountLines(cResult2) ; Conta o total de linhas em que a ocorrencia da palavra "classi_fin" foi positiva.
conta_linhas2 += 0
} else {
erro += 1
}

; campo 3 - dt_nasc
cResult3 := TF_Find((argui),1,1,"dt_nasc",0,1)

if cResult3 > 0
{
conta_linhas3 := TF_CountLines(cResult3) ; Conta o total de linhas em que a ocorrencia da palavra "dt_nasc" foi positiva.
conta_linhas3 += 0
} else {
erro += 1
}

; Conta o total de campos que foram efetivamente alterados.
total := conta_linhas1 + conta_linhas2 + conta_linhas3
if (total = 3)
{
; Se os três campos testados pelo script foram alterados, então o arquivo muda de nome (temp_covid19beta.txt).
complemento := "\temp_covid19alfa.txt"
argui10 := (LocalFile) (complemento)
complemento2 := "\temp_covid19beta.txt"
argui20 := (LocalFile) (complemento2)
FileMove %argui10%, %argui20%
 } else {
msgbox Erro na validação do arquivo. Campos não foram alterados.
}