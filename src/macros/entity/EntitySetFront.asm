.macro EntitySetFront Index
  LDA Index
  STA zero_a

  SpriteSetFront zero_a

  INC zero_a

  SpriteSetFront zero_a

  INC zero_a

  SpriteSetFront zero_a

  INC zero_a

  SpriteSetFront zero_a
.endmacro
