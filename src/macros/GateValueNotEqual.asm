.macro GateValueNotEqual Variable, Value, BranchExit
  LDA Variable
  CMP Value
  BEQ BranchExit
.endmacro
