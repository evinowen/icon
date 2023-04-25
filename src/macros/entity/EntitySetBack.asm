.macro EntitySetBack Index
  LDA Index
  STA zero_a

  SpriteSetBack zero_a

  INC zero_a

  SpriteSetBack zero_a

  INC zero_a

  SpriteSetBack zero_a

  INC zero_a

  SpriteSetBack zero_a
.endmacro
