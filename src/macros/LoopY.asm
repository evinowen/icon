.macro LoopY Value, Branch
  INY            ; Increment
  CPY Value      ; Compare Value
  BNE Branch     ; Loop back
.endmacro