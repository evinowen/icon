.macro EnemyGetStatus
  LDA enemy_object_index
  CLC
  ADC #ENEMY_STATUS
  TAY

  LDA enemy_objects, Y
.endmacro
