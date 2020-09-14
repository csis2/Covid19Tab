#include <hmg.ch>

declare window Main

* Altera o nome dos campos do arquivo selecionado pelo usuário e cria, no mesmo script,
* o arquivo "heading2.txt" que contém o cabeçalho do arquivo que foi alterado.

Function heading(x)

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Alterando o nome dos campos do arquivo exportado pelo e-SUS VE." )
setProperty("Main", "List_1", "Value", (indice))
wapi_ShellExecute( 0, 'open','cmd', '/c cd\&&cd ' + (x) + '&&sed 1d temp_covid19.txt > temp_covid19alfa.txt&&sed -i 1i\nu_notific;uf_notific;munic_not;profsaude;tel_contat;etnia;logradouro;evolucao;tipo_teste;uf_reside;numero;dt_notific;cbo;garganta;dispneia;febre;tosse;outros;dor_cabeca;gustativos;olfativos;coriza;assintomat;cep;prof_seg;resultado;raca_cor;sexo;estrang;tem_cpf;est_teste;cns;d_resp;d_card;diabetes;d_renais;imunosup;gestante;portador;puerpura;obesidade;bairro;dt_coleta;descricao;dt_encerra;dt_nasc;classi_fin;munic_res;complement;passaporte;cpf;nome;pais;dt_sintom;nome_mae;tel_cel;not_cnes;not_cpf;not_email;not_nome;not_cnpj temp_covid19alfa.txt&&sed -n 1p temp_covid19alfa.txt > heading2.txt',0,0)
Return Nil

