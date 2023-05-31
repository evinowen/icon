.macro EngineStateActive_Scroll
  LDA scroll
  SEC
  SBC #$01
  CMP #$20
  BNE :+
    LDA #$EF
  :
  STA scroll
.endmacro
