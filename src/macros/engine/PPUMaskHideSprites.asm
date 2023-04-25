.macro PPUMaskHideSprites
  LDA ppu_mask
  AND #%11101011
  STA ppu_mask
.endmacro
