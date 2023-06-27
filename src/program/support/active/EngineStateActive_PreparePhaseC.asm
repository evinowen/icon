.proc EngineStateActive_PreparePhaseC
  LDA #GAME_ENEMY_SPAWN_COOL
  STA game_enemy_cooldown

  JSR EngineStateActive_SpawnPlayer

  LDA player_score_status
  ORA #PLAYER_SCORE_UPDATE
  STA player_score_status

  RTI
.endproc
