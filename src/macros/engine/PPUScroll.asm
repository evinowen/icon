;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PPU Scroll
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro PPUScroll PositionX, PositionY
  PPUStatus
  LDA PositionX
  STA $2005

  LDA PositionY
  STA $2005
.endmacro
