.macro EngineStateActive_FetchEnemyEntity Index
  LDX #$00

  LDA #IDX_CREATURE_ENEMY_A

  Loop:
    ADC #IDX_CREATURE_ENEMY_INC
    LoopX Index, Loop

  RTS
.endmacro
