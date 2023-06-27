.include "program/support/active/EngineStateActive_CollideEnemyPlayerBulletsCheck.asm"

.proc EngineStateActive_CollideEnemyPlayerBullets
  LDA #IDX_CREATURE_BULLET_A
  STA game_a

  Loop:
    SpriteGetYPosition game_a
    CLC
    ADC #$04
    STA game_c

    SpriteGetXPosition game_a
    CLC
    ADC #$04
    STA game_d

    JSR EngineStateActive_CollideEnemyPlayerBulletsCheck

    LoopVariable game_a, #IDX_CREATURE_BULLET_END, Loop

  LDA #RETURN_CONTINUE
  RTS
.endproc
