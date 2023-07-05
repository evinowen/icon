.macro ByteClearBit Byte, Bit
  LDA Byte
  SEC
  SBC Bit
  STA Byte
.endmacro
