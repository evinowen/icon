.macro SpriteSetBack Index
  SpriteTranslateIndex Index
  INY
  INY

  LDA SPRITE_ARRAY, Y
  ORA #%00100000
  STA SPRITE_ARRAY, Y
.endmacro
