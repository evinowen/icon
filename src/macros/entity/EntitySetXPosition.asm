.macro EntitySetXPosition Index, Value
  LDA Index
  STA zero_a

  LDA Value
  CLC
  ADC #$08
  STA zero_b

  SpriteSetXPosition zero_a, Value

  INC zero_a

  SpriteSetXPosition zero_a, zero_b

  INC zero_a

  SpriteSetXPosition zero_a, Value

  INC zero_a

  SpriteSetXPosition zero_a, zero_b
.endmacro