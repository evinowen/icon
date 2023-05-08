.macro LoopVariable Target, Value, Branch, Increment
.ifblank Increment
  INC Target
.endif
  LDA Target
.ifnblank Increment
  CLC
  ADC Increment
  STA Target
.endif
  CMP Value
  BNE Branch
.endmacro