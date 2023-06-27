.include "program/support/active/EngineStateActive_SpawnEnemyLoop.asm"

.proc EngineStateActive_SpawnEnemy
  LDA #GAME_ENEMY_SPAWN_COOL
  STA game_enemy_cooldown

  EnemyLoop EngineStateActive_SpawnEnemyLoop

  RTS
.endproc
