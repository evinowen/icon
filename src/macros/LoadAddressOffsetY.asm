.macro LoadAddressOffsetY Source, Target
  LDA Source, Y
  STA Target
  LDA Source + 1, Y
  STA Target + 1
.endmacro
