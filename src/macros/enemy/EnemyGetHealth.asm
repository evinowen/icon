.macro EnemyGetHealth
  LDA enemy_object_index
  CLC
  ADC #ENEMY_HEALTH
  TAY

  LDA enemy_objects, Y
.endmacro
