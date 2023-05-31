.macro StoreByteRightAs Variable, Target
  LDA Variable
  AND #%00001111

  STA Target
.endmacro
