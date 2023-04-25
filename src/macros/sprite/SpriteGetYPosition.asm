.macro SpriteGetYPosition Index
  SpriteTranslateIndex Index

  LDA SPRITE_ARRAY, Y
.endmacro
