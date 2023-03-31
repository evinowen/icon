.macro GateOffBit Variable, BitSignature, BranchExit
.local EndMacro
  CLC              ;; CLEAR CARRY to prepare for COMPARE
  LDA Variable     ;; LOAD Variable into ACCUMULATOR
  AND BitSignature ;; AND BitSignature to compare only bits in signature
  CMP BitSignature ;; COMPARE BitSignature to ensure all signature bits are set
  BEQ EndMacro     ;; BRANCH on EQUAL2 because all bits are set
    JMP BranchExit
EndMacro:
.endmacro

.macro GateOffBitThenSet Variable, BitSignature, BranchExit
  GateOffBit Variable, BitSignature, BranchExit

  LDA Variable
  ORA BitSignature
  STA Variable
.endmacro
