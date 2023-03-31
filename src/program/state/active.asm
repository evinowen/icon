ENGINE_STATE_ACTIVE_PREP_P0:
  PPUClear

  LDX #$02
  JSR MAPSetCHRBank
  JSR ScreenLoader

    ; ; Set bg_status to Update and Split, but clear remaining flags
    ; LDA #%11000000
    ; STA bg_status

    ; ; Enable the zero sprite
    ; LDA #$01
    ; STA zero

    ; ;; Screen status?
    ; LDA #%11000000
    ; STA screen_status

  LDA ppu_mask
  AND #%11100111
  STA ppu_mask

  LDA #$00
  STA color_index
  LDA #%10000000
  STA color_status

  JSR PPUNMIEnable

  RTI

ENGINE_STATE_ACTIVE_PREP_P1:
  LDA #$F2
  STA bg_current

  LDA #%10000000
  STA bg_status

  LDA ppu_mask
  ORA #%00001000
  STA ppu_mask

  LDA #$00
  STA scroll_fy

  JSR PPUNMIEnable

  LDA #$C0
  STA tick

  RTI

ENGINE_STATE_ACTIVE:
  PrepareEngineState #$00, ENGINE_STATE_ACTIVE_PREP_P0
  PrepareEngineState #$01, ENGINE_STATE_ACTIVE_PREP_P1

  INC scroll_fy

  LDX tick
  CPX #$00
  BEQ :+
    DEX
    STX tick

    RTI
  :

  LDA #GAME_DEATH
  STA game

  RTI
