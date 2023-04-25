.macro EntityFlipY Index
  LDA Index
  STA zero_a

  SpriteFlipY zero_a

  INC zero_a

  SpriteFlipY zero_a

  INC zero_a

  SpriteFlipY zero_a

  INC zero_a

  SpriteFlipY zero_a
.endmacro