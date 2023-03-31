.macro ResetSound
  LDY #$13
  :
    LDA ResetSound_Clear, Y
    STA $4000, Y
    DEY
    CMP #$00
    BNE :-

  LDA #$0F
  STA $4015

  LDA #$40
  STA $4017
.endmacro
