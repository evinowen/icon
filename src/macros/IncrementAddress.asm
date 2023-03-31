.macro IncrementAddress Address, Value
  CLC
  LDA Address
  ADC Value
  STA Address
  LDA Address + 1
  ADC #$00
  STA Address + 1
.endmacro
