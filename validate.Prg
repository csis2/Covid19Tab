#include <hmg.ch>

* Faz a validação de acordo com o resultado da comparação.

if erro = 0

resultado := 0
cFile6 := (HB_DirBase()) + "\comp_return.prn"
cString := HB_MEMOREAD (cFile6)
result1 := at( "correta" , cString )
result2 := at( "OK" , cString )
if result1 > 0
resultado ++
endif
if result2 > 0
resultado ++
endif
if resultado <= 0
erro = 1
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Erro! Arquivo e-SUS VE não foi validado." )
setProperty("Main", "List_1", "Value", (indice))
else
erro = 0
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Arquivo e-SUS VE foi validado." )
setProperty("Main", "List_1", "Value", (indice))
endif

endif

Return Nil
