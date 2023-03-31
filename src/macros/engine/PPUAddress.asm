.macro PPUAddress HighByte, LowByte
  LDA HighByte
  STA $2006             ; write the high byte of $2000 address
  .ifnblank LowByte
  LDA LowByte
  .endif
  STA $2006             ; write the low byte of $2000 address
.endmacro
