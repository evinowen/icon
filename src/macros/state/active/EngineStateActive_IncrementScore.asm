.macro EngineStateActive_IncrementScore Variable, LeftStorage, RightStorage, ExitBranch
.local ExitRight, ExitLeft
  StoreByteLeftAs Variable, LeftStorage
  StoreByteRightAs Variable, RightStorage

  INC RightStorage

  GateValueNotEqual RightStorage, #$0A, ExitRight
    ExpressSplitByte LeftStorage, RightStorage
    STA Variable

    JMP ExitBranch
  ExitRight:

  INC LeftStorage

  GateValueNotEqual LeftStorage, #$0A, ExitLeft
    ExpressSplitByte LeftStorage, #$00
    STA Variable

    JMP ExitBranch
  ExitLeft:

  LDA #$00
  STA Variable
.endmacro
