.macro SpriteTile Index, Value
  SpriteTranslateIndex Index
  INY

  LDA Value
  STA SPRITE_ARRAY, Y
.endmacro
