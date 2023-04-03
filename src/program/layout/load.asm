LoadBackgroundFullSecond:
  LoadBackgroundTarget #$28, #$00, #$2B, #$C0
  RTS

LoadBackgroundFull:
  LoadBackgroundTarget #$20, #$00, #$23, #$C0
  RTS

LoadPalette:
  PPUStatus

  PPUAddress #$3F, #$00

  LDY #$00
  :
    LDA (address_a), Y
    STA $2007

    LoopY #$20, :-

  RTS
