.proc EngineStateActive_CollideEnemyPlayerBulletsCheck
  SpriteGetYPosition enemy_entity_index
  CMP game_c
  BCS NoHit

  SpriteGetYPosition enemy_entity_index
  CLC
  ADC #$10
  CMP game_c
  BCC NoHit

  SpriteGetXPosition enemy_entity_index
  CMP game_d
  BCS NoHit

  CLC
  ADC #$10
  CMP game_d
  BCC NoHit

  EnemyDestroy

  SpriteHide game_a

  LDA player_score_credit
  CLC
  ADC #$02
  STA player_score_credit

NoHit:
  RTS


.endproc
