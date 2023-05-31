.proc EngineStateActive_Animate
  INC animated
  LDA animated

  CMP #$10
  BEQ animate_frame_reset
  CMP #$00
  BNE animate_frame_a
  animate_frame_reset:
    LDA #$00
    STA animated

    MMC3SetCHRBank #MMC3_CHR_SPRITE_B, #MMC3_STORE_C1
  animate_frame_a:

  CMP #$04
  BNE animate_frame_b

    MMC3SetCHRBank #MMC3_CHR_SPRITE_B, #MMC3_STORE_C3
  animate_frame_b:

  CMP #$08
  BNE animate_frame_c

    MMC3SetCHRBank #MMC3_CHR_SPRITE_B, #MMC3_STORE_C5
  animate_frame_c:

  CMP #$0C
  BNE animate_frame_d

    MMC3SetCHRBank #MMC3_CHR_SPRITE_B, #MMC3_STORE_C7
  animate_frame_d:

  RTS
.endproc
