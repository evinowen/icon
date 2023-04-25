.macro EntityHide Index
  LDA Index
  STA zero_a

  SpriteHide zero_a

  INC zero_a

  SpriteHide zero_a

  INC zero_a

  SpriteHide zero_a

  INC zero_a

  SpriteHide zero_a
.endmacro