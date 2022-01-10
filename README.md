# **Covid19Tab**
É uma ferramenta de código aberto que permite que os dados exportados pelo"e-SUS VE Notifica" (https://notifica.saude.gov.br/login) possam ser tabulados no "TabWin" (http://www2.datasus.gov.br/DATASUS/index.php?area=060805).

## Como funciona?
O Covid19Tab transforma o arquivo exportado pelo usuário no e-SUS VE Notifica em um arquivo DBF e depois, cria campos extras dentro desse arquivo, como nome da regional, semana de início dos sintomas, idade etc. Em seguida, os dados desses campos que foram criados são preenchidos automaticamente com base nos dados de outros campos, outros campos novos, são codificados. Dessa forma, o arquivo resultante contém campos e registros que os tornam compatíveis para poder ser trabalhado no Tabwin.

## **É seguro instalar e usar o Covid19Tab?**

Sim. O arquivo de instalação, “Covid19Tab setup.exe” e o arquivo “Covid19Tab.rar” contém os arquivos que interessam para o usuário final. Escaneando esses arquivos no serviço online VirusTotal, não foram detectados conteúdo malicioso neles pelos antivírus mais conhecidos no mercado, como o AVG, McAfee, Avast, Kapersky, Symantec, F-Secure etc.

Você também pode constatar a segurança do Covid19Tab utilizando o VirusTotal (https://www.virustotal.com/gui/) para fazer uma varredura dos arquivos, o serviço é online e gratuito.

## **3. Colocando o Covid19Tab no seu computador**

O usuário poderá utilizar a ferramenta de duas maneiras: 

- instalando o programa no computador **ou**
- transferindo uma pasta contendo os executáveis e outros arquivos para o PC.

### 3.1. Instalando o Covid19Tab

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/warning.jpg) Atenção!  Nas instruções que se seguem, as imagens que ilustram os procedimentos, mostra versões desatualizadas do Covid19Tab. Essas imagens são apenas para auxiliar o passo-a-passo da instalação e uso, já que o procedimento é o mesmo para as versões mais antigas. Utilize sempre o release que estiver mais atualizado no repositório. Atualmente, é o release "Covid19Tab versão 1.8".

3.1.1. Para começar, o usuário deve fazer o download do arquivo "Covid19Tab_1.8_setup.exe". Esse arquivo está disponível no release "Covid19Tab versao 1.8". Procure na página do repositório e clique no link.

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image1.jpg)

3.1.2. Após clicar no link, será carregada a página do release selecionado. Clique no link "Covid19Tab_1.8_setup.exe".

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image2.jpg)

3.1.3. Em seguida, uma mensagem surgirá, questionando se o usuário quer salvar o arquivo. Clique no botão "Salvar arquivo".

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image3.jpg)

3.1.4. Procure a pasta onde o arquivo "Covid19Tab_1.8_setup.exe" foi salvo.

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image4a.jpg)

3.1.5. Execute o arquivo "Covid19Tab_1.8_setup.exe".

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image5.jpg)

3.1.6. Clique no botão "Próximo" para iniciar a instalação. Nessa versão, o usuário não escolhe o lugar onde o programa será instalado, devendo ser, de forma compulsória, no disco local C, na pasta "Covid19Tab". A única escolha que o usuário tem é de optar pela criação de um atalho para o programa na área de trabalho (sugerimos que essa opção seja escolhida). Faça a sua escolha e clique no botão "Próximo".

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image6.jpg)

3.1.7. Tudo pronto para a instalação, clique no botão "Instalar".

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image7.jpg)

3.1.8. Aguarde a instalação realizada pelo arquivo de setup.

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image8.jpg)

3.1.9. No final do processo, o assistente de instalação informará se a operação foi bem sucedida. Clicando no botão "Concluir", o programa se iniciará automaticamente. Caso não queira iniciar o Covid19Tab após o término da instalação, desmarque a caixa de checagem "Iniciar o Covid19Tab".

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image9.jpg)

