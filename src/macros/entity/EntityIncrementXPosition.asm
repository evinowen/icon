.macro EntityIncrementXPosition Index, Value, Max
.local EndMacro
.ifnblank Max
  SpriteGetXPosition Index
  CLC
  ADC Value
  BCS EndMacro
  CMP Max
  BCS EndMacro
.endif

  LDA Index
  STA zero_a

  SpriteIncrementXPosition zero_a, Value

  INC zero_a

  SpriteIncrementXPosition zero_a, Value

  INC zero_a

  SpriteIncrementXPosition zero_a, Value

  INC zero_a

  SpriteIncrementXPosition zero_a, Value

EndMacro:
.endmacro