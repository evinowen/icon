.macro SpriteSetFront Index
  SpriteTranslateIndex Index
  INY
  INY

  LDA SPRITE_ARRAY, Y
  AND #%11011111
  STA SPRITE_ARRAY, Y
.endmacro
