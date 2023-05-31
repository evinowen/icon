.proc EngineStateActive_PressFire
  LDA game_weapon_heat
  CMP #$00
  BEQ WeaponCold
    RTS
  WeaponCold:

  LDX #$00
  LDA #IDX_CREATURE_BULLET_A
  STA game_a

  LoopXLabel:
    SpriteGetYPosition game_a
    CMP #$F0
    BCC PositionCheck
      SpriteFollow game_a, #IDX_CREATURE_PLAYER
      SpriteTile game_a, #$81
      SpritePalette game_a, #$01
      SpriteDoNotFlipY game_a
      SpriteDoNotFlipX game_a
      LDA game_weapon_cooldown
      STA game_weapon_heat
      RTS
    PositionCheck:

    INC game_a
    LoopX #$06, LoopXLabel

  RTS
.endproc
