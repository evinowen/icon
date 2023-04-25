.macro SpriteDoNotFlipY Index
  SpriteTranslateIndex Index
  INY
  INY

  LDA SPRITE_ARRAY, Y
  AND #%01111111
  STA SPRITE_ARRAY, Y
.endmacro
