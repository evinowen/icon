.proc EngineStateActive_PreparePhaseB
  LDA #PPUBACKGROUNDROOM_ACTIVE
  STA bg_current

  LDA #%10000000
  STA bg_status

  PPUMaskShowSprites
  PPUMaskShowBackground

  LDA #$EF
  STA scroll

  JSR PPUNMIEnable

  LDA #$FF
  STA tick

  LDA #$00
  STA game_weapon_heat

  LDA #$10
  STA game_weapon_cooldown

  RTI
.endproc
