# **Covid19Tab**
É uma ferramenta de código aberto que permite que os dados exportados pelo"e-SUS VE Notifica" (https://notifica.saude.gov.br/login) possam ser tabulados no "TabWin" (http://www2.datasus.gov.br/DATASUS/index.php?area=060805).

## Como funciona?
O Covid19Tab transforma o arquivo exportado pelo usuário no e-SUS VE Notifica em um arquivo DBF e depois, cria campos extras dentro desse arquivo, como nome da regional, semana de início dos sintomas, idade etc. Em seguida, os dados desses campos que foram criados são preenchidos automaticamente com base nos dados de outros campos, outros campos novos, são codificados. Dessa forma, o arquivo resultante contém campos e registros que os tornam compatíveis para poder ser trabalhado no Tabwin.

## **É seguro instalar e usar o Covid19Tab?**

Sim. O arquivo de instalação, “Covid19Tab setup.exe” e o arquivo “Covid19Tab.rar” contém os arquivos que interessam para o usuário final. Escaneando esses arquivos no serviço online VirusTotal, não foram detectados conteúdo malicioso neles pelos antivírus mais conhecidos no mercado, como o AVG, McAfee, Avast, Kapersky, Symantec, F-Secure etc.

Você também pode constatar a segurança do Covid19Tab utilizando o VirusTotal (https://www.virustotal.com/gui/) para fazer uma varredura dos arquivos, o serviço é online e gratuito.

## **Colocando o Covid19Tab no seu computador**

O usuário poderá utilizar a ferramenta de duas maneiras: 

- instalando o programa no computador **ou**
- transferindo uma pasta contendo os executáveis e outros arquivos para o PC.

### Instalando o Covid19Tab

Atenção! O exemplo de instalação a seguir mostra um release desatualizado, pois quando esse instrutivo foi escrito era o mais atualizado, utilize sempre o que estiver mais atualizado no repositório, que, atualmente é o release "Covid19Tab_versao_1.0".

1. Para começar, o usuário deve fazer o download do arquivo "Covid19Tab.setup.exe". Esse arquivo está disponível no release "Covid19Tab_versao_alfa". Procure na página do repositório e clique no link.

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/release1.jpg)

2. Após clicar no link, será carregada a página do release selecionado. Clique no link "Covid19Tab.setup.exe".

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/release7.jpg)

3. Em seguida, uma mensagem surgirá, questionando o usuário se quer salvar o arquivo. Clique no botão "Salvar arquivo".

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/release8.jpg)

4. Procure a pasta onde o arquivo "Covid19Tab.setup.exe" foi salvo.

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/release9.jpg)

5. Execute o arquivo "Covid19Tab.setup.exe". O assistente de instalação fará algumas perguntas ao usuário para que o programa seja configurado adequadamente no computador. 

Para começar, escolha o modo de instalação.!![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/install1.jpg)

2. Escolha o local de instalação do programa. Se optar por uma pasta diferente da que vem como padrão (c:\Covid19Tab), nunca crie uma pasta para instalação com palavras separadas por espeço. Por exemplo, ao invés de criar uma pasta com o nome "c:\Minha Pasta", crie com o nome "c:\Minha_Pasta".

   ![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/install2.jpg)

3. Caso deseje criar um atalho para o Covid19Tab na área de trabalho, marque a caixa de checagem (checkbox) da tela seguinte.

   ![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/install3.jpg)

   4. Depois de feitas as escolhas, é só instalar o programa clicando no botão "Instalar".
      ![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/install4.jpg)

5. Aguarde a instalação realizada pelo arquivo de setup.

   ![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/install5.jpg)

6. Após a instalação, o assistente de instalação informará se a instalação foi bem sucedida. Clicando no botão "Concluir", o programa se iniciará automaticamente. Caso não queira iniciar o Covid19Tab após o término da instalação, desmarque a caixa de checagem "Iniciar o Covid19Tab".

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/install6.jpg)

A outra maneira que o usuário tem para rodar o Covid19Tab no seu PC é por transferência de pasta e arquivos.

### Transferindo uma pasta com os executáveis e outros arquivos para o PC

