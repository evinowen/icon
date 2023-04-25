.macro EntityDoNotFlipX Index
  LDA Index
  STA zero_a

  SpriteDoNotFlipX zero_a

  INC zero_a

  SpriteDoNotFlipX zero_a

  INC zero_a

  SpriteDoNotFlipX zero_a

  INC zero_a

  SpriteDoNotFlipX zero_a
.endmacro