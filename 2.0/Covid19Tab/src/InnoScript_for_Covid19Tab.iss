; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Covid19Tab"
#define MyAppVersion "2.0"
#define MyAppPublisher "CSIS Software"
#define MyAppURL "https://github.com/csis2/Covid19Tab"
#define MyAppExeName "Covid19Tab.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
DisableWelcomePage=no
WizardImageFile=c:\Covid19Tab\2.0\Covid19Tab\img\covid19tab.bmp
AppId={{AE9DAB62-105C-4625-A0F7-D2317BD71EDF}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=c:\Covid19Tab\2.0\{#MyAppName}
DisableDirPage=yes
DisableProgramGroupPage=yes
; The [Icons] "quicklaunchicon" entry uses {userappdata} but its [Tasks] entry has a proper IsAdminInstallMode Check.
UsedUserAreasWarning=no
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=C:\Covid19Tab\2.0\Covid19Tab\bin
OutputBaseFilename=Covid19Tab_setup
SetupIconFile=C:\Covid19Tab\2.0\Covid19Tab\img\icone2.ico
Compression=lzma
SolidCompression=yes
WizardImageStretch=False
WizardStyle=modern
WizardSmallImageFile=C:\Covid19Tab\2.0\Covid19Tab\img\Covid19Tab_small.bmp

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Dirs]
Name: "C:\Covid19Tab\2.0\Covid19Tab\baseDBF"
Name: "C:\Covid19Tab\2.0\Covid19Tab\bin"
Name: "C:\Covid19Tab\2.0\Covid19Tab\doc"
Name: "C:\Covid19Tab\2.0\Covid19Tab\epi"
Name: "C:\Covid19Tab\2.0\Covid19Tab\mod"
Name: "C:\Covid19Tab\2.0\Covid19Tab\rel"
Name: "C:\Covid19Tab\2.0\Covid19Tab\set"
Name: "C:\Covid19Tab\2.0\Covid19Tab\tmp"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 6.1; Check: not IsAdminInstallMode

[Files]
Source: "C:\Covid19Tab\2.0\Covid19Tab\bin\Release\netcoreapp3.1\publish\Covid19Tab.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Covid19Tab\2.0\Covid19Tab\baseDBF\*"; DestDir: "{app}\baseDBF"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Covid19Tab\2.0\Covid19Tab\bin\*"; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "C:\Covid19Tab\2.0\Covid19Tab\doc\*"; DestDir: "{app}\doc"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Covid19Tab\2.0\Covid19Tab\epi\*"; DestDir: "{app}\epi"; Flags: ignoreversion
Source: "C:\Covid19Tab\2.0\Covid19Tab\mod\*"; DestDir: "{app}\mod"; Flags: ignoreversion
Source: "C:\Covid19Tab\2.0\Covid19Tab\rel\*"; DestDir: "{app}\rel"; Flags: ignoreversion
Source: "C:\Covid19Tab\2.0\Covid19Tab\set\*"; DestDir: "{app}\set"; Flags: ignoreversion
Source: "C:\Covid19Tab\2.0\Covid19Tab\tmp\*"; DestDir: "{app}\tmp"; Flags: ignoreversion
Source: "C:\Covid19Tab\2.0\Covid19Tab\bin\Release\netcoreapp3.1\publish\Covid19Tab.deps.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Covid19Tab\2.0\Covid19Tab\bin\Release\netcoreapp3.1\publish\Covid19Tab.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Covid19Tab\2.0\Covid19Tab\bin\Release\netcoreapp3.1\publish\Covid19Tab.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Covid19Tab\2.0\Covid19Tab\bin\Release\netcoreapp3.1\publish\Covid19Tab.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Covid19Tab\2.0\Covid19Tab\bin\Release\netcoreapp3.1\publish\Covid19Tab.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

