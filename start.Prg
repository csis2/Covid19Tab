#include <hmg.ch>

declare window Main

* Esse módulo inicia, de fato, o processamento do arquivo indicado pelo usuário.

* Roda o módulo de duplicação e verificação de arquivos.
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

* Roda o módulo que compara o arquivo de comparação (heading_ready.txt) com o arquivo "heading_model.c19".
if erro = 0
compare_analyse()
endif

* Esse módulo verifica se o arquivo "comp_return.prn" (que contém o resultado da comparação) foi gerado.
if erro = 0
compare_return()
endif

* Roda o módulo que faz a validação de acordo com o resultado da comparação.
if erro = 0
validate()
endif

* Roda o módulo que altera o cabeçalho do arquivo selecionado pelo usuário.
if erro = 0
heading(HB_DirBase())
endif

* Roda módulo para verificar se o arquivo com o novo cabeçalho (temp_covid19alfa.txt) foi gerado
* e se está pronto para uso.
if erro = 0
release3()
endif

* Roda módulo para verificar se o arquivo "heading2.txt' foi gerado e se está pronto para uso.
if erro = 0
release4()
endif

* Verifica se a alteração dos campos foi bem-sucedida.
if erro = 0
verify()
endif

* Roda o módulo que cria um arquivo dbf que receberá os valores do arquivo csv.
if erro = 0
dbf_file()
endif

* Roda o módulo para verificar se o arquivo DBF foi efetivamente criado e está disponível para receber os registros.
if erro = 0
release6()
endif

* Roda o módulo "transfer" que transfere os registros do arquivo CSV para DBF.
if erro = 0
transfer()
endif

* Roda o módulo que monitora se a transferencia foi finalizada.
if erro = 0
release7()
endif

* Altera o nome do arquivo e verifica se a transferencia foi bem sucedida.
if erro = 0
alter()
endif

* Verifica se o arquivo dbf está liberado para uso para criacao de campos extra.
if erro = 0
cria_campo()
endif

* Verificando se os campos extras foram criados.
if erro = 0
tem_campo()
endif

* Apaga os arquivos auxiliares.
if erro = 0
delaux()
endif

* Roda o módulo de indexação dos arquivos.
if erro = 0
indexing()
endif

* Roda o módulo para preencher o campo uf_resi.
if erro = 0
uf_resi()
endif

* Roda o módulo para preencher o campo sigla.
if erro = 0
sigla()
endif

* Roda o módulo para preencher o campo id_mn_resi.
if erro = 0
id_mn_resi()
endif

* Roda o módulo para preencher o campo nu_ano.
if erro = 0
nu_ano()
endif

* Roda o módulo para gerar a semana epidemiológica.
if erro = 0
calepi (2020)
endif

* Roda o módulo que verifica se a tabela com a semana epidemiológica
* foi criada e preenchida.
if erro = 0
verify_calepi()
endif

* Roda o módulo para preencher o campo sem_not.
if erro = 0
sem_not()
endif

* Roda o módulo para preencher o campo sem_pri.
if erro = 0
sem_pri()
endif

* Roda o módulo para preencher o campo nu_idade.
if erro = 0
nu_idade()
endif

* Roda o módulo para preencher o campo id_rg_resi.
if erro = 0
id_rg_resi()
endif

* Roda o módulo para preencher o campo nomeregi.
if erro = 0
nomeregi()
endif

* Roda o módulo para preencher o campo uf_not.
if erro = 0
uf_not()
endif

* Roda o módulo para preencher o campo sigla_not.
if erro = 0
sigla_not()
endif

* Roda o módulo para preencher o campo id_municip.
if erro = 0
id_municip()
endif

* Roda o módulo para preencher o campo id_rg_not.
if erro = 0
id_rg_not()
endif

* Roda o módulo para preencher o campo regio_not.
if erro = 0
regio_not()
endif

* Roda o módulo para preencher o campo id_racacor.
if erro = 0
id_raca_cor()
endif

* Roda o módulo para preencher o campo id_evoluc.
if erro = 0
id_evoluc()
endif

* Roda o módulo para preencher o campo id_tp_test.
if erro = 0
id_tp_test()
endif

* Roda o módulo para preencher o campo id_esttest.
if erro = 0
id_esttest()
endif

* Roda o módulo para preencher o campo id_cla_fin.
if erro = 0
id_cla_fin()
endif

* Roda o módulo para preencher o campo id_sorolog.
if erro = 0
id_sorolog()
endif

* Roda o módulo que renomeia definitivamente o arquivo DBF gerado.
if erro = 0
ren_file()
endif

close all

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+(cPercent ) )
setProperty("Main", "List_1", "Value", (indice))

* Roda o modulo que calcula quanto tempo levou o processamento dos dados.
if erro = 0
tempo()
endif

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Processamento concluído." )
Main.List_1.Value:= (indice)

Return Nil