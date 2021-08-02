* FunÁ„o para substituir caracteres com acento por caracteres sem acentuaÁ„o.

Function remacent ( VQFAZ,cTexto )
IF VQFAZ="ANSI"
   // acento agudo - em modo ANSI
   cTexto := StrTran( cTexto, "·", "a" )
   cTexto := StrTran( cTexto, "È", "e" )
   cTexto := StrTran( cTexto, "Ì", "i" )
   cTexto := StrTran( cTexto, "Û", "o" )
   cTexto := StrTran( cTexto, "˙", "u" )
   cTexto := StrTran( cTexto, "¡", "A" )
   cTexto := StrTran( cTexto, "…", "E" )
   cTexto := StrTran( cTexto, "Õ", "I" )
   cTexto := StrTran( cTexto, "”", "O" )
   cTexto := StrTran( cTexto, "⁄", "U" )
ELSE
   // acento agudo - em modo OEM
   cTexto := StrTran( cTexto, "†", "a" )
   cTexto := StrTran( cTexto, "Ç", "e" )
   cTexto := StrTran( cTexto, "°", "i" )
   cTexto := StrTran( cTexto, "¢", "o" )
   cTexto := StrTran( cTexto, "£", "u" )
   cTexto := StrTran( cTexto, "µ", "A" )
   cTexto := StrTran( cTexto, "ê", "E" )
   cTexto := StrTran( cTexto, "÷", "I" )
   cTexto := StrTran( cTexto, "‡", "O" )
   cTexto := StrTran( cTexto, "È", "U" )
ENDIF

IF VQFAZ="ANSI"
   // acento circunflexo - em modo ANSI
   cTexto := StrTran( cTexto, "‚", "a" )
   cTexto := StrTran( cTexto, "Í", "e" )
   cTexto := StrTran( cTexto, "Ó", "i" )
   cTexto := StrTran( cTexto, "Ù", "o" )
   cTexto := StrTran( cTexto, "˚", "u" )
   cTexto := StrTran( cTexto, "¬", "A" )
   cTexto := StrTran( cTexto, " ", "E" )
   cTexto := StrTran( cTexto, "Œ", "I" )
   cTexto := StrTran( cTexto, "‘", "O" )
   cTexto := StrTran( cTexto, "€", "U" )
ELSE
   // acento circunflexo - em modo OEM
   cTexto := StrTran( cTexto, "É", "a" )
   cTexto := StrTran( cTexto, "à", "e" )
   cTexto := StrTran( cTexto, "å", "i" )
   cTexto := StrTran( cTexto, "ì", "o" )
   cTexto := StrTran( cTexto, "ñ", "u" )
   cTexto := StrTran( cTexto, "∂", "A" )
   cTexto := StrTran( cTexto, "“", "E" )
   cTexto := StrTran( cTexto, "◊", "I" )
   cTexto := StrTran( cTexto, "‚", "O" )
   cTexto := StrTran( cTexto, "Í", "U" )
ENDIF

IF VQFAZ="ANSI"
   // acento til - em modo ANSI
   cTexto := StrTran( cTexto, "„", "a" )
   cTexto := StrTran( cTexto, "ı", "o" )
   cTexto := StrTran( cTexto, "√", "A" )
   cTexto := StrTran( cTexto, "’", "O" )
ELSE
   // acento til - em modo OEM
   cTexto := StrTran( cTexto, "∆", "a" )
   cTexto := StrTran( cTexto, "‰", "o" )
   cTexto := StrTran( cTexto, "«", "A" )
   cTexto := StrTran( cTexto, "Â", "O" )
ENDIF

IF VQFAZ="ANSI"
   // ce-cedilha - em modo ANSI
   cTexto := StrTran( cTexto, "Á", "c" )
   cTexto := StrTran( cTexto, "«", "C" )
ELSE
   // ce-cedilha - em modo OEM
   cTexto := StrTran( cTexto, "á", "c" )
   cTexto := StrTran( cTexto, "Ä", "C" )
ENDIF

IF VQFAZ="ANSI"
   // Enhe (alfabeto latino/espanhol) - em modo ANSI
   cTexto := StrTran( cTexto, "Ò", "n" )
   cTexto := StrTran( cTexto, "—", "N" )
ELSE
   // Enhe (alfabeto latino/espanhol) - em modo OEM
   cTexto := StrTran( cTexto, "§", "n" )
   cTexto := StrTran( cTexto, "•", "N" )
ENDIF

IF VQFAZ="ANSI"
   // acento trema - em modo ANSI
   cTexto := StrTran( cTexto, "‰", "a" )
   cTexto := StrTran( cTexto, "Î", "e" )
   cTexto := StrTran( cTexto, "Ô", "i" )
   cTexto := StrTran( cTexto, "ˆ", "o" )
   cTexto := StrTran( cTexto, "¸", "u" )
   cTexto := StrTran( cTexto, "ƒ", "A" )
   cTexto := StrTran( cTexto, "À", "E" )
   cTexto := StrTran( cTexto, "œ", "I" )
   cTexto := StrTran( cTexto, "÷", "O" )
   cTexto := StrTran( cTexto, "‹", "U" )
ELSE
   // acento trema - em modo OEM
   cTexto := StrTran( cTexto, "Ñ", "a" )
   cTexto := StrTran( cTexto, "â", "e" )
   cTexto := StrTran( cTexto, "ã", "i" )
   cTexto := StrTran( cTexto, "î", "o" )
   cTexto := StrTran( cTexto, "Å", "u" )
   cTexto := StrTran( cTexto, "é", "A" )
   cTexto := StrTran( cTexto, "”", "E" )
   cTexto := StrTran( cTexto, "ÿ", "I" )
   cTexto := StrTran( cTexto, "ô", "O" )
   cTexto := StrTran( cTexto, "ö", "U" )
ENDIF

IF VQFAZ="ANSI"
   // acento crase - em modo ANSI
   cTexto := StrTran( cTexto, "‡", "a" )
   cTexto := StrTran( cTexto, "Ë", "e" )
   cTexto := StrTran( cTexto, "Ï", "i" )
   cTexto := StrTran( cTexto, "Ú", "o" )
   cTexto := StrTran( cTexto, "˘", "u" )
   cTexto := StrTran( cTexto, "¿", "A" )
   cTexto := StrTran( cTexto, "»", "E" )
   cTexto := StrTran( cTexto, "Ã", "I" )
   cTexto := StrTran( cTexto, "“", "O" )
   cTexto := StrTran( cTexto, "Ÿ", "U" )
ELSE
   // acento crase - em modo OEM
   cTexto := StrTran( cTexto, "Ö", "a" )
   cTexto := StrTran( cTexto, "ä", "e" )
   cTexto := StrTran( cTexto, "ç", "i" )
   cTexto := StrTran( cTexto, "ï", "o" )
   cTexto := StrTran( cTexto, "ó", "u" )
   cTexto := StrTran( cTexto, "∑", "A" )
   cTexto := StrTran( cTexto, "‘", "E" )
   cTexto := StrTran( cTexto, "ﬁ", "I" )
   cTexto := StrTran( cTexto, "„", "O" )
   cTexto := StrTran( cTexto, "Î", "U" )
ENDIF
Return cTexto
