.proc EngineStateActive_CollideBulletCheck
  SpriteGetYPosition game_b
  CMP game_c
  BCS NoHit

  SpriteGetYPosition game_b
  CLC
  ADC #$10
  CMP game_c
  BCC NoHit

  SpriteGetXPosition game_b
  CMP game_d
  BCS NoHit

  CLC
  ADC #$10
  CMP game_d
  BCC NoHit

  EntityHide game_b

  LDA player_score_credit
  CLC
  ADC #$FF
  STA player_score_credit

NoHit:
  RTS
.endproc
