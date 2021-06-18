cls
@echo off
color 0a

REM Copiar o arquivo cecho.exe para:
REM C:\hb30\bin\

cecho {9F}*********************************************************
echo.
cecho {9F}* build_xbase.bat - CSIS Software 2021                  *
echo.
cecho {9F}* Compila automaticamente os arquivos prg do Covid19Tab *
echo.
cecho {9F}*********************************************************{default}
echo.
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Iniciando o processo...
echo.

cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Copiando arquivos prg...
echo.
cecho {0a}
copy C:\Covid19Tab\1.4\Covid19Tab\src\*.prg c:\hb30\bin\
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivos prg copiados.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao copiar arquivos.
echo.
pause
exit
)

cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Compilando os arquivos copiados...
echo.
cecho {0a}
cd\
cd c:\hb30\bin\
hbmk2 getdata.prg
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo compilado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao compilar arquivo.
echo.
pause
exit
)

cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Compilando os arquivos copiados...
echo.
cecho {0a}
cd\
cd c:\hb30\bin\
hbmk2 field_creation.prg
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo compilado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao compilar arquivo.
echo.
pause
exit
)

cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Compilando os arquivos copiados...
echo.
cecho {0a}
cd\
cd c:\hb30\bin\
hbmk2 load_fields.prg
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo compilado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao compilar arquivo.
echo.
pause
exit
)

cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Compilando os arquivos copiados...
echo.
cecho {0a}
cd\
cd c:\hb30\bin\
hbmk2 DBF_file.prg
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo compilado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao compilar arquivo.
echo.
pause
exit
)

cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Compilando os arquivos copiados...
echo.
cecho {0a}
cd\
cd c:\hb30\bin\
hbmk2 rwtext.prg
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo compilado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao compilar arquivo.
echo.
pause
exit
)

cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Compilando os arquivos copiados...
echo.
cecho {0a}
cd\
cd c:\hb30\bin\
hbmk2 transfer2.prg remacent.prg hbmisc.hbc hbct.hbc xhb.hbc
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo compilado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao compilar arquivo.
echo.
pause
exit
)

cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Compilando os arquivos copiados...
echo.
cecho {0a}
cd\
cd c:\hb30\bin\
hbmk2 detect.prg
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo compilado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao compilar arquivo.
echo.
pause
exit
)

cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Compilando os arquivos copiados...
echo.
cecho {0a}
cd\
cd c:\hb30\bin\
hbmk2 index.prg
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo compilado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao compilar arquivo.
echo.
pause
exit
)

cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Compilando os arquivos copiados...
echo.
cecho {0a}
cd\
cd c:\hb30\bin\
hbmk2 epidemio.prg
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo compilado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao compilar arquivo.
echo.
pause
exit
)

cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Compilando os arquivos copiados...
echo.
cecho {0a}
cd\
cd c:\hb30\bin\
hbmk2 fill_week.prg
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo compilado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao compilar arquivo.
echo.
pause
exit
)

cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Compilando os arquivos copiados...
echo.
cecho {0a}
cd\
cd c:\hb30\bin\
hbmk2 save.prg
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo compilado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao compilar arquivo.
echo.
pause
exit
)

cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Compilando os arquivos copiados...
echo.
cecho {0a}
cd\
cd c:\hb30\bin\
hbmk2 testa_dbf.prg
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo compilado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao compilar arquivo.
echo.
pause
exit
)

cd\
cd C:\Covid19Tab\1.4\Covid19Tab\bin\
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Copiando os arquivos compilados...
echo.
cecho {0a}
copy C:\hb30\bin\getdata.exe C:\Covid19Tab\1.4\Covid19Tab\bin\getdata.exe
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo copiado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao copiar arquivo.
echo.
pause
exit
)

cecho {0a}
copy C:\hb30\bin\field_creation.exe C:\Covid19Tab\1.4\Covid19Tab\bin\field_creation.exe
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo copiado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao copiar arquivo.
echo.
pause
exit
)

cecho {0a}
copy C:\hb30\bin\load_fields.exe C:\Covid19Tab\1.4\Covid19Tab\bin\load_fields.exe
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo copiado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao copiar arquivo.
echo.
pause
exit
)

cecho {0a}
copy C:\hb30\bin\DBF_file.exe C:\Covid19Tab\1.4\Covid19Tab\bin\DBF_file.exe
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo copiado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao copiar arquivo.
echo.
pause
exit
)

cecho {0a}
copy C:\hb30\bin\rwtext.exe C:\Covid19Tab\1.4\Covid19Tab\bin\rwtext.exe
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo copiado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao copiar arquivo.
echo.
pause
exit
)

cecho {0a}
copy C:\hb30\bin\transfer2.exe C:\Covid19Tab\1.4\Covid19Tab\bin\transfer2.exe
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo copiado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao copiar arquivo.
echo.
pause
exit
)

cecho {0a}
copy C:\hb30\bin\detect.exe C:\Covid19Tab\1.4\Covid19Tab\bin\detect.exe
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo copiado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao copiar arquivo.
echo.
pause
exit
)

cecho {0a}
copy C:\hb30\bin\index.exe C:\Covid19Tab\1.4\Covid19Tab\bin\index.exe
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo copiado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao copiar arquivo.
echo.
pause
exit
)

cecho {0a}
copy C:\hb30\bin\epidemio.exe C:\Covid19Tab\1.4\Covid19Tab\bin\epidemio.exe
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo copiado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao copiar arquivo.
echo.
pause
exit
)

cecho {0a}
copy C:\hb30\bin\fill_week.exe C:\Covid19Tab\1.4\Covid19Tab\bin\fill_week.exe
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo copiado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao copiar arquivo.
echo.
pause
exit
)

cecho {0a}
copy C:\hb30\bin\save.exe C:\Covid19Tab\1.4\Covid19Tab\bin\save.exe
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo copiado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao copiar arquivo.
echo.
pause
exit
)

cecho {0a}
copy C:\hb30\bin\testa_dbf.exe C:\Covid19Tab\1.4\Covid19Tab\bin\testa_dbf.exe
if %errorlevel% equ 0 (
cecho {0b}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Arquivo copiado.
echo.
) else (
cecho {0c}%date:~-10,2%/%date:~-7,2%/%date:~-4,4% %time:~0,2%:%time:~3,2%:%time:~6,2%-------Erro ao copiar arquivo.
echo.
pause
exit
)

pause