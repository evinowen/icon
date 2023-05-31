.proc EngineStateActive_UpdateEnemies
  LDA #IDX_CREATURE_ENEMY_A
  STA game_a

  Loop:
    EngineStateActive_MoveEnemy game_a

    LoopVariable game_a, #IDX_CREATURE_ENEMY_END, Loop

  RTS
.endproc
