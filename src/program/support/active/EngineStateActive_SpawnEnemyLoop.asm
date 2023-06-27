.proc EngineStateActive_SpawnEnemyLoop
  EnemyGetStatus
  CMP #ENEMY_STATUS_OPEN
  BEQ Spawn
    LDA #RETURN_CONTINUE
    RTS

  Spawn:
    EnemySetStatus #ENEMY_STATUS_SPAWNED
    EnemySetHealth #$01

    EntitySetFront enemy_entity_index
    EntityTile enemy_entity_index, #$30
    EntityPalette enemy_entity_index, #$00
    EntityDoNotFlipX enemy_entity_index
    EntityDoNotFlipY enemy_entity_index
    EntitySetYPosition enemy_entity_index, #$18

  Random:
    JSR EngineStateActive_Random
    STA zero_c
    CLC
    CMP #$F0
    BCS Random

    EntitySetXPosition enemy_entity_index, zero_c

  LDA #RETURN_EXIT
  RTS
.endproc
