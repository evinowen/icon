.macro SpriteDecrementYPosition Index, Value, Min
.local EndMacro
  SpriteTranslateIndex Index

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
