# **Covid19Tab**
É uma ferramenta de código aberto que permite que os dados exportados pelo e-SUS VE Notifica possam ser tabulados no TabWin (http://www2.datasus.gov.br/DATASUS/index.php?area=060805).

## Como funciona?
O Covid19Tab transforma o arquivo exportado pelo usuário no e-SUS VE Notifica em um arquivo DBF e depois, cria campos extras dentro desse arquivo, como nome da regional, semana de início dos sintomas, idade etc. Em seguida, os dados desses campos que foram criados são preenchidos automaticamente com base nos dados de outros campos, outros são codificados. Dessa forma, o arquivo resultante contém campos e registros que os tornam compatíveis para poder ser trabalhado no Tabwin.