### 3.2. Transferindo uma pasta com os executáveis e outros arquivos para o PC

Para o Covid19Tab rodar da maneira descrita nesse item, será necessário a descompactação de arquivos. No exemplo mostrado a seguir, utilizamos o WinRAR (https://www.win-rar.com). Caso o usuário tenha dificuldade em operações de descompactação de arquivos, recomendamos que antes de começar esse tópico, instale o WinRAR no seu PC para facilitar o entendimento do conteúdo descrito a seguir.

3.2.1. Para começar, o usuário deve fazer o download do arquivo "Covid19Tab_1.8.rar". Esse arquivo está disponível no release "Covid19Tab versao 1.8". Procure na página do repositório e clique no link.

   ![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image1.jpg)

3.2.2. Após clicar no link, será carregada a página do release selecionado. Clique no link "Covid19Tab_1.8.rar".

   ![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image10.jpg)

3.2.3. Clicando no link, em poucos instantes surgirá uma janela, o usuário então deve optar por abrir ou salvar o arquivo. Marque na caixa de checagem a opção "Abrir com - WinRAR" e clique no botão "OK".

   ![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image11.jpg)

3.2.4. Surgirá então uma nova janela, mostrando o conteúdo inicial da descompactação do arquivo "Covid19Tab_1.8.rar". Clique uma vez na pasta "Covid19Tab" para selecionar o arquivo, depois clique no botão "Extrair Para".

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/release4.jpg)

3.2.5. Na nova janela que surgirá, selecione "disco local C" e clique no botão "OK".

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/release5.jpg)

3.2.6. Quando a descompactação do arquivo terminar, o resultado será a pasta "Covid19Tab" no disco local C e, dentro dessa pasta, haverá o arquivo "Covid19Tab.exe", o arquivo principal do programa.

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image12a.jpg)

## **4. Configurando o Covid19Tab**

Se o usuário tiver optado pela instalação do programa, basta acessá-lo por um atalho na área de trabalho, caso contrário, se tiver optado pela transferência de uma pasta com os executáveis e outros arquivos para o disco local C, basta procurar a pasta que foi transferido os arquivos e rodar o executável "Covid19Tab.exe".

A ilustração abaixo mostra a interface do usuário.

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image13.jpg)

Da primeira vez que o programa é aberto, é necessário realizar a configuração para que este funcione corretamente. Dessa forma é necessário que o usuário clique no botão "Menu" e acesse o item "Configuração".

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image14.jpg)

Acessando o módulo de Configuração, o usuário deverá selecionar a UF em que está operando, e indicar, em duas opções disponíveis, onde está localizado os arquivos do SINAN NET, necessários para o correto funcionamento do programa.

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image15.jpg)

Para indicar onde os arquivos DBF do SINAN NET estão, o usuário tem duas opções:

1. Pasta "SinanNet" no disco local C, subpasta "BaseDBF";
2. Pasta "Covid19Tab" no disco local C, subpasta "baseDBF".

A primeira opção pode ser usada pelos usuários que possuem o programa "SINAN NET" instalado no mesmo computador onde está o Covid919Tab. Nesse caso, os arquivos "MUNICNET.DBF, "UF.DBF" e "REGIONET.DBF" devem estar na subpasta "BaseDBF" do diretório "SinanNet" no disco local C. Essa subpasta é onde os arquivos com extensão DBF do SINAN NET costumam ficar armazenadas.
Além disso, esses arquivos precisam ter registros, ou seja, não podem estar vazios e desatualizados. Para isso é necessário que o operador do SINAN NET execute a operação de exportação de arquivos DBF. Esse procedimento é feito da maneira apresentada a seguir.

4.1.1. Dentro do SINAN NET, entre no módulo "Ferramentas" e escolha o item "Exportação (DBF)".

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/sinan01.jpg)

