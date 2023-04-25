.macro SpriteSetYPosition Index, Value
  SpriteTranslateIndex Index

  LDA Value
  STA SPRITE_ARRAY, Y
.endmacro
