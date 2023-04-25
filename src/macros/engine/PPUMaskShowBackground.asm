.macro PPUMaskShowBackground
  LDA ppu_mask
  ORA #%00001010
  STA ppu_mask
.endmacro
