.proc EngineStateActive_UpdateBullets
  LDA #IDX_CREATURE_BULLET_A
  STA game_a

  Loop:
    EngineStateActive_MoveBullet game_a
    EngineStateActive_CollideBullet game_a

    LoopVariable game_a, #IDX_CREATURE_BULLET_END, Loop

  RTS
.endproc
