.macro SpriteDoNotFlipX Index
  SpriteTranslateIndex Index
  INY
  INY

  LDA SPRITE_ARRAY, Y
  AND #%10111111
  STA SPRITE_ARRAY, Y
.endmacro