4.1.2. Quando surgir a janela de Exportação, escolha os itens UF, MUNICÍPIO e REGIONAL. Depois clique no botão "Exportar".

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/sinan02.jpg)

4.1.3. Assim que o processo estiver concluído, uma mensagem surgirá, informando que os arquivos foram processados.

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/sinan03.jpg)

Essa operação deverá ser suficiente para os usuários que escolheram a primeira opção para indicar onde os arquivos do SINAN NET estão.

Caso o usuário opte pela segunda opção, deve seguir os seguintes passos:

4.2.1. Crie no disco local C uma nova pasta com o nome 'SinanNet". Dentro dessa pasta, crie uma subpasta com o nome "BaseDBF". O resultado deverá ficar da maneira como mostrado na ilustração abaixo.

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/setting01.jpg)

4.2.2. Caso não seja você mesmo o operador do SINAN NET no seu município, regional ou estado, entre em contato com o(s) operador(es) desse sistema e solicite os seguintes arquivos: municnet.dbf, regionet.dbf, uf.dbf. 
No entanto, da mesma forma que na primeira opção, esses arquivos precisam ter registros, ou seja, não podem estar vazios e desatualizados. Para isso é necessário que o operador do SINAN NET execute a operação de exportação de arquivos DBF. Assim, deve ser executados os procedimentos descritos nos itens 4.1.1 a 4.1.3.

4.2.3. Agora o operador do SINAN NET poderá fornecer ao usuário do Covid19Tab os arquivos atualizados necessários ao funcionamento do Covid19Tab. Os arquivos gerados ficam, geralmente, dentro da subpasta "BaseDBF" que está dentro da pasta "SinanNet" no disco local C.  

![alt text](https://github.com/csis2/Covid19Tab/blob/master/img/sinan04.jpg)

4.2.4. Copie os três arquivos e cole-os na subpasta "BaseDBF", criada conforme descrito e mostrado no item 4.2.1.

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image16.jpg)

## **5. Processando arquivos no Covid19Tab**

A partir da versão 1.2, o Covid19Tab passa a trabalhar com o conceito de MP (modelos padrão). Assim, como a estrutura dos arquivos de exportação do e-SUS VE Notifica costuma ter variações ao longo de seu ciclo de vida, será interessante que a estrutura desses arquivos seja documentada e catalogada a fim de se evitar confusões com arquivos de exportação que tiveram sua estrutura alterada e que não são mais usados.
Atualmente, além do arquivo de exportação gerado pelo e-SUS VE Notifica (MP1), o Covid19Tab também é capaz de processar os arquivos criados pela GTI-SESGO, os arquivos de dados unificados que unem as bases de dados do e-SUS VE Notifica e do SIVEP Gripe. Esses dois últimos tipos são: arquivo de dados unificados COE - MP2 e arquivo de dados unificados - MP3.
Atualmente também processa o arquivo de exportação, gerado pelo e-SUS VE Notifica, de monitoramento de contatos. Trata-se de um novo modelo padrão, o MP4.

Segue então, para fins de registro, os modelos padrão atualmente usados pelo Covid19Tab:

