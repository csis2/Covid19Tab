PROCEDURE Main()

* CSIS Software 2021
* Script criado para testar os arquivos DBF do SINAN NET indicados pelo usuario.
* 
* "----------------------------------------------------------------------------"
* "Compilado no Harbour Make (hbmk2) versao 3.0.0"
* "Roda somente com argumento de entrada."
* testa_dbf.exe 1 -> Roda teste quando a configuracao do Covid19Tab registra o valor 1 - pasta 'SinanNet'
*                    no disco local C, subpasta 'BaseDBF'.
* testa_dbf.exe 2 -> Roda teste quando a configuracao do Covid19Tab registra o valor 2 - pasta 'Covid19Tab'
*                    no disco local C, subpasta 'BaseDBF'.
* "Exemplo: testa_dbf.exe 1"
* "----------------------------------------------------------------------------"

nErrorFile = 0

* Verifica se existe argumento.
if empty(HB_ArgV(1)) = .T.
set color to r+/
? "Erro! O programa precisa que voce forneca argumento de entrada."
__Quit()
endif

* Verifica se o argumento é valido.
set exact on
if (HB_ArgV(1)) <> "1" .and. (HB_ArgV(1)) <> "2"
set color to r+/
? "Erro! O argumento escolhido nao e valido."
__Quit()
endif

if (HB_ArgV(1)) = "1"

if File( "C:\SinanNet\BaseDBF\municnet.dbf" ) = .F.
nErrorFile = 1
else
use "C:\SinanNet\BaseDBF\municnet.dbf"
nRecs = reccount()
close
if nRecs = 0
nErrorFile = 1
endif
endif

if File( "C:\SinanNet\BaseDBF\regionet.dbf" ) = .F.
nErrorFile = 1
else
use "C:\SinanNet\BaseDBF\regionet.dbf"
nRecs = reccount()
close
if nRecs = 0
nErrorFile = 1
endif
endif

if File( "C:\SinanNet\BaseDBF\uf.dbf" ) = .F.
nErrorFile = 1
else
use "C:\SinanNet\BaseDBF\uf.dbf"
nRecs = reccount()
close
if nRecs = 0
nErrorFile = 1
endif
endif

nHandle := FCreate( "C:\Covid19Tab\1.8\Covid19Tab\tmp\data6.txt" )
FWrite ( nHandle, str(nErrorFile) )
Fclose ( nHandle )

endif

if (HB_ArgV(1)) = "2"

if File( "C:\Covid19Tab\1.8\Covid19Tab\baseDBF\MUNICNET.DBF" ) = .F.
nErrorFile = 1
else
use "C:\Covid19Tab\1.8\Covid19Tab\baseDBF\MUNICNET.DBF"
nRecs = reccount()
close
if nRecs = 0
nErrorFile = 1
endif
endif

if File( "C:\Covid19Tab\1.8\Covid19Tab\baseDBF\REGIONET.DBF" ) = .F.
nErrorFile = 1
else
use "C:\Covid19Tab\1.8\Covid19Tab\baseDBF\REGIONET.DBF"
nRecs = reccount()
close
if nRecs = 0
nErrorFile = 1
endif
endif

if File( "C:\Covid19Tab\1.8\Covid19Tab\baseDBF\UF.DBF" ) = .F.
nErrorFile = 1
else
use "C:\Covid19Tab\1.8\Covid19Tab\baseDBF\UF.DBF"
nRecs = reccount()
close
if nRecs = 0
nErrorFile = 1
endif
endif

nHandle := FCreate( "C:\Covid19Tab\1.8\Covid19Tab\tmp\data6.txt" )
FWrite ( nHandle, str(nErrorFile) )
Fclose ( nHandle )

endif

return Nil
