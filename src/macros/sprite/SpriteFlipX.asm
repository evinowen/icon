.macro SpriteFlipX Index
  SpriteTranslateIndex Index
  INY
  INY

  LDA SPRITE_ARRAY, Y
  ORA #%01000000
  STA SPRITE_ARRAY, Y
.endmacro
