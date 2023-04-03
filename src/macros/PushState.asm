.macro PushState
  ;; PUSH to STACK
  PHA

  ;; Load X to A then PUSH to STACK
  TXA
  PHA

  ;; Load Y to A then PUSH to STACK
  TYA
  PHA
.endmacro
