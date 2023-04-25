.macro PPUMaskHideBackground
  LDA ppu_mask
  AND #%11110101
  STA ppu_mask
.endmacro
