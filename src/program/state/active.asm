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
    SpriteDecrementYPosition Index, #$03
EndMacro:
.endmacro

.macro EngineStateActive_CollideBullet Index
.local Loop
  LDA #IDX_CREATURE_ENEMY_A
  STA game_b

  SpriteGetYPosition Index
  CLC
  ADC #$04
  STA game_c

  SpriteGetXPosition Index
  CLC
  ADC #$04
  STA game_d

  JSR EngineStateActive_CollideBulletCheck
  ; Loop:
  ;   JSR EngineStateActive_CollideBulletCheck
  ;   LoopVariable game_b, #IDX_CREATURE_ENEMY_END, Loop, #IDX_CREATURE_ENEMY_INC

.endmacro

.proc EngineStateActive_CollideBulletCheck
  SpriteGetYPosition game_b
  CMP game_c
  BCS NoHit

  SpriteGetYPosition game_b
  CLC
  ADC #$10
  CMP game_c
  BCC NoHit

  SpriteGetXPosition game_b
  CMP game_d
  BCS NoHit

  CLC
  ADC #$10
  CMP game_d
  BCC NoHit

  EntityHide game_b

  LDA player_score_credit
  CLC
  ADC #$FF
  STA player_score_credit

NoHit:
  RTS
.endproc

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

.proc EngineStateActive_UpdateBullets
  LDA #IDX_CREATURE_BULLET_A
  STA game_a

  Loop:
    EngineStateActive_MoveBullet game_a
    EngineStateActive_CollideBullet game_a

    LoopVariable game_a, #IDX_CREATURE_BULLET_END, Loop

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

ENGINE_STATE_ACTIVE_PREP_P0:
  PPUClear

  LDA #$01
  STA scanline

  LDX #$02
  JSR MAPSetCHRBankActive
  JSR ScreenLoader

  PPUMaskHideSprites
  PPUMaskHideBackground

  LDA #$00
  STA color_index
  LDA #%10000000
  STA color_status

  LDA #PALETTE_ACTIVE
  STA palette

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
  SpriteTile #IDX_CREATURE_PLAYER_FIRE, #$80
  SpritePalette #IDX_CREATURE_PLAYER_FIRE, #$01
  SpriteDoNotFlipX #IDX_CREATURE_PLAYER_FIRE
  SpriteDoNotFlipY #IDX_CREATURE_PLAYER_FIRE
  SpriteFollow #IDX_CREATURE_PLAYER_FIRE, #IDX_CREATURE_PLAYER, #$04, #$20

  EntitySetFront #IDX_CREATURE_ENEMY_A
  EntityTile #IDX_CREATURE_ENEMY_A, #$30
  EntityPalette #IDX_CREATURE_ENEMY_A, #$00
  EntityDoNotFlipX #IDX_CREATURE_ENEMY_A
  EntityDoNotFlipY #IDX_CREATURE_ENEMY_A
  EntitySetYPosition #IDX_CREATURE_ENEMY_A, #$20
  EntitySetXPosition #IDX_CREATURE_ENEMY_A, #$78

  LDA player_score_status
  ORA #PLAYER_SCORE_UPDATE
  STA player_score_status

  RTI

ENGINE_STATE_ACTIVE:
  PrepareEngineState #$00, ENGINE_STATE_ACTIVE_PREP_P0
  PrepareEngineState #$01, ENGINE_STATE_ACTIVE_PREP_P1
  PrepareEngineState #$02, ENGINE_STATE_ACTIVE_PREP_P2

  .scope
  INC animated
  LDA animated

  CMP #$10
  BEQ animate_frame_reset
  CMP #$00
  BNE animate_frame_a
  animate_frame_reset:
    LDA #$00
    STA animated

    MMC3SetCHRBank #MMC3_CHR_SPRITE_B, #MMC3_STORE_C1
  animate_frame_a:

  CMP #$04
  BNE animate_frame_b

    MMC3SetCHRBank #MMC3_CHR_SPRITE_B, #MMC3_STORE_C3
  animate_frame_b:

  CMP #$08
  BNE animate_frame_c

    MMC3SetCHRBank #MMC3_CHR_SPRITE_B, #MMC3_STORE_C5
  animate_frame_c:

  CMP #$0C
  BNE animate_frame_d

    MMC3SetCHRBank #MMC3_CHR_SPRITE_B, #MMC3_STORE_C7
  animate_frame_d:

  .endscope

  EntityTile #IDX_CREATURE_PLAYER, #$00

  .scope
    LDA game_weapon_heat
    CMP #$00
    BEQ :+
      DEC game_weapon_heat
    :
  .endscope

  JSR EngineStateActive_UpdateBullets

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

  SpriteFollow #IDX_CREATURE_PLAYER_FIRE, #IDX_CREATURE_PLAYER, #$04, #$0F

  JSR EngineStateActive_ScoreUpdate

  EngineStateActive_Scroll

  RTI

.macro StoreByteLeftAs Variable, Target
  LDA Variable
  AND #%11110000

  CLC
  LSR A
  LSR A
  LSR A
  LSR A

  STA Target
.endmacro

.macro StoreByteRightAs Variable, Target
  LDA Variable
  AND #%00001111

  STA Target
.endmacro

.macro ExpressSplitByte ValueLeft, ValueRight
  LDA ValueLeft
  ASL A
  ASL A
  ASL A
  ASL A

.ifnblank ValueRight
  CLC
  ADC ValueRight
.endif
.endmacro

.macro EngineStateActive_IncrementScore Variable, LeftStorage, RightStorage, ExitBranch
.local ExitRight, ExitLeft
  StoreByteLeftAs Variable, LeftStorage
  StoreByteRightAs Variable, RightStorage

  INC RightStorage

  GateValueNotEqual RightStorage, #$0A, ExitRight
    ExpressSplitByte LeftStorage, RightStorage
    STA Variable

    JMP ExitBranch
  ExitRight:

  INC LeftStorage

  GateValueNotEqual LeftStorage, #$0A, ExitLeft
    ExpressSplitByte LeftStorage, #$00
    STA Variable

    JMP ExitBranch
  ExitLeft:

  LDA #$00
  STA Variable
.endmacro

.proc EngineStateActive_ScoreUpdate
  GateValueEqual player_score_credit, #$00, ExitNoCredit
    RTS
ExitNoCredit:

  DEC player_score_credit

  LDA player_score_status
  ORA #PLAYER_SCORE_UPDATE
  STA player_score_status

  EngineStateActive_IncrementScore player_score_a, store_a, store_b, ExitCreditComplete
  EngineStateActive_IncrementScore player_score_b, store_a, store_b, ExitCreditComplete
  EngineStateActive_IncrementScore player_score_c, store_a, store_b, ExitCreditComplete
  EngineStateActive_IncrementScore player_score_d, store_a, store_b, ExitCreditComplete

ExitCreditComplete:
  RTS
.endproc
