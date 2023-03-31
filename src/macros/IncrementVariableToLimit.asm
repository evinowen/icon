.macro IncrementVariableToLimit Variable, VariableLimit
  LDA Variable
  CLC
  ADC #$01
  CMP VariableLimit
  BCC :+
    LDA #$00
  :
  STA Variable
.endmacro
