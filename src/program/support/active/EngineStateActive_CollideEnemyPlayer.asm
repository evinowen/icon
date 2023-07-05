.proc EngineStateActive_CollideEnemyPlayer
  PlayerGetStatus
  CMP #PLAYER_STATUS_SPAWNED
  BNE NoHit

  LDA #IDX_CREATURE_PLAYER
  STA game_a

ValidateY:
  SpriteGetYPosition game_a
  STA game_c

  SpriteGetYPosition enemy_entity_index
  STA game_d
  CMP game_c
  BCS EnemyYGreater ; Enemy position greater than Player

  EnemyYLess:
    LDA game_c
    SEC
    SBC game_d
    CMP #GAME_ENEMY_COLLIDE
                    ; Expected maximum difference
    BCS NoHit       ; Greater or equal to maximum difference, No Hit
      JMP ValidateX

  EnemyYGreater:
    SEC
    SBC game_c
    CMP #GAME_ENEMY_COLLIDE
                    ; Expected maximum difference
    BCS NoHit       ; Greater or equal to maximum difference, No Hit

ValidateX:
  SpriteGetXPosition game_a
  STA game_c

  SpriteGetXPosition enemy_entity_index
  STA game_d
  CMP game_c
  BCS EnemyXGreater ; Enemy position greater than Player

  EnemyXLess:
    LDA game_c
    SEC
    SBC game_d
    CMP #GAME_ENEMY_COLLIDE
                    ; Expected maximum difference
    BCS NoHit       ; Greater or equal to maximum difference, No Hit
      JMP Hit

  EnemyXGreater:
    SEC
    SBC game_c
    CMP #GAME_ENEMY_COLLIDE
                    ; Expected maximum difference
    BCS NoHit       ; Greater or equal to maximum difference, No Hit

Hit:
  PlayerDestroy
  EnemyDestroy

NoHit:
  RTS

.endproc
