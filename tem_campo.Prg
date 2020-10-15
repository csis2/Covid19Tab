#include <hmg.ch>
declare window Main

* Verifica se os campos foram criados pelo módulo "cria_campo".

indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Verificando se os campos foram criados..." )
Main.List_1.Value:= (indice)

use (HB_DirBase()) + "tmp_covid19.dbf"
fTotal := fcount()

	  aCampo := {}
      FOR x := 1 TO fTotal
      AAdd( aCampo, fieldname( x ) )
   	  skip
      NEXT
	  close

nCount := 0
nFieldExist1 := AScan(aCampo,"SEM_NOT")
if nFieldExist1 != 0
nCount ++
endif

nFieldExist2 := AScan(aCampo,"NU_ANO")
if nFieldExist2 != 0
nCount ++
endif

nFieldExist3 := AScan(aCampo,"ID_MN_RESI")
if nFieldExist3 != 0
nCount ++
endif

nFieldExist4 := AScan(aCampo,"ID_RG_RESI")
if nFieldExist4 != 0
nCount ++
endif

nFieldExist5 := AScan(aCampo,"UF_RESI")
if nFieldExist5 != 0
nCount ++
endif

nFieldExist6 := AScan(aCampo,"NU_IDADE_N")
if nFieldExist6 != 0
nCount ++
endif

nFieldExist7 := AScan(aCampo,"SEM_PRI")
if nFieldExist7 != 0
nCount ++
endif

nFieldExist8 := AScan(aCampo,"NOMEREGI")
if nFieldExist8 != 0
nCount ++
endif

nFieldExist9 := AScan(aCampo,"SIGLA")
if nFieldExist9 != 0
nCount ++
endif

nFieldExist10 := AScan(aCampo,"ID_MUNICIP")
if nFieldExist10 != 0
nCount ++
endif

nFieldExist11 := AScan(aCampo,"ID_REGIONA")
if nFieldExist11 != 0
nCount ++
endif

nFieldExist12 := AScan(aCampo,"SIGLA_NOT")
if nFieldExist12 != 0
nCount ++
endif

nFieldExist13 := AScan(aCampo,"UF_NOT")
if nFieldExist13 != 0
nCount ++
endif

nFieldExist14 := AScan(aCampo,"REGIO_NOT")
if nFieldExist14 != 0
nCount ++
endif

nFieldExist15 := AScan(aCampo,"ID_RACACOR")
if nFieldExist15 != 0
nCount ++
endif

nFieldExist16 := AScan(aCampo,"ID_EVOLUC")
if nFieldExist16 != 0
nCount ++
endif

nFieldExist17 := AScan(aCampo,"ID_TP_TEST")
if nFieldExist17 != 0
nCount ++
endif

nFieldExist18 := AScan(aCampo,"ID_ESTTEST")
if nFieldExist18 != 0
nCount ++
endif

nFieldExist19 := AScan(aCampo,"ID_CLA_FIN")
if nFieldExist19 != 0
nCount ++
endif

nFieldExist20 := AScan(aCampo,"ID_SOROLOG")
if nFieldExist20 != 0
nCount ++
endif

if nCount == 20
erro = 0
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Campos criados com sucesso." )
Main.List_1.Value:= (indice)
else
erro = 1
indice++
dt := dia_hora()
setProperty("Main", "List_1", "Item", (indice), (dt)+"Erro! Falha na criação dos campos." )
Main.List_1.Value:= (indice)
endif

Return Nil