.proc EngineStateActive_Random
  LDX #$08     ; iteration count (generates 8 bits)
  LDA seed + 0

  :
    ASL A      ; shift the register
    ROL seed + 1
    BCC :+
      EOR #$2D   ; apply XOR feedback whenever a 1 bit is shifted out
    :
    DEX
    BNE :--

  STA seed + 0
  CMP #$00     ; reload flags

  RTS
.endproc

.include "program/support/active/EngineStateActive_PreparePhaseA.asm"
.include "program/support/active/EngineStateActive_PreparePhaseB.asm"
.include "program/support/active/EngineStateActive_PreparePhaseC.asm"

.include "program/support/active/EngineStateActive_Animate.asm"
.include "program/support/active/EngineStateActive_CollideEnemyPlayerBullets.asm"
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
  ;; Prepare the Scene
  PrepareEngineState #$00, EngineStateActive_PreparePhaseA
  PrepareEngineState #$01, EngineStateActive_PreparePhaseB
  PrepareEngineState #$02, EngineStateActive_PreparePhaseC

  ;; Process Static Animations
  JSR EngineStateActive_Animate

  ;; Spawn new Enemys against coolodwn
  Cooldown game_enemy_cooldown, EngineStateActive_SpawnEnemy

  ;; Reset the Player entity tile
  EntityTile #IDX_CREATURE_PLAYER, #$00

  ;; Cool Player weapon
  Cooldown game_weapon_heat

  ;; Loop Bullet Collisions
  EnemyLoop EngineStateActive_CollideEnemyPlayerBullets

  ;; Loop Entity Updates
  JSR EngineStateActive_UpdateBullets
  EnemyLoop EngineStateActive_UpdateEnemies

  ;; Process Player controller input
  EngineStateActive_ProcessController

  ;; Force engine fire to follow Player entity
  SpriteFollow #IDX_CREATURE_PLAYER_FIRE, #IDX_CREATURE_PLAYER, #$04, #$0F

  ;; Load updates for Score
  JSR EngineStateActive_ScoreUpdate

  ;; Process starfield scoll updates
  EngineStateActive_Scroll

  ;; Exit scene frame update
  RTI
