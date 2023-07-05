.proc EngineStateActive_SpawnPlayer
  EntitySetFront #IDX_CREATURE_PLAYER
  EntityTile #IDX_CREATURE_PLAYER, #$00
  EntityPalette #IDX_CREATURE_PLAYER, #$00
  EntityDoNotFlipX #IDX_CREATURE_PLAYER
  EntityDoNotFlipY #IDX_CREATURE_PLAYER
  EntitySetYPosition #IDX_CREATURE_PLAYER, #$C0
  EntitySetXPosition #IDX_CREATURE_PLAYER, #$78

  SpriteSetFront #IDX_CREATURE_PLAYER_FIRE
  SpriteTile #IDX_CREATURE_PLAYER_FIRE, #$80
  SpritePalette #IDX_CREATURE_PLAYER_FIRE, #$01
  SpriteDoNotFlipX #IDX_CREATURE_PLAYER_FIRE
  SpriteDoNotFlipY #IDX_CREATURE_PLAYER_FIRE
  SpriteFollow #IDX_CREATURE_PLAYER_FIRE, #IDX_CREATURE_PLAYER, #$04, #$20

  PlayerSetHealth #$01
  PlayerSetStatus #PLAYER_STATUS_SPAWNED

  RTS
.endproc
