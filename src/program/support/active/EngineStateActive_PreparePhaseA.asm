.include "program/support/active/EngineStateActive_ClearBullets.asm"
.include "program/support/active/EngineStateActive_ClearEnemies.asm"

.proc EngineStateActive_PreparePhaseA
  PPUClear

  LDA #$00
  STA player_score_a
  STA player_score_b
  STA player_score_c
  STA player_score_d
  STA player_score_credit

  JSR EngineStateActive_ClearBullets
  EnemyLoop EngineStateActive_ClearEnemies

  LDA #$01
  STA scanline

  LDX #$02
  JSR MAPSetCHRBankActive
  JSR ScreenLoader

  PPUMaskHideSprites
  PPUMaskHideBackground

  LDA #$00
  STA color_index
  LDA #%10000000
  STA color_status

  LDA #PALETTE_ACTIVE
  STA palette

  JSR PPUNMIEnable

  RTI
.endproc
