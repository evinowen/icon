.include "program/support/active/EngineStateActive_PreparePhaseA.asm"
.include "program/support/active/EngineStateActive_PreparePhaseB.asm"
.include "program/support/active/EngineStateActive_PreparePhaseC.asm"

.include "program/support/active/EngineStateActive_Animate.asm"
.include "program/support/active/EngineStateActive_CollideBulletCheck.asm"
.include "program/support/active/EngineStateActive_CoolWeapon.asm"
.include "program/support/active/EngineStateActive_PressDown.asm"
.include "program/support/active/EngineStateActive_PressFire.asm"
.include "program/support/active/EngineStateActive_PressLeft.asm"
.include "program/support/active/EngineStateActive_PressRight.asm"
.include "program/support/active/EngineStateActive_PressUp.asm"
.include "program/support/active/EngineStateActive_ScoreUpdate.asm"
.include "program/support/active/EngineStateActive_SpawnEnemy.asm"
.include "program/support/active/EngineStateActive_SpawnPlayer.asm"
.include "program/support/active/EngineStateActive_UpdateBullets.asm"
.include "program/support/active/EngineStateActive_UpdateEnemies.asm"

ENGINE_STATE_ACTIVE:
  PrepareEngineState #$00, EngineStateActive_PreparePhaseA
  PrepareEngineState #$01, EngineStateActive_PreparePhaseB
  PrepareEngineState #$02, EngineStateActive_PreparePhaseC

  JSR EngineStateActive_Animate

  EntityTile #IDX_CREATURE_PLAYER, #$00

  JSR EngineStateActive_CoolWeapon

  JSR EngineStateActive_UpdateEnemies
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
