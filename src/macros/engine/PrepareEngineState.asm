.macro PrepareEngineState PhaseIndex, PhaseBranch
.local EndMacro
  LDA game_prep
  CMP PhaseIndex
  BNE EndMacro
    INC game_prep

    JMP PhaseBranch
EndMacro:
.endmacro
