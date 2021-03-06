* Fun��o para substituir caracteres com acento por caracteres sem acentua��o.

Function remacent ( VQFAZ,cTexto )
IF VQFAZ="ANSI"
   // acento agudo - em modo ANSI
   cTexto := StrTran( cTexto, "�", "a" )
   cTexto := StrTran( cTexto, "�", "e" )
   cTexto := StrTran( cTexto, "�", "i" )
   cTexto := StrTran( cTexto, "�", "o" )
   cTexto := StrTran( cTexto, "�", "u" )
   cTexto := StrTran( cTexto, "�", "A" )
   cTexto := StrTran( cTexto, "�", "E" )
   cTexto := StrTran( cTexto, "�", "I" )
   cTexto := StrTran( cTexto, "�", "O" )
   cTexto := StrTran( cTexto, "�", "U" )
ELSE
   // acento agudo - em modo OEM
   cTexto := StrTran( cTexto, "�", "a" )
   cTexto := StrTran( cTexto, "�", "e" )
   cTexto := StrTran( cTexto, "�", "i" )
   cTexto := StrTran( cTexto, "�", "o" )
   cTexto := StrTran( cTexto, "�", "u" )
   cTexto := StrTran( cTexto, "�", "A" )
   cTexto := StrTran( cTexto, "�", "E" )
   cTexto := StrTran( cTexto, "�", "I" )
   cTexto := StrTran( cTexto, "�", "O" )
   cTexto := StrTran( cTexto, "�", "U" )
ENDIF

IF VQFAZ="ANSI"
   // acento circunflexo - em modo ANSI
   cTexto := StrTran( cTexto, "�", "a" )
   cTexto := StrTran( cTexto, "�", "e" )
   cTexto := StrTran( cTexto, "�", "i" )
   cTexto := StrTran( cTexto, "�", "o" )
   cTexto := StrTran( cTexto, "�", "u" )
   cTexto := StrTran( cTexto, "�", "A" )
   cTexto := StrTran( cTexto, "�", "E" )
   cTexto := StrTran( cTexto, "�", "I" )
   cTexto := StrTran( cTexto, "�", "O" )
   cTexto := StrTran( cTexto, "�", "U" )
ELSE
   // acento circunflexo - em modo OEM
   cTexto := StrTran( cTexto, "�", "a" )
   cTexto := StrTran( cTexto, "�", "e" )
   cTexto := StrTran( cTexto, "�", "i" )
   cTexto := StrTran( cTexto, "�", "o" )
   cTexto := StrTran( cTexto, "�", "u" )
   cTexto := StrTran( cTexto, "�", "A" )
   cTexto := StrTran( cTexto, "�", "E" )
   cTexto := StrTran( cTexto, "�", "I" )
   cTexto := StrTran( cTexto, "�", "O" )
   cTexto := StrTran( cTexto, "�", "U" )
ENDIF

IF VQFAZ="ANSI"
   // acento til - em modo ANSI
   cTexto := StrTran( cTexto, "�", "a" )
   cTexto := StrTran( cTexto, "�", "o" )
   cTexto := StrTran( cTexto, "�", "A" )
   cTexto := StrTran( cTexto, "�", "O" )
ELSE
   // acento til - em modo OEM
   cTexto := StrTran( cTexto, "�", "a" )
   cTexto := StrTran( cTexto, "�", "o" )
   cTexto := StrTran( cTexto, "�", "A" )
   cTexto := StrTran( cTexto, "�", "O" )
ENDIF

IF VQFAZ="ANSI"
   // ce-cedilha - em modo ANSI
   cTexto := StrTran( cTexto, "�", "c" )
   cTexto := StrTran( cTexto, "�", "C" )
ELSE
   // ce-cedilha - em modo OEM
   cTexto := StrTran( cTexto, "�", "c" )
   cTexto := StrTran( cTexto, "�", "C" )
ENDIF

IF VQFAZ="ANSI"
   // Enhe (alfabeto latino/espanhol) - em modo ANSI
   cTexto := StrTran( cTexto, "�", "n" )
   cTexto := StrTran( cTexto, "�", "N" )
ELSE
   // Enhe (alfabeto latino/espanhol) - em modo OEM
   cTexto := StrTran( cTexto, "�", "n" )
   cTexto := StrTran( cTexto, "�", "N" )
ENDIF

IF VQFAZ="ANSI"
   // acento trema - em modo ANSI
   cTexto := StrTran( cTexto, "�", "a" )
   cTexto := StrTran( cTexto, "�", "e" )
   cTexto := StrTran( cTexto, "�", "i" )
   cTexto := StrTran( cTexto, "�", "o" )
   cTexto := StrTran( cTexto, "�", "u" )
   cTexto := StrTran( cTexto, "�", "A" )
   cTexto := StrTran( cTexto, "�", "E" )
   cTexto := StrTran( cTexto, "�", "I" )
   cTexto := StrTran( cTexto, "�", "O" )
   cTexto := StrTran( cTexto, "�", "U" )
ELSE
   // acento trema - em modo OEM
   cTexto := StrTran( cTexto, "�", "a" )
   cTexto := StrTran( cTexto, "�", "e" )
   cTexto := StrTran( cTexto, "�", "i" )
   cTexto := StrTran( cTexto, "�", "o" )
   cTexto := StrTran( cTexto, "�", "u" )
   cTexto := StrTran( cTexto, "�", "A" )
   cTexto := StrTran( cTexto, "�", "E" )
   cTexto := StrTran( cTexto, "�", "I" )
   cTexto := StrTran( cTexto, "�", "O" )
   cTexto := StrTran( cTexto, "�", "U" )
ENDIF

IF VQFAZ="ANSI"
   // acento crase - em modo ANSI
   cTexto := StrTran( cTexto, "�", "a" )
   cTexto := StrTran( cTexto, "�", "e" )
   cTexto := StrTran( cTexto, "�", "i" )
   cTexto := StrTran( cTexto, "�", "o" )
   cTexto := StrTran( cTexto, "�", "u" )
   cTexto := StrTran( cTexto, "�", "A" )
   cTexto := StrTran( cTexto, "�", "E" )
   cTexto := StrTran( cTexto, "�", "I" )
   cTexto := StrTran( cTexto, "�", "O" )
   cTexto := StrTran( cTexto, "�", "U" )
ELSE
   // acento crase - em modo OEM
   cTexto := StrTran( cTexto, "�", "a" )
   cTexto := StrTran( cTexto, "�", "e" )
   cTexto := StrTran( cTexto, "�", "i" )
   cTexto := StrTran( cTexto, "�", "o" )
   cTexto := StrTran( cTexto, "�", "u" )
   cTexto := StrTran( cTexto, "�", "A" )
   cTexto := StrTran( cTexto, "�", "E" )
   cTexto := StrTran( cTexto, "�", "I" )
   cTexto := StrTran( cTexto, "�", "O" )
   cTexto := StrTran( cTexto, "�", "U" )
ENDIF
Return cTexto
