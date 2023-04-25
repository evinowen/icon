.macro SpriteSetXPosition Index, Value
  SpriteTranslateIndex Index
  INY
  INY
  INY

  LDA Value
  STA SPRITE_ARRAY, Y
.endmacro
