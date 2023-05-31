.macro StoreByteLeftAs Variable, Target
  LDA Variable
  AND #%11110000

  CLC
  LSR A
  LSR A
  LSR A
  LSR A

  STA Target
.endmacro
