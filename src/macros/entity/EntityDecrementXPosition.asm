.macro EntityDecrementXPosition Index, Value, Min
.local EndMacro
  SpriteGetXPosition Index
  SEC
  SBC Value
.ifnblank Max
  BCC EndMacro
  CMP Min
  BCC EndMacro
.endif

  STA zero_c

  EntitySetXPosition Index, zero_c

EndMacro:
.endmacro