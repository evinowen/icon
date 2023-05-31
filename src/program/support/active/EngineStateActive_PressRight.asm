.proc EngineStateActive_PressRight
  EntityIncrementXPosition #IDX_CREATURE_PLAYER, #$02, #$EF
  EntityTile #IDX_CREATURE_PLAYER, #$04
  RTS
.endproc
