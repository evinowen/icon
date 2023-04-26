.macro EngineStateActive_Scroll
  LDA scroll
  SEC
  SBC #$01
  CMP #$20
  BNE :+
    LDA #$EF
  :
  STA scroll
.endmacro

.macro EngineStateActive_MoveBullet Index
.local EndMacro
  SpriteGetYPosition Index
  CMP #$F0
  BCS EndMacro
    SpriteDecrementYPosition Index, #$02
EndMacro:
.endmacro

ENGINE_STATE_ACTIVE_PREP_P0:
  PPUClear

  LDX #$02
  JSR MAPSetCHRBankActive
  JSR ScreenLoader

  PPUMaskHideSprites
  PPUMaskHideBackground

  LDA #$00
  STA color_index
  LDA #%10000000
  STA color_status

  JSR PPUNMIEnable

  RTI

ENGINE_STATE_ACTIVE_PREP_P1:
  LDA #PPUBACKGROUNDROOM_ACTIVE
  STA bg_current

  LDA #%10000000
  STA bg_status

  PPUMaskShowSprites
  PPUMaskShowBackground

  LDA #$EF
  STA scroll

  JSR PPUNMIEnable

  LDA #$FF
  STA tick

  LDA #$00
  STA game_weapon_heat

  LDA #$10
  STA game_weapon_cooldown

  RTI

ENGINE_STATE_ACTIVE_PREP_P2:
  EntitySetFront #IDX_CREATURE_PLAYER
  EntityTile #IDX_CREATURE_PLAYER, #$00
  EntityPalette #IDX_CREATURE_PLAYER, #$00
  EntityDoNotFlipX #IDX_CREATURE_PLAYER
  EntityDoNotFlipY #IDX_CREATURE_PLAYER
  EntitySetYPosition #IDX_CREATURE_PLAYER, #$C0
  EntitySetXPosition #IDX_CREATURE_PLAYER, #$78

  SpriteSetFront #IDX_CREATURE_PLAYER_FIRE
  SpriteTile #IDX_CREATURE_PLAYER_FIRE, #$20
  SpritePalette #IDX_CREATURE_PLAYER_FIRE, #$00
  SpriteFollow #IDX_CREATURE_PLAYER_FIRE, #IDX_CREATURE_PLAYER, #$04, #$0F
  RTI

ENGINE_STATE_ACTIVE:
  PrepareEngineState #$00, ENGINE_STATE_ACTIVE_PREP_P0
  PrepareEngineState #$01, ENGINE_STATE_ACTIVE_PREP_P1
  PrepareEngineState #$02, ENGINE_STATE_ACTIVE_PREP_P2

  EntityTile #IDX_CREATURE_PLAYER, #$00

  .scope
  LDA game_weapon_heat
  CMP #$00
  BEQ :+
    DEC game_weapon_heat
  :
  .endscope

  .scope
    ControllerAGateDirectionUp DirectionUpEnd
      JSR EngineStateActive_PressUp
    DirectionUpEnd:

    ControllerAGateDirectionDown DirectionDownEnd
      JSR EngineStateActive_PressDown
    DirectionDownEnd:

    ControllerAGateDirectionLeft DirectionLeftEnd
      JSR EngineStateActive_PressLeft
    DirectionLeftEnd:

    ControllerAGateDirectionRight DirectionRightEnd
      JSR EngineStateActive_PressRight
    DirectionRightEnd:

    ControllerAGateButtonA ButtonAEnd
      JSR EngineStateActive_PressFire
      JMP ButtonBEnd
    ButtonAEnd:

    ControllerAGateButtonB ButtonBEnd
      JSR EngineStateActive_PressFire
    ButtonBEnd:
  .endscope

  SpriteFollow #IDX_CREATURE_PLAYER_FIRE, #IDX_CREATURE_PLAYER, #$04, #$0A

  .scope
    EngineStateActive_MoveBullet #IDX_CREATURE_BULLET_A
    EngineStateActive_MoveBullet #IDX_CREATURE_BULLET_B
    EngineStateActive_MoveBullet #IDX_CREATURE_BULLET_C
    EngineStateActive_MoveBullet #IDX_CREATURE_BULLET_D
    EngineStateActive_MoveBullet #IDX_CREATURE_BULLET_E
    EngineStateActive_MoveBullet #IDX_CREATURE_BULLET_F
  .endscope

  EngineStateActive_Scroll

  ; LDX tick
  ; CPX #$00
  ; BEQ :+
  ;   DEX
  ;   STX tick

  ;   RTI
  ; :

  ; LDA #GAME_DEATH
  ; STA game

  RTI

  .proc EngineStateActive_PressUp
    EntityDecrementYPosition #IDX_CREATURE_PLAYER, #$02, #$20
    RTS
  .endproc

  .proc EngineStateActive_PressDown
    EntityIncrementYPosition #IDX_CREATURE_PLAYER, #$02, #$E0
    RTS
  .endproc

  .proc EngineStateActive_PressLeft
    EntityDecrementXPosition #IDX_CREATURE_PLAYER, #$02, #$00
    EntityTile #IDX_CREATURE_PLAYER, #$02
    RTS
  .endproc

  .proc EngineStateActive_PressRight
    EntityIncrementXPosition #IDX_CREATURE_PLAYER, #$02, #$EF
    EntityTile #IDX_CREATURE_PLAYER, #$04
    RTS
  .endproc

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
        SpriteTile game_a, #$20
        LDA game_weapon_cooldown
        STA game_weapon_heat
        RTS
      PositionCheck:

      INC game_a
      LoopX #$06, LoopXLabel

    RTS
  .endproc
