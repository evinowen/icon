.macro SpriteFollow Index, Target, OffsetX, OffsetY
  SpriteGetXPosition Target
  .ifnblank OffsetX
    CLC
    ADC OffsetX
  .endif
  STA zero_a

  SpriteSetXPosition Index, zero_a

  SpriteGetYPosition Target
  .ifnblank OffsetX
    CLC
    ADC OffsetY
  .endif
  STA zero_a

  SpriteSetYPosition Index, zero_a
.endmacro
