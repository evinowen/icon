.macro EntityIncrementYPosition Index, Value, Max
.local EndMacro
.ifnblank Max
  SpriteGetYPosition Index
  CLC
  ADC Value
  BCS EndMacro
  CMP Max
  BCS EndMacro
.endif

  LDA Index
  STA zero_a

  SpriteIncrementYPosition zero_a, Value

  INC zero_a

  SpriteIncrementYPosition zero_a, Value

  INC zero_a

  SpriteIncrementYPosition zero_a, Value

  INC zero_a

  SpriteIncrementYPosition zero_a, Value

EndMacro:
.endmacro