PROCEDURE Main()
set century on
set date british

* CSIS Software 2021
* Preenche a tabela "weeks_table.dbf".
* "------------------------------------------------------------------------"
* "Compilado no Harbour Make (hbmk2) versao 3.0.0"
* "Roda somente com argumento de entrada."
* "Exemplo: fill_week.exe run
* "------------------------------------------------------------------------"

* Verifica se existe argumento.
if empty(HB_ArgV(1)) = .T.
set color to r+/
? "Erro! O programa precisa que voce forneca argumento de entrada."
__Quit()
endif

* Verifica se o argumento é valido.
set exact on
if isdigit(HB_ArgV(1)) = .F.
set color to r+/
? "Erro! O argumento escolhido nao e valido."
__Quit()
endif

use "C:\Covid19Tab\1.9\Covid19Tab\tmp\weeks_table.dbf"
cFile := "c:\covid19tab\1.9\covid19tab\epi\" + alltrim(HB_ArgV(1)) + ".txt"
append from ( cFile ) FIELDS sem,dom,sab,ano_ref delimited with ','

nCounter := 0
goto top
do while .not. eof()
if ano_ref = alltrim(HB_ArgV(1))
nCounter ++
endif
skip
enddo

goto top
locate for ( ano_ref = alltrim(HB_ArgV(1)) .and. sem = "01" )
nRecno = recno()

goto nRecno
for n = 1 to nCounter

dDayX := ctod(dom)
replace dia1 with dDayX
replace dia2 with dDayX + 1
replace dia3 with dDayX + 2
replace dia4 with dDayX + 3
replace dia5 with dDayX + 4
replace dia6 with dDayX + 5
replace dia7 with dDayX + 6
replace ano_sem with alltrim( ano_ref ) + alltrim ( sem )

if ctod(sab) <> dia7
errorlevel(1)
__Quit()
endif

skip
next

return nil