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

  RTI

ENGINE_STATE_ACTIVE_PREP_P2:
  EntitySetFront #IDX_CREATURE_PLAYER
  EntityTile #IDX_CREATURE_PLAYER, #$00
  EntityPalette #IDX_CREATURE_PLAYER, #$00
  EntityDoNotFlipX #IDX_CREATURE_PLAYER
  EntityDoNotFlipY #IDX_CREATURE_PLAYER
  EntitySetYPosition #IDX_CREATURE_PLAYER, #$C0
  EntitySetXPosition #IDX_CREATURE_PLAYER, #$78

  EntitySetFront #$05
  EntityTile #$05, #$20
  EntityPalette #$05, #$00
  SpriteFollow #$05, #IDX_CREATURE_PLAYER, #$04, #$0F
  RTI

ENGINE_STATE_ACTIVE:
  PrepareEngineState #$00, ENGINE_STATE_ACTIVE_PREP_P0
  PrepareEngineState #$01, ENGINE_STATE_ACTIVE_PREP_P1
  PrepareEngineState #$02, ENGINE_STATE_ACTIVE_PREP_P2

  EntityTile #IDX_CREATURE_PLAYER, #$00

  .scope
    ControllerAGateDirectionUp UpEnd
      JSR EngineStateActive_PressUp
    UpEnd:

    ControllerAGateDirectionDown DownEnd
      JSR EngineStateActive_PressDown
    DownEnd:

    ControllerAGateDirectionLeft LeftEnd
      JSR EngineStateActive_PressLeft
    LeftEnd:

    ControllerAGateDirectionRight RightEnd
      JSR EngineStateActive_PressRight
    RightEnd:
  .endscope

  SpriteFollow #$05, #IDX_CREATURE_PLAYER, #$04, #$0A

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