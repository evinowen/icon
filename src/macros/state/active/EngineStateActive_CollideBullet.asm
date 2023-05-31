.macro EngineStateActive_CollideBullet Index
.local Loop
  LDA #IDX_CREATURE_ENEMY_A
  STA game_b

  SpriteGetYPosition Index
  CLC
  ADC #$04
  STA game_c

  SpriteGetXPosition Index
  CLC
  ADC #$04
  STA game_d

  Loop:
    JSR EngineStateActive_CollideBulletCheck
    LoopVariable game_b, #IDX_CREATURE_ENEMY_END, Loop, #IDX_CREATURE_ENEMY_INC

.endmacro
