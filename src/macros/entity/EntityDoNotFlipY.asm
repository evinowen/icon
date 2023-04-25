.macro EntityDoNotFlipY Index
  LDA Index
  STA zero_a

  SpriteDoNotFlipY zero_a

  INC zero_a

  SpriteDoNotFlipY zero_a

  INC zero_a

  SpriteDoNotFlipY zero_a

  INC zero_a

  SpriteDoNotFlipY zero_a
.endmacro