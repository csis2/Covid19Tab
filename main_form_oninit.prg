#include "hmg.ch"
#include "fileio.ch"

declare window Main

Function main_form_oninit

* Limpando os arrays.
clear gets

* Configurando variaveis de ambiente.
set date to british
set century on
set multiple off warning

* Encerra alguns processos específicos, caso estejam ativos.
wapi_ShellExecute( 0, 'open','cmd', '/c taskkill /F /IM altera.exe' ,0,0)
wapi_ShellExecute( 0, 'open','cmd', '/c taskkill /F /IM altera_campo.exe' ,0,0)
wapi_ShellExecute( 0, 'open','cmd', '/c taskkill /F /IM copyline.exe' ,0,0)
wapi_ShellExecute( 0, 'open','cmd', '/c taskkill /F /IM del_line.exe' ,0,0)
wapi_ShellExecute( 0, 'open','cmd', '/c taskkill /F /IM heading.exe' ,0,0)
wapi_ShellExecute( 0, 'open','cmd', '/c taskkill /F /IM transfer2.exe' ,0,0)
wapi_ShellExecute( 0, 'open','cmd', '/c taskkill /F /IM validate.exe' ,0,0)
wapi_ShellExecute( 0, 'open','cmd', '/c taskkill /F /IM sed.exe' ,0,0)

* Excluindo arquivos auxiliares.
delete file (HB_DirBase())+"\temp_covid19.txt"
delete file (HB_DirBase())+"\temp2_covid19.txt"
delete file (HB_DirBase())+"\temp2_covid19x.txt"
delete file (HB_DirBase())+"\comp_return.prn"
delete file (HB_DirBase())+"\esus_covid19.dbf"
delete file (HB_DirBase())+"\tmp_covid19.dbf"
delete file (HB_DirBase())+"\temp_covid19.dbf"
delete file (HB_DirBase())+"\temp_covid19.csv"
delete file (HB_DirBase())+"\molde1.dbf"
delete file (HB_DirBase())+"\molde2.dbf"
delete file (HB_DirBase())+"\molde3.dbf"
delete file (HB_DirBase())+"\molde4.dbf"
delete file (HB_DirBase())+"\molde5.dbf"
delete file (HB_DirBase())+"\heading2.txt"
delete file (HB_DirBase())+"\heading_ready.txt"
delete file (HB_DirBase())+"\temp_covid19beta.txt"
delete file (HB_DirBase())+"\temp_covid19alfa.txt"
delete file (HB_DirBase())+"\process.txt"
delete file (HB_DirBase())+"\epid.dbf"

* Excluindo arquivos temporarios criados pelo sed.exe.
locall_path1 := (HB_DirBase())
locall_line1 := '/c cd\&&cd  ' + (locall_path1) + '&&del sed??????'
wapi_ShellExecute( 0, 'open','cmd', (locall_line1) ,0,0)

* Excluindo arquivos de índice criados anteriormente.
locall_path2 := (HB_DirBase())
locall_line2 := '/c cd\&&cd  ' + (locall_path2) + '&&del *.cdx'
wapi_ShellExecute( 0, 'open','cmd', (locall_line2) ,0,0)

* Criando variaveis publicas.
public cFile := ""
public erro := 0
public indice := 0
public cData := ""
public cDBFFile := ""
public cDBFFile2 := ""
public cUnidF := ""
public lRegistrosInconsistentes := ""
public cSinan := ""
public nWaitingTime := ""
public cArg1 := ( HB_ArgV( 1 ))
public cArg2 := ( HB_ArgV( 2 ))
public nH := ""
public cPercent := ""
public nPercent := 0
public cHoraInicio := ""
public cHoraFim := ""

* Roda as instruções a seguir se o programa usa o argumento --heading_model.
if alltrim( HB_ArgV( 1 )) = "--heading_model"

if (nh := FCreate( (HB_DirBase())+"\covid19tab_log.txt" ) ) == F_ERROR
msgbox ("Não foi possível criar o arquivo de log.")
endif

dt := dia_hora()
FWrite( nH, (dt) + "Iniciando o log do modo --heading_model." + Chr(13) + Chr(10) )

cFile := alltrim( cArg2 )

if empty( cFile ) = .T.
msgbox ("Falta argumento indicando o arquivo.")
dt := dia_hora()
FWrite( nH, (dt) + "Falta argumento indicando o arquivo." + Chr(13) + Chr(10))
FClose( nH )
Main.Release()
endif

lArquivo := HB_FileExists( cFile )
if lArquivo = .F.
msgbox ("Arquivo indicado no argumento não existe.")
dt := dia_hora()
FWrite( nH, (dt) + "Arquivo indicado no argumento não existe." + Chr(13) + Chr(10))
FClose( nH )
Main.Release()
endif

Main.Button_1.Enabled := .F.
Main.Button_2.Enabled := .F.
Main.Button_3.Enabled := .F.
Main.item_x.Enabled := .F. // Desabilita o menu principal.
delete file (HB_DirBase())+"\heading_model.c19"
delete file (HB_DirBase())+"\covid19tab_log.txt"
heading_model_mode()
endif

* Le a tabela de configuração do programa.
use (HB_DirBase() + "settings.c19" )
cUnidF := uf
lRegistrosInconsistentes := registros
cSinan := sinan_net
nWaitingTime := time
close

if (empty(lRegistrosInconsistentes) = .T. .or. empty(cSinan) = .T. .or. empty(nWaitingTime) = .T. .or. empty(cUnidF) = .T.)
pergunta := msgyesno ("O programa não está totalmente configurado." + CRLF + "Deseja configurar agora?","Covid19Tab")
if pergunta = .T.
load_settings()
endif
endif

Return Nil
