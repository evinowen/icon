.macro SpriteIncrementXPosition Index, Value, Max
.local EndMacro
  SpriteGetXPosition Index

  CLC
  ADC Value

.ifnblank Max
  BCC EndMacro

  CMP Max
  BCC EndMacro

  LDA Max
.endif

EndMacro:
  STA SPRITE_ARRAY, Y
.endmacro
