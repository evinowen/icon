.macro EntityTile Index, Value
  LDA Index
  STA zero_a

  LDA Value
  STA zero_b

  SpriteTile zero_a, zero_b

  INC zero_a
  INC zero_b

  SpriteTile zero_a, zero_b

  INC zero_a
  LDA zero_b
  CLC
  ADC #$0F
  STA zero_b

  SpriteTile zero_a, zero_b

  INC zero_a
  INC zero_b

  SpriteTile zero_a, zero_b
.endmacro