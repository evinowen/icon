.include "program/support/active/EngineStateActive_DestroyEnemy.asm"

.proc EngineStateActive_UpdateEnemies
  EngineStateActive_MoveEnemy
  JSR EngineStateActive_DestroyEnemy

  LDA #RETURN_CONTINUE
  RTS
.endproc