Modelo para arquivos exportados pelo e-SUS VE Notifica:
![Link para download do modelo padrão MP1 versão 1.0](https://github.com/csis2/Covid19Tab/blob/1.6/1.6/Covid19Tab/doc/estrutura_MP1_versao_1.0.xlsx)

Modelo para arquivos de dados unificados COE:
![Link para download do modelo padrão MP2 versão 1.1](https://github.com/csis2/Covid19Tab/blob/1.6/1.6/Covid19Tab/doc/estrutura_MP2_versao_1.1.xlsx)

Modelo para arquivos de dados unificados:
![Link para download do modelo padrão MP3 versão 1.1](https://github.com/csis2/Covid19Tab/blob/1.6/1.6/Covid19Tab/doc/estrutura_MP3_versao_1.1.xlsx)

Modelo para arquivos de monitoramento de contatos:
![Link para download do modelo padrão MP4 versão 1.0](https://github.com/csis2/Covid19Tab/blob/1.6/1.6/Covid19Tab/doc/estrutura_MP4_versao_1.0.xlsx)

Uma vez configurado o programa, o usuário estará pronto para processar um arquivo, desde que tal arquivo, seja um dos modelos permitidos pelo Covid19Tab.
Dessa forma, primeiramente o usuário deve escolher o tipo de arquivo que será processado, escolhendo uma das opções disponíveis.

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image17.jpg)

Depois de escolhido o tipo do arquivo, o usuário deve mostrar onde está o arquivo a ser processado, clicando no botão "Selecionar".

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image18.jpg)

Clicando no botão "Selecionar", uma janela será aberta para que o usuário mostre onde o arquivo a ser processado se encontra. Depois de selecionar o arquivo, clique no botão "Abrir";

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image19.jpg)

Após selecionar o tipo de arquivo e apontar onde este está localizado, clique no botão "OK";

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image20.jpg)

Isso iniciará o processamento do arquivo e o avanço das etapas poderá ser acompanhado na caixa "Andamento do processo", na parte inferior da janela principal do programa.

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image21.jpg)

Ao final do processamento aparecerá uma caixa de diálogo informando o fim do processo, a quantidade de registros processados, percentual de aproveitamento, o nome do arquivo gerado e quanto tempo levou para processar o arquivo apontado pelo usuário.

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image22.jpg)

O arquivo resultante desse processo (que sempre será um arquivo com extensão DBF) estará na subpasta "baseDBF". Veja que o novo arquivo terá o código do tipo de arquivo escolhido (nesse exemplo mostrado, MP1), e um caracter underline seguido do nome do arquivo CSV que o usuário apontou no início do processo.

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image23.jpg)

Uma vez que o arquivo DBF foi criado, basta agora o usuário acessar o TabWin, entrar no módulo "Arquivos" e escolher o item "Executar tabulação".

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image24.jpg)

Quando a janela "Executa Tabulação - Abre arquivos de definição" surgir, escolha no painel "Diretórios", o local onde estão os modelos padrão do e-SUS VE Notifica e dos dados unificados. Pelo nosso exemplo, ele foi instalado no disco local C, pasta "Covid19Tab", subpasta "1.3\Covid19Tab\baseDBF".
Clique duas vezes na subpasta "BaseDBF" conforme mostrado na figura abaixo e então selecione no painel "Arquivos de definição", o modelo padrão que corresponde ao tipo de arquivo gerado, no nosso exemplo, foi gerado um arquivo do tipo MP1, então o arquivo de definição será o "MP1_eSUS_VE_Notifica.def". Em seguida clique no botão "Abre DEF".

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image25.jpg)

Em seguida escolha o arquivo gerado no Covid19Tab que deseja tabular e pronto!

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/image26.jpg)

## **6. Registros inconsistentes**

Em tecnologia da informação, a inconsistência de dados pode significar muitas coisas, no caso em questão, está relacionado à imprecisão ou um erro introduzido em um banco de dados decorrente de falha humana ao digitar, por exemplo, um formulário de notificação no e-SUS VE Notifica.
Para fins didáticos, vamos dividir as inconsistencias dos dados apresentados no processamento de arquivos no Covid19Tab em dois tipos: inconsistência de nível 1 e de nível 2.

A inconsistencia de nível 1 é a mais crítica, podendo travar o Covid19Tab e travar até mesmo programas mais robustos que processam os dados em sistemas de B.I. (Bussiness Inteligence) para apresentação em painéis públicos na web para divulgação e atualização de informações sobre Coronavirus.
A inconsistência de nível 2 é menos crítica, porém, pode causar erros na interpretação dos dados após o processamento, acarretando perda da qualidade da informação no resultado final.
Os resultados encontrados com a implementação da funcionalidade para detecção de inconsistência de nível 2 pode ser visualizada na figura abaixo:

