.macro EnemySetStatus Value
  LDA enemy_object_index
  CLC
  ADC #ENEMY_STATUS
  TAY

  LDA Value
  STA enemy_objects, Y
.endmacro
