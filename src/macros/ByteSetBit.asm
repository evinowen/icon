.macro ByteSetBit Byte, Bit
  LDA Byte
  ORA Bit
  STA Byte
.endmacro
