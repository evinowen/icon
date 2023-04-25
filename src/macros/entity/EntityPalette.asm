.macro EntityPalette Index, Value
  LDA Index
  STA zero_a

  SpritePalette zero_a, Value

  INC zero_a

  SpritePalette zero_a, Value

  INC zero_a

  SpritePalette zero_a, Value

  INC zero_a

  SpritePalette zero_a, Value
.endmacro
