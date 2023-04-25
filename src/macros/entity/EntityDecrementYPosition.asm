.macro EntityDecrementYPosition Index, Value, Min
.local EndMacro
.ifnblank Max
  SpriteGetYPosition Index
  SEC
  SBC Value
  BCC EndMacro
  CMP Min
  BCC EndMacro
.endif

  LDA Index
  STA zero_a

  SpriteDecrementYPosition zero_a, Value

  INC zero_a

  SpriteDecrementYPosition zero_a, Value

  INC zero_a

  SpriteDecrementYPosition zero_a, Value

  INC zero_a

  SpriteDecrementYPosition zero_a, Value

EndMacro:
.endmacro