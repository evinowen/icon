.macro EngineStateActive_MoveEnemy
.local EnemyHasSpawned, EndMacro
  EnemyGetStatus
  CMP #ENEMY_STATUS_SPAWNED
  BEQ EnemyHasSpawned
    JMP EndMacro

EnemyHasSpawned:
  EntityIncrementYPosition enemy_entity_index, #$01

EndMacro:
.endmacro
