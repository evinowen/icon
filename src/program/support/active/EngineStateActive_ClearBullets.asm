.proc EngineStateActive_ClearBullets
  LDA #IDX_CREATURE_BULLET_A
  STA game_a

  Loop:
    SpriteHide game_a

    LoopVariable game_a, #IDX_CREATURE_BULLET_END, Loop

  RTS
.endproc
