;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PPU Scroll
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro PPUScroll PositionX, PositionY
  PPUStatus

  LDA PositionX
  STA $2005

  BIT $2002

  LDA PositionY
  STA $2006
  STA $2006
.endmacro
