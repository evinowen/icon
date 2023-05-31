.macro ExpressSplitByte ValueLeft, ValueRight
  LDA ValueLeft
  ASL A
  ASL A
  ASL A
  ASL A

.ifnblank ValueRight
  CLC
  ADC ValueRight
.endif
.endmacro
