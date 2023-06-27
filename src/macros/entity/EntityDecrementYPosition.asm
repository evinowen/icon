.macro EntityDecrementYPosition Index, Value, Min
.local EndMacro
  SpriteGetYPosition Index
  SEC
  SBC Value
.ifnblank Max
  BCC EndMacro
  CMP Min
  BCC EndMacro
.endif

  STA zero_c

  EntitySetYPosition Index, zero_c

EndMacro:
.endmacro