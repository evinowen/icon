.macro IncrementAddressPreserveAcc Address, Value
  STA store_e
  IncrementAddress Address, Value
  LDA store_e
.endmacro