Para o Covid19Tab rodar da maneira descrita nesse item, será necessário a descompactação de arquivos. No exemplo mostrado a seguir, utilizamos o WinRAR (https://www.win-rar.com). Caso o usuário tenha dificuldade em operações de descompactação de arquivos, recomendamos que antes de começar esse tópico, instale o WinRAR no seu PC para facilitar o entendimento do conteúdo descrito a seguir.

1. Para começar, o usuário deve fazer o download do arquivo "Covid19Tab.rar". Esse arquivo está disponível no release "Covid19Tab_versao_alfa". Procure na página do repositório e clique no link.
   ![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/release1.jpg)

   2. Após clicar no link, será carregada a página do release selecionado. Clique no link "Covid19Tab.rar".

   ![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/release2.jpg)

   3. Clicando no link, em poucos instantes surgirá uma janela, o usuário então deve optar por abrir ou salvar o arquivo. Marque na caixa de checagem a opção "Abrir com - WinRAR" e clique no botão "OK".

   ![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/release3.jpg)

   4. Surgirá então uma nova janela, mostrando o conteúdo inicial da descompactação do arquivo "Covid19Tab.rar". Clique uma vez na pasta "Covid19Tab" para selecionar o arquivo, depois clique no botão "Extrair Para".
   
      ![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/release4.jpg)
   
      5. Na nova janela que surgirá, selecione "disco local C" e clique no botão "OK".

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/release5.jpg)

6. Quando a descompactação do arquivo terminar, o resultado será a pasta "Covid19Tab" no disco local C e, dentro dessa pasta, haverá o arquivo "Covid19Tab.exe", o arquivo principal do programa.

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/release6.jpg)

## **Usando o Covid19Tab**

Se o usuário tiver optado pela instalação do programa, basta acessá-lo por um atalho na área de trabalho, caso contrário, se tiver optado pela transferência de uma pasta com os executáveis e outros arquivos para o disco local C, basta procurar a pasta que foi transferido os arquivos e rodar o executável "Covid19Tab.exe".

A ilustração abaixo mostra a interface do usuário.

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/start01.jpg)

No entanto, na primeira vez que for utilizado, uma mensagem surgirá, indagando ao usuário se deseja configurar o programa. Clique no botão "Sim". 

**Atenção**! O usuário pode ignorar a configuração do programa e usá-lo sem configurar, no entanto, além de outros problemas que podem ocorrer, o processamento do arquivo que o usuário selecionar levará o dobro do tempo para ser processado, pois alguns arquivos de indexação precisam das informações fornecidas pelo usuário na configuração para funcionarem corretamente.

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/start02.jpg)

Surgirá a janela de Configuração.  Para começar, selecione a UF na qual o usuário pertence. Deixe marcado a opção de correção de campo inconsistente. 

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/start05.jpg)

Também é necessário que haja no PC em que foi instalado o Covid19Tab o programa SINAN NET. Caso não tenha esse programa instalado aí, proceda da seguinte maneira:

1. Crie no disco local C uma nova pasta com o nome 'SinanNet". Dentro dessa pasta, crie uma subpasta com o nome "BaseDBF". O resultado deverá ficar da maneira como mostrado na ilustração abaixo.

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/setting01.jpg)

Caso não seja você mesmo o operador do SINAN NET no seu município, regional ou estado, entre em contato com o(s) operador(es) desse sistema e solicite os seguintes arquivos: municnet.dbf, regionet.dbf, uf.dbf. 

No entanto, esses arquivos precisam ter registros, ou seja, não podem estar vazios e desatualizados. Para isso é necessário que o operador do SINAN NET execute a operação de exportação de arquivos DBF. Esse procedimento é feito da maneira apresentada a seguir.

2. Dentro do SINAN NET, entre no módulo "Ferramentas" e escolha o item "Exportação (DBF)".

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/sinan01.jpg)

3. Quando surgir a janela de Exportação, escolha os itens UF, MUNICÍPIO e REGIONAL. Depois clique no botão "Exportar".

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/sinan02.jpg)

4. Assim que o processo estiver concluído, uma mensagem surgirá, informando que os arquivos foram processados.

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/sinan03.jpg)

