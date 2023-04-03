.macro PullState
  ;; PULL from STACK then store to Y
  PLA
  TAY

  ;; PULL from STACK then store to X
  PLA
  TAX

  ;; PULL from STACK
  PLA
.endmacro
