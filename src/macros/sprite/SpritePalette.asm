.macro SpritePalette Index, Value
  SpriteTranslateIndex Index
  INY
  INY

  LDA SPRITE_ARRAY, Y
  AND #%11100000
  ORA Value
  STA SPRITE_ARRAY, Y
.endmacro
