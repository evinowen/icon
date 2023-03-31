.macro LoopX Value, Branch
  INX            ; Increment
  CPX Value      ; Compare Value
  BNE Branch     ; Loop back
.endmacro