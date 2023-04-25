.macro SpriteTranslateIndex Index
  LDA Index
  ASL A
  ASL A
  TAY
.endmacro
