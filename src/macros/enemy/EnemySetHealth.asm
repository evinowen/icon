.macro EnemySetHealth Value
  LDA enemy_object_index
  CLC
  ADC #ENEMY_HEALTH
  TAY

  LDA Value
  STA enemy_objects, Y
.endmacro
