.macro EntitySetYPosition Index, Value
  LDA Index
  STA zero_a

  LDA Value
  CLC
  ADC #$08
  STA zero_b

  SpriteSetYPosition zero_a, Value

  INC zero_a

  SpriteSetYPosition zero_a, Value

  INC zero_a

  SpriteSetYPosition zero_a, zero_b

  INC zero_a

  SpriteSetYPosition zero_a, zero_b
.endmacro