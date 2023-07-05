.proc EngineStateActive_PreparePhaseC
  ByteSetBit player_score_status, #PLAYER_SCORE_UPDATE

  LDA #GAME_ENEMY_SPAWN_COOL
  STA game_enemy_cooldown

  JSR EngineStateActive_SpawnPlayer

  RTI
.endproc
