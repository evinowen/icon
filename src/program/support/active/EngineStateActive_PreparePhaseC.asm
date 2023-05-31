.proc EngineStateActive_PreparePhaseC
  JSR EngineStateActive_SpawnPlayer

  JSR EngineStateActive_SpawnEnemy

  LDA player_score_status
  ORA #PLAYER_SCORE_UPDATE
  STA player_score_status

  RTI
.endproc