![alt text](https://github.com/csis2/Covid19Tab/blob/1.6/img/table1.jpg)

Um exemplo de inconsistencia do tipo 1 foi introduzida certa vez por um usuário que, ao incluir os dados de um paciente no e-SUS VE Notifica, introduziu em um campo de endereço, além do endereço do paciente, um texto de mais de 300 caracteres.

Entrando no campo das suposições o texto pode ter sido introduzido por engano durante o processo de copiar os dados de endereço do paciente e erronemante copiou-se um bloco de texto maior do que se queria, a princípio.

De qualquer forma, de forma acidental ou proposital, como não havia uma função na aplicação que limitava a entrada de dados a um certo número de caracteres, esse valor absurdo foi gravado no banco de dados.

O problema vem posteriormente quando os dados são exportados, seja pelo próprio recurso de exportação do e-SUS VE Notifica ou por meio da API.
Quando essa inconsistência é processada por algum programa, a forma padronizada em que os dados normalmente são escritos no arquivo é, em algum ponto interrompida, e ocorre um erro de buffer overflow de strings durante o processamento, ocorrendo uma interrupção inesperada do programa ou até uma condição de deadlock (situação em que dois ou mais processos ficam impedidos de continuar suas execuções), nesse último caso, o programa nunca termina de executar a tarefa, entrando em um loop infinito.

A partir da versão 1.6, foi introduzido um algoritmo capaz de identificar uma inconsistencia de nível 1 no arquivo que o usuário indicar para processamento. O algoritmo busca por uma diferença de padrão na ordem em que os registros foram escritos no arquivo e quando essa diferença é detectada, uma mensagem aparece
para o usuário informando-o do problema, também é gerado o arquivo "relatorio_nivel1.txt" no diretório "rel", onde é mostrado o número da linha no arquivo em que foi encontrada a inconsistência.

Ao informar o usuário da presença de uma inconsistência de nível 1 no arquivo, o programa pergunta ao usuário se deseja continuar ou não com o processamento.
Caso opte por não continuar, o programa é encerrado. Se optar por continuar, o usuário deve observar se a inconsistência detectada é capaz de interromper ou travar o programa, caso isso aconteça, será necessário tratar esse registro para que o programa consiga processar esse dado no arquivo.
Em ambos os casos, será necessário identificar onde está o registro inconsistente e tratá-lo, se possível.
Nos passos seguintes iremos demonstrar como isso pode ser feito.

1. Procure no diretório o arquivo CSV que você selecionou para o Covid19Tab processar;
2. Altere a extensão desse arquivo de CSV para TXT. Se o sistema operacional que você estiver usando estiver configurado para não mostrar extensão de arquivos, será      necessário alterar essa configuração para que as extensões dos arquivos possam ser vistas;
3. Um arquivo de formato CSV (comma-separated values) é basicamente um arquivo texto com dados separados pelo caracter ";". Dessa forma, precisamos de um programa        para ler arquivos nesse formato, usar o bloco de notas do Windows não é recomendado, pois a visualização das linhas de texto nesse programa é limitada e em            arquivos muito grandes, o registro com inconsistencia pode não aparecer.
   Dessa forma, sugerimos que o usuário faça uso de um programa de leitura de arquivos de log para visualizar o conteúdo do arquivo de texto que foi alterado no passo    2. Utilizamos para essa finalidade o programa Klogg (https://klogg.filimonov.dev/). É um programa de código aberto, rápido e capaz de visualizar o conteúdo de        arquivos de texto com vários gigabytes de tamanho;
4. Abra o arquivo de texto que foi alterado no passo 2 no Klogg;
5. Também abra o arquivo de texto "relatorio_nivel1.txt" no diretório "rel". Esse pode ser aberto no bloco de notas mesmo;
6. Procure no relatório o número que aparece abaixo do campo "num.registro";
7. Dentro do Klogg, pressione a combinação de teclas Ctrl + F;
8. Na parte inferior da tela surgirá um campo de texto. Digite o número visualizado no passo 6;
9. Depois, clique no botão "Next" que aparece à direita do campo;

## **7. Notas para desenvolvedores**

O Covid19Tab até a versão 1.1 foi desenvolvido inteiramente usando o paradigma de programação estruturada, ou seja, possuia apenas estruturas de sequência, decisão e iteração. Da versão 1.2 em diante, o projeto se tornou híbrido, utilizando tanto o paradigma de programção estruturada quanto o de programação orientado a objetos (OOP). Essa mudança na arquitetura do programa se tornou necessário após serem detectados erros resultantes da sobreposição de tarefas dos módulos. Esse problema foi resolvido utilizando a linguagem C# (orientada a objetos) que, por meio da utilização da classe "Task" e do método "Process.WaitForExit", resolveu o problema de travamentos e erros causados pela sobreposição de tarefas, harmonizando os processos e estabilizando o programa.

Para o desenvolvimento da versão 1.4 do Covid19Tab foram utilizadas três linguagens:

![](https://github.com/csis2/Covid19Tab/blob/master/img/harbour.jpg)

- **Harbour** (https://harbour.github.io): compõe a maioria do código usado para construir o programa. É uma linguagem open source que utiliza o padrão xBase e compila o código fonte usando o compilador hbmk2. Utiliza nesse programa o paradigma de programação estruturada.

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/c_sharp.jpg)

- **C#** (https://docs.microsoft.com/pt-br/dotnet/csharp/): é uma linguagem de programação desenvolvida pela Microsoft como parte da plataforma .NET. Nesse projeto foi utilizado o framework .NET Desktop Runtime versão 3.1.

![](https://github.com/csis2/Covid19Tab/blob/master/img/object_pascal.jpg)

- **Object Pascal** (https://www.remobjects.com/ps.aspx): linguagem de script em Pascal usada no Inno Setup (https://jrsoftware.org/isdl.php) para criar o arquivo de setup do Covid19Tab, o "InnoScript_for_Covid19Tab.iss".

![alt text](https://github.com/csis2/Covid19Tab/blob/1.3/img/visual_studio.jpg)
As versões anteriores do Covid19Tab utilizaram como ambiente de desenvolvimento (IDE) o HMG (https://sites.google.com/site/hmgweb/). A partir da versão 1.2 o IDE utilizado passou a ser o Visual Studio 2019, versão Community (https://visualstudio.microsoft.com/pt-br/). Para abrir o projeto Covid19Tab nesse ambiente de desenvolvimento, o desenvolvedor deve usar o arquivo "1.4.sln" presente no código fonte.

## **8. Comentários sobre essa versão**

* Em 2021, houve alteração dos arquivos CSV usados para processamento dos arquivos do tipo MP2_dados_unificados_COE.def e MP3_dados_unificados.def. Essa versão atualiza esses tipos de arquivos permitindo que o programa volte a processá-los, por meio da atualização desses modelos e das regras de negócio dentro do Covid19Tab.

* Não foi possível que o programa voltasse a processar os arquivos do tipo MP1 (), pois em 2021, quando houve mudanças no e-SUS VE Notifica, ocorreu também uma mudança na estrutura dos arquivos exportados por esse sistema. Infelizmente nessa mudança foi introduzido um bug no arquivo de exportação, pois anteriormente, havia em cada linha do arquivo de exportação, apenas um registro único e agora há dados de uma única notificação em várias linhas do arquivo de exportação, o que impede que o programa faça o normal processamento desse tipo de arquivo, o que não ocorre em arquivos do tipo MP2, MP3 e MP4.
A ilustração abaixo mostra esse problema usando o programa Klogg versão 21.04, usado na visualização de arquivos de log.














