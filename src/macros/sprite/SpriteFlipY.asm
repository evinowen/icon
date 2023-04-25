.macro SpriteFlipY Index
  SpriteTranslateIndex Index
  INY
  INY

  LDA SPRITE_ARRAY, Y
  ORA #%10000000
  STA SPRITE_ARRAY, Y
.endmacro
