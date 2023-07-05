.proc EngineStateActive_ClearEnemies
  EnemyClear
  EntityHide enemy_entity_index

  LDA #RETURN_CONTINUE
  RTS
.endproc
