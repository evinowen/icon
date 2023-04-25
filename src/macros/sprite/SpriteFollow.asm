.macro SpriteFollow Index, Target, OffsetX, OffsetY
  SpriteGetXPosition Target
  CLC
  ADC OffsetX
  STA zero_a

  SpriteSetXPosition Index, zero_a

  SpriteGetYPosition Target
  CLC
  ADC OffsetY
  STA zero_a

  SpriteSetYPosition Index, zero_a
.endmacro
