.macro EntityDestroy Index
  LDA Index
  STA zero_a

  SpriteDecrementXPosition zero_a, #$01
  SpriteDecrementYPosition zero_a, #$01

  INC zero_a

  SpriteIncrementXPosition zero_a, #$01
  SpriteDecrementYPosition zero_a, #$01

  INC zero_a

  SpriteDecrementXPosition zero_a, #$01
  SpriteIncrementYPosition zero_a, #$01

  INC zero_a

  SpriteIncrementXPosition zero_a, #$01
  SpriteIncrementYPosition zero_a, #$01
.endmacro