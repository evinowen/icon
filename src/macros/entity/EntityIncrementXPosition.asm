.macro EntityIncrementXPosition Index, Value, Max
.local EndMacro
  SpriteGetXPosition Index
  CLC
  ADC Value
.ifnblank Max
  BCS EndMacro
  CMP Max
  BCS EndMacro
.endif

  STA zero_c

  EntitySetXPosition Index, zero_c

EndMacro:
.endmacro