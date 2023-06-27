.proc EngineStateActive_DestroyEnemy
  EnemyGetStatus
  CMP #ENEMY_STATUS_DESTROY
  BEQ EnemyIsDestroyed
    RTS

EnemyIsDestroyed:
  EnemyGetHealth
  CMP #$00
  BNE EnemyDestroyUpdate

EnemyNeedsCleared:
  EnemyClear
  EntityHide enemy_entity_index
  RTS

EnemyDestroyUpdate:
  EntityDestroy enemy_entity_index
  EnemyDecrementHealth
  RTS
.endproc
