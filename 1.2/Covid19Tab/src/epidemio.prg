PROCEDURE Main()

* CSIS Software 2021
* Cria a estrtura DBF para receber os dados da semana epidemiologica.
* "------------------------------------------------------------------------"
* "Compilado no Harbour Make (hbmk2) versao 3.0.0"
* "Roda somente com argumento de entrada."
* "Exemplo: epidemio.exe run"
* "------------------------------------------------------------------------"

set century on
set date british

* Verifica se existe argumento.
if empty(HB_ArgV(1)) = .T.
set color to r+/
? "Erro! O programa precisa que voce forneca argumento de entrada."
wait
__Quit()
endif

* Verifica se o argumento é valido.
set exact on
if (HB_ArgV(1)) <> "run"
set color to r+/
? "Erro! O argumento escolhido nao e valido."
__Quit()
endif

   matstru0:= {}
   AAdd(matstru0, {"sem", "C", 2, 0})
   AAdd(matstru0, {"dom", "C", 10, 0})
   AAdd(matstru0, {"sab", "C", 10, 0})
   AAdd(matstru0, {"dia1", "D", 10, 0})
   AAdd(matstru0, {"dia2", "D", 10, 0})
   AAdd(matstru0, {"dia3", "D", 10, 0})
   AAdd(matstru0, {"dia4", "D", 10, 0})
   AAdd(matstru0, {"dia5", "D", 10, 0})
   AAdd(matstru0, {"dia6", "D", 10, 0})
   AAdd(matstru0, {"dia7", "D", 10, 0})
   AAdd(matstru0, {"ano_ref", "C", 4, 0})
   AAdd(matstru0, {"ano_sem", "C", 6, 0})
   dbcreate("C:\Covid19Tab\1.2\Covid19Tab\tmp\weeks_table", matstru0)

Return Nil