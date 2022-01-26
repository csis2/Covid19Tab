PROCEDURE Main()

* CSIS Software 2021
* Script criado para indexar os campos 'uf_reside' e 'uf_notific' do arquivo 'molde5.dbf'.
* "------------------------------------------------------------------------"
* "Compilado no Harbour Make (hbmk2) versao 3.0.0"
* "Roda somente com argumento de entrada."
* "Exemplo: index.exe run"
* "------------------------------------------------------------------------"

* Verifica se existe argumento.
if empty(HB_ArgV(1)) = .T.
set color to r+/
? "Erro! O programa precisa que voce forneca argumento de entrada."
__Quit()
endif

* Verifica se o argumento é valido.
set exact on
if (HB_ArgV(1)) <> "MP1" .and. (HB_ArgV(1)) <> "MP2" .and. (HB_ArgV(1)) <> "MP3" .and. (HB_ArgV(1)) <> "MP4" .and. (HB_ArgV(1)) <> "MP5"
set color to r+/
? "Erro! O argumento escolhido nao e valido."
__Quit()
endif

if (HB_ArgV(1)) = "MP1"

use "C:\Covid19Tab\1.9\Covid19Tab\tmp\molde5.dbf"
index on uf_notific to "C:\Covid19Tab\1.9\Covid19Tab\tmp\uf_notific" ascending
index on uf_reside to "C:\Covid19Tab\1.9\Covid19Tab\tmp\uf_reside" ascending
close

endif

if (HB_ArgV(1)) = "MP3"

use "C:\Covid19Tab\1.9\Covid19Tab\tmp\molde5.dbf"
index on munic_not to "C:\Covid19Tab\1.9\Covid19Tab\tmp\munic_not_index" ascending
close

endif

return nil