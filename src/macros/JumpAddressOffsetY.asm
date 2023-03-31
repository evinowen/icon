.macro JumpAddressOffsetY Source
  LoadAddressOffsetY Source, address_jmp
  JMP (address_jmp)
.endmacro
