.macro EntityGenericEntityGeneric Macro, Index, Value
  LDA Index
  STA zero_a

  Macro zero_a, Value

  INC zero_a

  Macro zero_a, Value

  INC zero_a

  Macro zero_a, Value

  INC zero_a

  Macro zero_a, Value
.endmacro