.macro EnemyLoop Target
.local Loop, Exit
  LDA #$00
  STA enemy_object_index

  LDA #IDX_CREATURE_ENEMY_A
  STA enemy_entity_index

  Loop:
    JSR Target

    CMP #RETURN_CONTINUE
    BNE Exit

    LDA enemy_object_index
    ADC #ENEMY_SIZE
    STA enemy_object_index

    LoopVariable enemy_entity_index, #IDX_CREATURE_ENEMY_END, Loop, #IDX_CREATURE_ENEMY_INC

  Exit:

.endmacro
