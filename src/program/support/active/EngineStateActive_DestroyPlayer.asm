.proc EngineStateActive_DestroyPlayer
  PlayerGetStatus
  CMP #PLAYER_STATUS_DESTROY
  BEQ PlayerIsDestroyed
    RTS

PlayerIsDestroyed:
  PlayerGetHealth
  CMP #$00
  BNE PlayerDestroyUpdate

PlayerNeedsCleared:
  EntityHide #IDX_CREATURE_PLAYER
  SpriteHide #IDX_CREATURE_PLAYER_FIRE

  LDA #GAME_DEATH
  STA game

  RTS

PlayerDestroyUpdate:
  EntityDestroy #IDX_CREATURE_PLAYER
  PlayerDecrementHealth
  RTS
.endproc
