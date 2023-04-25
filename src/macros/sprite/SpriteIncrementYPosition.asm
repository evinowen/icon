.macro SpriteIncrementYPosition Index, Value, Max
.local EndMacro
  SpriteGetYPosition Index

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
