.macro EntityFlipX Index
  LDA Index
  STA zero_a

  SpriteFlipX zero_a

  INC zero_a

  SpriteFlipX zero_a

  INC zero_a

  SpriteFlipX zero_a

  INC zero_a

  SpriteFlipX zero_a
.endmacro