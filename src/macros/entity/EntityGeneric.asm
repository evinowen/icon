.macro EntityGeneric Macro, Index
  LDA Index
  STA zero_a

  Macro zero_a

  INC zero_a

  Macro zero_a

  INC zero_a

  Macro zero_a

  INC zero_a

  Macro zero_a
.endmacro