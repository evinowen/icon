.macro LoadAddress Source, Target
  LDA Source
  STA Target
  LDA Source + 1
  STA Target + 1
.endmacro
