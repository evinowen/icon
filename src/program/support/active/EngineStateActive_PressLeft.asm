.proc EngineStateActive_PressLeft
  EntityDecrementXPosition #IDX_CREATURE_PLAYER, #$02, #$00
  EntityTile #IDX_CREATURE_PLAYER, #$02
  RTS
.endproc
