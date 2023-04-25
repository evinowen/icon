.macro EntityDecrementXPosition Index, Value, Min
.local EndMacro
.ifnblank Max
  SpriteGetXPosition Index
  SEC
  SBC Value
  BCC EndMacro
  CMP Min
  BCC EndMacro
.endif

  LDA Index
  STA zero_a

  SpriteDecrementXPosition zero_a, Value

  INC zero_a

  SpriteDecrementXPosition zero_a, Value

  INC zero_a

  SpriteDecrementXPosition zero_a, Value

  INC zero_a

  SpriteDecrementXPosition zero_a, Value

EndMacro:
.endmacro