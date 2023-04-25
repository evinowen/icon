.macro SpriteGetXPosition Index
  SpriteTranslateIndex Index
  INY
  INY
  INY

  LDA SPRITE_ARRAY, Y
.endmacro