5. Agora o operador do SINAN NET poderá fornecer ao usuário do Covid19Tab os arquivos atualizados necessários ao funcionamento do Covid19Tab. Os arquivos gerados ficam, geralmente, dentro da subpasta "BaseDBF" que está dentro da pasta "SinanNet" no disco local C.  

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/sinan04.jpg)

6. Copie e cole esses arquivos dentro da subpasta "BaseDBF" conforme a estrutura mostrada no item 1 dessa seção. 

   Voltando à janela de "Configurações", indique onde está a pasta do SinanNet que você criou clicando no botão "Selecionar".  Por padrão, o programa já vem configurado mostrando o caminho mais comum. Se for o mesmo, não precisa mexer nesse controle.

   O próximo item é o tempo máximo de espera. O Covid19ab quando está processando um arquivo, passa por diversas etapas e, alguma delas, têm um tempo máximo de espera, até passar para uma próxima. Por padrão, o tempo máximo configurado é de cinco minutos, mas se for processado arquivos muito grandes, pode ser que esse tempo não seja suficiente.

   Verifique ao final do processamento do arquivo, a porcentagem de aproveitamento. Se for inferior a 100%, considere alterar o valor do tempo máximo de espera para um valor maior.

   Após ajustar todos os itens da janela "Configurações", clique no botão "OK".

## **Processando os arquivos do e-SUS VE Notifica**

Antes de iniciar o processamento é bom verificar se tudo está configurado e os arquivos necessários ao funcionamento da ferramenta não estão perdidos ou corrompidos. Para isso clique em "Menu" e acesse o item "Diagnóstico".

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/diagnosis.jpg)

O módulo de diagnóstico então, verificará se há algum problema conhecido que possa causar instabilidade ou mau funcionamento do programa. Para visualizar todos os itens, mova a barra vertical para cima ou para baixo, ou clique em algum item e se mova para um e outro pressionando as setas para cima ou para baixo do teclado.

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/diagnosis2.jpg)

Caso haja algum item com problema, tente encontrar uma solução lendo a seção "Usando o Covid19Tab".

Se estiver tudo ok, vamos para o passo seguinte.

Clique no botão "Selecionar" e mostre onde está o arquivo de exportação gerado pelo e-SUS VE Notifica. Sugerimos que esse arquivo de exportação, que é um arquivo de formato CSV, seja salvo dentro da subpasta "BaseDBF" que está dentro da pasta "Covid19Tab".

Depois de selecionado, clique no botão "Abrir".

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/running01.jpg)

Depois de selecionado o arquivo, clique no botão "OK" para iniciar o processamento do arquivo.

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/running02.jpg)

Ao final do processamento haverá um item informando a porcentagem de aproveitamento, ou seja, quantos registros que estavam no arquivo CSV selecionado pelo usuário, foram transferidos para o arquivo DBF. Também terá um item mostrando o tempo gasto para processar os dados e outro item informando que o processamento foi concluído.

O arquivo DBF resultante do processamento estará na mesma pasta em que você salvou o arquivo, nesse caso, na subpasta "BaseDBF" dentro da pasta "Covid19Tab".

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/running03.jpg)

Basta agora o usuário acessar o TabWin, entrar no módulo "Arquivos" e escolher o item "Executar tabulação". Quando a janela "Executa Tabulação - Abre arquivos de definição" surgir, escolha no painel "Diretórios", o local onde está o arquivo de definição do e-SUS VE Notifica. Pelo nosso exemplo, ele foi instalado no disco local C, pasta "Covid19Tab", subpasta "BaseDBF".

Clique duas vezes na subpasta "BaseDBF" conforme mostrado na figura abaixo e então selecione no painel "Arquivos de definição", o item "eSUS_VE_Notifica.def". Em seguida clique no botão "Abre DEF".

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/tabwin01.jpg)

Depois basta realizar as tabulações que desejar no TabWin.

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/tabwin02.jpg)

Caso o usuário não possua o TabWin no seu PC, o link abaixo fornece as orientações para instalação e operação desse programa

http://www2.datasus.gov.br/DATASUS/index.php?area=060805&item=6
