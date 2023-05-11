ENGINE_STATE_DEATH_PREP_P0:
  PPUClear

  LDA #$00
  STA scanline

  LDX #$02
  JSR MAPSetCHRBankTitle
  JSR ScreenLoader

  PPUMaskHideSprites
  PPUMaskHideBackground

  LDA #$00
  STA color_index
  LDA #%10000000
  STA color_status

  JSR PPUNMIEnable

  RTI

ENGINE_STATE_DEATH_PREP_P1:
  LDA #PPUBACKGROUNDROOM_DEATH
  STA bg_current

  LDA #%10000000
  STA bg_status

  PPUMaskShowBackground

  LDA #$00
  STA scroll

  JSR PPUNMIEnable

  LDA #$A0
  STA tick

  RTI

ENGINE_STATE_DEATH:
  PrepareEngineState #$00, ENGINE_STATE_DEATH_PREP_P0
  PrepareEngineState #$01, ENGINE_STATE_DEATH_PREP_P1

  LDX tick
  CPX #$00
  BEQ :+
    DEX
    STX tick

    RTI
  :

  LDA #GAME_TITLE
  STA game

  RTI
