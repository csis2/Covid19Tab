* Configuracao das variaveis de ambiente
set century on
set date british
set color to g+/
set safety off
set default to "C:\Covid19Tab\1.2\Covid19Tab\baseDBF"
clear

? "vfp9_teste.prg CSIS Software 2021."
? "Script para testar no Visual FoxPro 9 o resultado gerado pelos campos codificados."
? "__________________________________________________________________________________"
? ""

* Dados do arquivo a ser inspecionado.
cTypeIs = ""
cTypeIs = INPUTBOX("Escolha o tipo de arquivo.","Input ",cTypeIs)
cFileIs = ""
cFileIs = GETFILE('dbf','Escolha um arquivo DBF para testar','',1,'')

cPath = cFileIs
* Path onde o arquivo gerado deve ser salvo.

cFile = justfname(cPath)
cFileNoExt = juststem(cFile) + "."
use (cPath)
nRecs = reccount()
close tables

if alltrim(cTypeIs) = "MP1"

set color to bg+/
cPath2 = "C:\Covid19Tab\1.2\Covid19Tab\tst\MP1\"

? "campo id_racacor..."
cCampo = "id_racacor"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

? "campo id_evoluc..."
cCampo = "id_evoluc"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

? "campo id_tp_test..."
cCampo = "id_tp_test"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

? "campo id_esttest..."
cCampo = "id_esttest"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

? "campo id_cla_fin..."
cCampo = "id_cla_fin"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

? "campo id_sorolog..."
cCampo = "id_sorolog"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

? "campo cod_comuni..."
cCampo = "cod_comuni"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

endif

if alltrim(cTypeIs) = "MP2"

cPath2 = "C:\Covid19Tab\1.2\Covid19Tab\tst\MP2" 

? "campo id_racacor..."
cCampo = "id_racacor"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

set color to g+/
? "campo id_criter..."
cCampo = "id_criter"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

set color to g+/
? "campo id_evoluc..."
cCampo = "id_evoluc"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

set color to g+/
? "campo id_res_tst..."
cCampo = "id_res_tst"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

set color to g+/
? "campo id_tp_tst..."
cCampo = "id_tp_tst"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

set color to g+/
? "campo tp_teste..."
cCampo = "tp_teste"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

set color to g+/
? "campo id_est_tst..."
cCampo = "id_est_tst"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

set color to g+/
? "campo id_fonte..."
cCampo = "id_fonte"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

set color to g+/
? "campo cls_sivep..."
cCampo = "cls_sivep"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

set color to g+/
? "campo id_class..."
cCampo = "id_class"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

set color to g+/
? "campo nu_idade_n..."
cCampo = "nu_idade_n"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

set color to g+/
? "campo sem_not..."
cCampo = "sem_not"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

set color to g+/
? "campo sem_pri..."
cCampo = "sem_pri"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

set color to g+/
? "campo id_rg_resi..."
cCampo = "id_rg_resi"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

endif

if alltrim(cTypeIs) = "MP3"

? "campo id_racacor..."
cCampo = "id_racacor"
SELECT DISTINCT &cFileNoExt.&cCampo, count(*) ;
FROM (cPath) GROUP BY &cFileNoExt.&cCampo ;
ORDER BY &cFileNoExt.&cCampo ASC ;
INTO TABLE "&cPath2&cCampo"
if file("&cPath2&cCampo"+".dbf")
set color to bg+/
? "OK."
else
set color to r+/
? "Erro! Falha na geracao do arquivo."
endif
cPath3 = cPath2 + cCampo + ".dbf"
use (cPath3)
SUM cnt to nSomaCampo
if nRecs = nSomaCampo
? "Total de registros:ok."
else
set color to r+/
? "Erro no total de registros."
endif

copy file "C:\Covid19Tab\1.2\Covid19Tab\tst\*.dbf" TO "C:\Covid19Tab\1.2\Covid19Tab\tst\MP2\*.dbf"
delete file "C:\Covid19Tab\1.2\Covid19Tab\tst\*.dbf"

endif

set color to gr+/
? "Fim do script."
wait "Pressione qualquer tecla para finalizar o script."
quit