.macro GateValueEqual Variable, Value, BranchExit
  LDA Variable
  CMP Value
  BNE BranchExit
.endmacro
