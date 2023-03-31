;; https://www.nesdev.org/wiki/PPU_OAM#DMA
.macro PPUSpriteDMA
  LDA #$00
  STA $2003
  LDA #$02
  STA $4014
.endmacro
