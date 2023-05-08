.macro GateOnBit Variable, BitSignature, BranchExit
.local EndMacro
  CLC              ;; CLEAR CARRY to prepare for COMPARE
  LDA Variable     ;; LOAD Variable into ACCUMULATOR
  AND BitSignature ;; AND BitSignature to compare only bits in signature
  CMP BitSignature ;; COMPARE BitSignature to ensure all signature bits are set
  BEQ EndMacro     ;; BRANCH on CARRY SET because not all bits are set
    JMP BranchExit
EndMacro:
.endmacro

.macro GateOnBitThenClear Variable, BitSignature, BranchExit
  GateOnBit Variable, BitSignature, BranchExit

  LDA Variable
  SEC
  SBC BitSignature
  STA Variable
.endmacro
