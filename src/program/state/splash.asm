ENGINE_STATE_SPLASH_PREP_P0:
  PPUClear

  LDX #$02
  JSR MAPSetCHRBankActive
  JSR ScreenLoader

  LDA ppu_mask
  AND #%11100111
  STA ppu_mask

  LDA #$00
  STA color_index
  LDA #%10000000
  STA color_status

  JSR PPUNMIEnable

  RTI

ENGINE_STATE_SPLASH_PREP_P1:
  LDA #PPUBACKGROUNDROOM_SPLASH
  STA bg_current

  LDA #%10000000
  STA bg_status

  LDA ppu_mask
  ORA #%00011000
  STA ppu_mask

  LDA #$00
  STA scroll_fy

  JSR PPUNMIEnable

  LDA #$A0
  STA tick

  RTI

ENGINE_STATE_SPLASH:
  PrepareEngineState #$00, ENGINE_STATE_SPLASH_PREP_P0
  PrepareEngineState #$01, ENGINE_STATE_SPLASH_PREP_P1

  LDX tick
  CPX #$00
  BEQ :+
    DEX
    STX tick

    RTI
  :

  LDA #GAME_ACTIVE
  STA game

  RTI
