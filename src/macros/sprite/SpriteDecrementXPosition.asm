.macro SpriteDecrementXPosition Index, Value, Min
.local EndMacro
  SpriteTranslateIndex Index
  INY
  INY
  INY

  LDA SPRITE_ARRAY, Y
  SEC
  SBC Value

.ifnblank Min
  BCS EndMacro

  CMP Min
  BCS EndMacro

  LDA Min
.endif

EndMacro:
  STA SPRITE_ARRAY, Y
.endmacro
