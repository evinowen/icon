.macro EnemyDecrementHealth
  LDA enemy_object_index
  CLC
  ADC #ENEMY_HEALTH
  TAY

  LDA enemy_objects, Y
  CLC
  SBC #$01
  STA enemy_objects, Y
.endmacro
