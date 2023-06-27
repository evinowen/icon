.macro Cooldown Heat, Target
.local Condition, EndMacro
  LDA Heat
  CMP #$00
  BEQ Condition
    DEC Heat
    JMP EndMacro
Condition:

.ifnblank Target
  JSR Target
.endif

EndMacro:
.endmacro
