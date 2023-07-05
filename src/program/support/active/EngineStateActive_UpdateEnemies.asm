.include "program/support/active/EngineStateActive_CollideEnemyPlayer.asm"
.include "program/support/active/EngineStateActive_DestroyEnemy.asm"

.proc EngineStateActive_UpdateEnemies
  EngineStateActive_MoveEnemy
  JSR EngineStateActive_DestroyEnemy
  JSR EngineStateActive_CollideEnemyPlayer

  LDA #RETURN_CONTINUE
  RTS
.endproc
