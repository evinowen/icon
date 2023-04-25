.macro PPUMaskShowSprites
  LDA ppu_mask
  ORA #%00010100
  STA ppu_mask
.endmacro
